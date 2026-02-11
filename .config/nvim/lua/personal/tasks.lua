local M = {}

-- helper: current timestamp
local function timestamp()
	return os.date("%Y-%m-%d %H:%M")
end

local function last_non_empty_line()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

	for i = #lines, 1, -1 do
		if lines[i]:match("%S") then
			return i
		end
	end

	return 0
end

local function archive_path()
	local current = vim.api.nvim_buf_get_name(0)
	if current == "" then
		return nil
	end

	local dir = vim.fn.fnamemodify(current, ":h")
	return dir .. "/tasks_archive.txt"
end

local function ensure_file(path)
	if vim.fn.filereadable(path) == 0 then
		vim.fn.writefile({}, path)
	end
end

-- helper: get current line + row
local function current_line()
	local row = vim.api.nvim_win_get_cursor(0)[1] - 1
	local line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]
	return row, line
end

-- create new task via prompt
function M.create_task()
	vim.ui.input({ prompt = "New task: " }, function(input)
		if not input or input == "" then
			return
		end

		local line = string.format("[ ] %s | created: %s", input, timestamp())

		vim.api.nvim_put({ line }, "l", true, true)
	end)
end

-- toggle task done / undone
function M.toggle_task()
	local row, line = current_line()
	if not line then
		return
	end

	-- mark done
	if line:match("^%[%s*%]") then
		local done_line = line:gsub("^%[%s*%]", "[x]", 1) .. " | done: " .. timestamp()

		-- remove original line
		vim.api.nvim_buf_set_lines(0, row, row + 1, false, {})

		-- find insertion point
		local insert_at = last_non_empty_line()

		vim.api.nvim_buf_set_lines(0, insert_at, insert_at + 1, false, { done_line })

		return
	end

	-- undo task
	if line:match("^%[x%]") then
		line = line:gsub("^%[x%]", "[ ]", 1):gsub("%s*| done:.-$", "")

		vim.api.nvim_buf_set_lines(0, row, row + 1, false, { line })
	end
end

-- move completed tasks to bottom
function M.move_completed_to_bottom()
	local buf = 0
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

	local pending = {}
	local done = {}

	for _, line in ipairs(lines) do
		if line:match("^%[x%]") then
			table.insert(done, line)
		else
			table.insert(pending, line)
		end
	end

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.tbl_extend("force", pending, done))
end

function M.archive_tasks()
	local path = archive_path()
	if not path then
		vim.notify("No file to archive from", vim.log.levels.WARN)
		return
	end

	ensure_file(path)

	local buf = 0
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

	local remaining = {}
	local completed = {}

	for _, line in ipairs(lines) do
		if line:match("^%[x%]") then
			table.insert(completed, line .. " | archived: " .. timestamp())
		else
			table.insert(remaining, line)
		end
	end

	if #completed == 0 then
		vim.notify("No completed tasks to archive", vim.log.levels.INFO)
		return
	end

	-- append to archive file
	local archive_lines = vim.fn.readfile(path)
	if #archive_lines > 0 and archive_lines[#archive_lines]:match("%S") then
		table.insert(archive_lines, "")
	end

	vim.list_extend(archive_lines, completed)
	vim.fn.writefile(archive_lines, path)

	-- update current buffer
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, remaining)

	vim.notify(string.format("Archived %d task(s)", #completed), vim.log.levels.INFO)
end

-- commands
vim.api.nvim_create_user_command("TaskCreate", M.create_task, {})
vim.api.nvim_create_user_command("TaskToggle", M.toggle_task, {})
vim.api.nvim_create_user_command("TaskArchive", M.archive_tasks, {})

return M
