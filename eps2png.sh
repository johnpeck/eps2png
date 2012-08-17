#!/bin/bash
# Name: eps2png.sh
#
# Converts an eps file to a png using ghostscript
# and imagemagick
#
# Usage: eps2png.sh <eps file to open>

set -e # bash should exit the script if any statement returns a non-true 
       #return value
if [ -z "$1" ]
then
    echo "Usage: eps2png.sh <eps file>"
else  
    # Create some temporary files with the same base name but
    # different file extensions.  Always quote filename parameters to
    # preserve space characters.
    pngfile="$(echo $1|sed 's/\..\{3\}$/.png/')"
    epsfile="$1"
    # Convert to png using ghostscript.
    gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 \
        -sOutputFile="$pngfile" -r300 "$epsfile"
    # Finally, use Imagemagick to trim the image.
    convert "$pngfile" -resize 600 -trim +repage "$pngfile"
fi
