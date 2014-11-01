#!/bin/zsh -f
# Purpose: Create a blank text file ready to go
#
# From:	Tj Luo.ma
# Mail:	luomat at gmail dot com
# Web: 	http://RhymesWithDiploma.com
# Date:	2014-10-31

DIR="$HOME/Dropbox/Drafts"

[[ ! -d "$DIR" ]] && mkdir -p "$DIR" || DIR="$HOME"

NAME="$0:t:r"

zmodload zsh/datetime

TIME=`strftime "%Y-%m-%d--%H.%M.%S" "$EPOCHSECONDS"`

function timestamp { strftime "%Y-%m-%d--%H.%M.%S" "$EPOCHSECONDS" }

TEMPFILE="$DIR/${NAME}.$HOST.${TIME}.$$.$RANDOM.txt"


if (( $+commands[bbedit] ))
then
	bbedit "$TEMPFILE" || open -t "$TEMPFILE" || open -e "$TEMPFILE"
elif (( $+commands[edit] ))
then
	edit "$TEMPFILE" || open -t "$TEMPFILE" || open -e "$TEMPFILE"
else
	open -t "$TEMPFILE" || open -e "$TEMPFILE"
fi



exit
#
#EOF
