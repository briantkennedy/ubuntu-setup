#!/bin/bash
#
# For making docker X11 apps look non crappy (otherwise it's a throwback to old
# timey X11 windows).
#

# Install theme chooser, and ubuntu themes
sudo apt-get install gtk-chtheme light-themes
echo "Select theme ambiance"
gtk-chtheme
