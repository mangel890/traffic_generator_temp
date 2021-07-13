#!/bin/bash

wget_options='-qO- -T 30 -t 1'

RED="\e[31m"
ENDCOLOR="\e[0m"

echo -e "${RED}Red text${ENDCOLOR}"

echo
echo "Checking internet connectivity (1):"
wget $wget_options https://www.google.com > /dev/null

if [ $? -ne 0 ]; then
    echo -n "${RED}Error:${ENDCOLOR} Cannot get any traffic. Accessing Google.com failed"
else
    echo -n "Google.com can be accessed. Internet connectivity"
fi

echo
echo "Downloading EICAR (3):"
wget $wget_options http://www.rexswain.com/eicar.com > /dev/null
if [ $? -ne 0 ]; then
    echo -n "Ok: EICAR cannot be downloaded (1/3)."
else
    echo -n "${RED}Error:${ENDCOLOR} EICAR can be downloaded"
fi
wget $wget_options http://www.rexswain.com/eicar.zip > /dev/null
if [ $? -ne 0 ]; then
    echo -n "Ok: EICAR cannot be downloaded (2/3)."
else
    echo "Error: EICAR can be downloaded"
fi
wget $wget_options http://www.rexswain.com/eicar2.zip > /dev/null
if [ $? -ne 0 ]; then
    echo -n "Ok: EICAR cannot be downloaded (3/3)."
else
    echo -n "Error: EICAR can be downloaded"
fi

echo
echo "Downloading MP3 files (2):"
timeout 30 wget $wget_options http://www.gurbaniupdesh.org/multimedia/01-Audio%20Books/Baba%20Noadh%20Singh/000%20Introduction%20Bhai%20Sarabjit%20Singh%20Ji%20Gobindpuri.mp3  > /dev/null
if [ $? -ne 0 ]; then
    echo -n "Error, cannot download MP3 files"
else
    echo -n "MP3 file can be downloaded normally (1/2)."
fi
timeout 30 wget $wget_options http://www.theradiodept.com/media/mp3/david.mp3 > /dev/null
if [ $? -ne 0 ]; then
    echo -n "Error, cannot download MP3 files"
else
    echo -n "MP3 file can be downloaded normally (2/2)."
fi

echo
echo "Checking DLP(2)"

curl -s -o /dev/null -X POST http://dlptest.com/http-post -H "Content-Type:multipart/form-data; boundary=---------------------------52410911313245418552292478843" -d '-----------------------------52410911313245418552292478843\nContent-Disposition: form-data; name="item_meta[6]"\n\n371193356045439\n-----------------------------52410911313245418552292478843'
if [ $? -ne 0 ]; then
    echo -n "Cannot leak data"
else
    echo -n "Data seems to be leaked"
fi
echo "(1/2)."
# wget --no-check-certificate https://secure.eicar.org/eicar.com
