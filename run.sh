#!/bin/bash

wget_options='-qO- -T 30 -t 1'

RED="\e[31m"
NC="\e[0m"

echo
echo "Checking internet connectivity (1):"
wget $wget_options https://www.google.com > /dev/null

if [ $? -ne 0 ]; then
    echo -ne "${RED}Error:${NC} Cannot get any traffic. Accessing Google.com failed"
else
    echo -ne "Google.com can be accessed. Internet connectivity"
fi
echo "(1/1)."

echo
echo "Downloading EICAR (3):"
wget $wget_options http://www.rexswain.com/eicar.com > /dev/null
if [ $? -ne 0 ]; then
    echo -ne "Ok: EICAR cannot be downloaded"
else
    echo -ne "${RED}Error:${ENDCOLOR} EICAR can be downloaded"
fi
echo "(1/3)."
wget $wget_options http://www.rexswain.com/eicar.zip > /dev/null
if [ $? -ne 0 ]; then
    echo -ne "Ok: EICAR cannot be downloaded"
else
    echo -ne "${RED}Error:${ENDCOLOR} EICAR can be downloaded"
fi
echo "(2/3)."
wget $wget_options http://www.rexswain.com/eicar2.zip > /dev/null
if [ $? -ne 0 ]; then
    echo -ne "Ok: EICAR cannot be downloaded"
else
    echo -ne "${RED}Error:${ENDCOLOR} EICAR can be downloaded"
fi
echo "(3/3)."

echo
echo "Downloading MP3 files (2):"
timeout 30 wget $wget_options http://www.gurbaniupdesh.org/multimedia/01-Audio%20Books/Baba%20Noadh%20Singh/000%20Introduction%20Bhai%20Sarabjit%20Singh%20Ji%20Gobindpuri.mp3  > /dev/null
if [ $? -ne 0 ]; then
    echo -ne "${RED}Error:${NC} Cannot download MP3 files"
else
    echo -ne "MP3 file can be downloaded normally"
fi
echo "(1/2)."

timeout 30 wget $wget_options http://www.theradiodept.com/media/mp3/david.mp3 > /dev/null
if [ $? -ne 0 ]; then
    echo -ne "${RED}Error:${NC} Cannot download MP3 files"
else
    echo -ne "MP3 file can be downloaded normally"
fi
echo "(2/2)."

echo
echo "Checking DLP(2)"

curl -s -o /dev/null -X POST http://dlptest.com/http-post -H "Content-Type:multipart/form-data; boundary=---------------------------52410911313245418552292478843" -d '-----------------------------52410911313245418552292478843\nContent-Disposition: form-data; name="item_meta[6]"\n\n371193356045439\n-----------------------------52410911313245418552292478843'
if [ $? -ne 0 ]; then
    echo -ne "Cannot leak data"
else
    echo -ne "${RED}Error:${NC} Data seems to be leaked"
fi
echo "(1/2)."
# wget --no-check-certificate https://secure.eicar.org/eicar.com
