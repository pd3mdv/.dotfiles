#!/usr/bin/env bash

#------------------------------------------------------------------------------#
#                                                                              #
#                                install-all.sh                                #
#                                                                              #
#------------------------------------------------------------------------------#
#
# Author       : Marcel de Vries
# Description  : install all packages script
# Version      : 1.0
#
#
#------------------------------------------------------------------------------#
#                                                                              #
#------------------------------------------------------------------------------#
VERBOSE=1
# Get a sane screen width
if [[ -t 1 ]]; then
  [ -z "${COLUMNS:-}" ] && COLUMNS=$(tput cols)
  # Column to start "[  OK  ]" label in:
  RES_COL=$(($(tput cols)-28))
  # terminal sequence to move to that column:
  MOVE_TO_COL="echo -en \\033[${RES_COL}G"
else
  TERM=dumb
fi
# Terminal sequence to set color to a 'success' (bright green):
SETCOLOR_SUCCESS="echo -en \\033[1;32m"
# Terminal sequence to set color to a 'failure' (bright red):
SETCOLOR_FAILURE="echo -en \\033[1;31m"
# Terminal sequence to set color to a 'warning' (bright yellow):
SETCOLOR_WARNING="echo -en \\033[1;33m"
# Terminal sequence to reset to the default color:
SETCOLOR_NORMAL="echo -en \\033[0;39m"

OPR_MSG[0]="installing packages"
OPR_MSG[1]="installing yay (AUR helper)"
OPR_MSG[2]="installing oh-my-zsh"
OPR_MSG[3]="set configurations with stow"
OPR_MSG[4]="installing tmux tpm"
readonly OPR_MSG

ERR_MSG[0]="Package installation failed!"
ERR_MSG[1]="Yay installation failed!"
ERR_MSG[2]="Oh-my-zsh installation failed!"
ERR_MSG[3]="Configuration setup failed!"
ERR_MSG[4]="Tmux tpm installation failed!"
readonly ERR_MSG

echo_status() {
    $MOVE_TO_COL
    printf "    ["
    if [ "${1}" -eq 0 ]; then
      $SETCOLOR_SUCCESS
      printf $"   OK   "
    elif [ "${1}" -eq 1 ]; then
      $SETCOLOR_FAILURE
      printf $" FAILED "
    elif [ "${1}" -eq 2 ]; then
      $SETCOLOR_WARNING
      printf $"  BUSY  "
    fi
      $SETCOLOR_NORMAL
    if ! [ "${1}" -eq 2 ]; then
      printf "]    \n"
    else
      printf "]    "
    fi
    return 0
}

task() {
    if ! [  "${VERBOSE}" -eq 0 ]; then
      printf '%.0s-' $(seq "${COLUMNS}")
      echo -n "[$(date +%T)] ${1}..." | tee -a "${LOG_FILE}"
      echo_status 2
      if ! TASK_OUTPUT=$("${@: 3}" 2>&1 > /dev/null); then
        echo_status 1
        echo -e "\nFailure: $2\n\n${TASK_OUTPUT}" | tee -a "${LOG_FILE}"
        echo >> "${LOG_FILE}"
        rm -f "${PIDFOLDER}${PID}"
        exit 0
      fi
      echo_status 0
      echo >> "${LOG_FILE}"
    else
      echo "[$(date +%T)] ${1}..." >> "${LOG_FILE}"
      if ! TASK_OUTPUT=$("${@: 3}" 2>&1 > /dev/null); then
        echo -e "[$(date +%T)] Failure: $2\n\n${TASK_OUTPUT}" >> "${LOG_FILE}"
        echo >> "${LOG_FILE}"
        rm -f "${PIDFOLDER}${PID}"
        exit 0
      fi
    fi
  return 0
}

usage() 
{
  echo "Usage: $(basename "$0") [-q] " 2>&1
  echo 'installing tool version 1.0'
  echo '   -q    Quiet, suppresses messages.'
  echo '   -h    Help, show usage.'
  exit 1
}

while getopts ":hq" opt; do
  case $opt in
     h)
       usage
       ;;
     q)
       VERBOSE=0
       ;;
     *)
       echo "invalid command"
       usage
       ;;
  esac
done


if [ -f /etc/arch-release ]; then
  task "${OPR_MSG[0]}" "${ERR_MSG[0]}" sudo ./install-packages-arch.sh
  task "${OPR_MSG[1]}" "${ERR_MSG[1]}" ./install-yay.sh
fi

task "${OPR_MSG[2]}" "${ERR_MSG[2]}" ./install-ohmyzsh.sh

task "${OPR_MSG[3]}" "${ERR_MSG[3]}" ./set-config-stow.sh

task "${OPR_MSG[4]}" "${ERR_MSG[4]}" ./install-tmux-tpm.sh
