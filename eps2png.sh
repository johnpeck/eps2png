#!/bin/bash
# Name: eps2png.sh
#
# Converts an eps file to a png using ghostscript
# and imagemagick
#
# Usage: eps2png.sh <eps file to open> <width of png in pixels>

set -e # bash should exit the script if any statement returns a non-true 
       #return value
if [ -z "$2" ]
then
    echo "Usage: eps2png.sh <eps file> <png pixel width>"
else  
    # Create some temporary files with the same base name but
    # different file extensions.  Always quote filename parameters to
    # preserve space characters.
    pngfile="$(echo $1|sed 's/\..\{3\}$/.png/')"
    epsfile="$1"
    # Convert to png using ghostscript.
    gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 \
        -sOutputFile="$pngfile" -r300 "$epsfile"
    # Use Imagemagick to trim the image.
    convert "$pngfile" -trim +repage "$pngfile"
    # Finally, scale the image to a maximum pixel width.  Imagemagick
    # will maintain the aspect ratio.
    convert "$pngfile" -resize $2 "$pngfile"
fi
