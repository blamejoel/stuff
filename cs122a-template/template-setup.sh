#!/bin/bash
echo "Enter CS Login:"
read CSLOGIN
echo "Enter your name:"
read NAME
sed -i "12s/.*/NAME=\"${NAME}\"/" atmel-proj
sed -i "13s/.*/NETID=\"${CSLOGIN}\"/" atmel-proj

echo
echo "Name: ${NAME}, CS Login: ${CSLOGIN}"
echo

echo "atmel-proj is ready to rock!"
echo "Usage: ./atmel-proj [lab#] [part#]"
echo
