#!/bin/bash
# -----------------------------------------------------------------------------
# Variables...
# -----------------------------------------------------------------------------
DATE=$(date "+%Y-%m-%d %H:%M:%S")
PROMP="[$DATE] - $PROCESS_NAME -"
RUBY_PROCESS_NAME="ruby"
#
# -----------------------------------------------------------------------------
# Functions...
# -----------------------------------------------------------------------------
function stopProcess {
	NAME=$1
	if [ -n "$(ps -ef | grep $NAME | grep -v grep | awk '{print $2}')" ]
	then
	     ps -ef | grep $NAME | grep -v grep | awk '{print $2}' | xargs kill -9

	     if [ ${?} = 0 ]
	     then
		  showMessage "$NAME processes shutdown..."
	     else
		  showMessage "Problem shutting down $NAME processes..."
	     fi
	else
	     showMessage "$NAME processes was not running..."
	fi
}

function showProcess {
	showMessage "Show runing process..."
	showMessage "PID's: $(ps -fea | grep $1 | awk '{print $2}' | sed ':a;N;$!ba;s/\n/, /g')."
}

function stopRubyProcess {
	stopProcess $RUBY_PROCESS_NAME
}

function showRubyProcess {
	showProcess $RUBY_PROCESS_NAME
}

function showMessage {
	echo "$PROMP $1"
}

function runRubyProcess {
	PROCESS_NAME=$1
	showMessage "Start \"$PROCESS_NAME\"..."
	rm -f $PROCESS_NAME.log
	ruby $PROCESS_NAME.rb > $PROCESS_NAME.log &
}

