//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
  {"Vol:", "amixer get Master | grep -o -m 1 '[0-9]*%' | head -n 1", 0, 10},
  {"CPU:", "~/suckless/dwmblocks/cpu.sh", 1, 0},
  {"Disk:", "df -h -t ext4 | awk 'NR>1 {print $4}'", 60, 0},
	{"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
  {"Lang:", "xset -q|grep LED| awk '{ print $10 == 00000000 ? \"en\" : \"ru\" }'", 0, 1},
  {"Bat:", "echo \"$(cat /sys/class/power_supply/BAT1/capacity)%\"", 15, 0},
	{"", "date '+%b %d (%a) %I:%M%p'",					5,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
