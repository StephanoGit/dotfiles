
#!/bin/sh

source ~/.config/sketchybar/colors.sh

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
9[0-9] | 100)
  ICON="􀛨"
  COLOR=$GREEN_COLOR_W
  ;;
[6-8][0-9])
  ICON="􀺸"
  COLOR=$GREEN_COLOR_W
  ;;
[3-5][0-9])
  ICON="􀺶"
  COLOR=$YELLOW_COLOR_W
  ;;
[1-2][0-9])
  ICON="􀛩"
  COLOR=$ORANGE_COLOR_W
  ;;
*)
  ICON="􀛪"
  COLOR=$RED_COLOR_W
  ;;
esac

if [[ $CHARGING != "" ]]; then
  ICON="􀢋"
  COLOR=$BLUE_COLOR_W
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set $NAME background.color=$COLOR icon="$ICON" label="${PERCENTAGE}%"

