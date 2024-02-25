#!/bin/bash
# Remap mouse buttons

xinput
id=$(xinput \
  | grep "Evoluent VerticalMouse 3" \
  | sed -e 's/.*id=\([0-9]*\).*/\1/')

xinput list $id
xinput get-button-map $id
echo "above mapping represents button (index) to action (number)"
echo "Device ID=14"
echo "1. press the buttons which currently activate functions you care about"
echo "2. press the buttons which you want to use"
echo "3. change the mapping at that button index to the new number you want"
xinput test $id
