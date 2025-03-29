//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
  {"BAT:", "/usr/bin/cat /sys/class/power_supply/BAT0/capacity | awk '{print $1\"%\"}'",    5,    0},
  {"BAT:", "/usr/bin/cat /sys/class/power_supply/BAT1/capacity | awk '{print $1\"%\"}'",    5,    0},
  {"AC:",  "/usr/bin/cat /sys/class/power_supply/AC/online     | awk '{print $1}'"     ,    5,    0},
  {"wlan0:", "/usr/bin/cat /sys/class/net/wlan0/operstate      | awk '{print $1}'"     ,    5,    0},
  {"enp0s31f6:", "/usr/bin/cat /sys/class/net/enp0s31f6/operstate | awk '{print $1}'"  ,    5,    0},
	{"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }'         | sed s/i//g"           ,	 30,		0},
	{"", "date '+%b %d (%a) %I:%M%p'"                                                    ,		5,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
