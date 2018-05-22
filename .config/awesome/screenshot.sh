#!/bin/bash
slop=$(slop -f "%g") || exit 1
read -r G < <(echo $slop)
import -window root -crop $G /tmp/screenshot__.png
xclip -selection clipboard -target image/png -i /tmp/screenshot__.png
rm /tmp/screenshot__.png
