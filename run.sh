#!/bin/bash

wget_options='-qO- -T 30 -t 1'


echo
echo "Checking internet connectivity (1):"
wget $wget_options https://www.google.com > /dev/null

if [ $? -ne 0 ]; then
    echo "Error, cannot get any traffic. Accessing Google.com failed"
    exit -1
else
    echo "Google.com can be accessed. Internet connectivity"
fi

echo
echo "Downloading EICAR (3):"
wget $wget_options http://www.rexswain.com/eicar.com > /dev/null
if [ $? -ne 0 ]; then
    echo "Ok: EICAR cannot be downloaded (1/3)."
else
    echo "Error: EICAR can be downloaded"
    exit -1
fi
wget $wget_options http://www.rexswain.com/eicar.zip > /dev/null
if [ $? -ne 0 ]; then
    echo "Ok: EICAR cannot be downloaded (2/3)."
else
    echo "Error: EICAR can be downloaded"
    exit -1
fi
wget $wget_options http://www.rexswain.com/eicar2.zip > /dev/null
if [ $? -ne 0 ]; then
    echo "Ok: EICAR cannot be downloaded (3/3)."
else
    echo "Error: EICAR can be downloaded"
    exit -1
fi

echo
echo "Downloading MP3 files (2):"
timeout 30 wget $wget_options http://www.gurbaniupdesh.org/multimedia/01-Audio%20Books/Baba%20Noadh%20Singh/000%20Introduction%20Bhai%20Sarabjit%20Singh%20Ji%20Gobindpuri.mp3  > /dev/null
if [ $? -ne 0 ]; then
    echo "Error, cannot download MP3 files"
    exit -1
else
    echo "MP3 file can be downloaded normally (1/2)."
fi
timeout 30 wget $wget_options http://www.theradiodept.com/media/mp3/david.mp3 > /dev/null
if [ $? -ne 0 ]; then
    echo "Error, cannot download MP3 files"
    exit -1
else
    echo "MP3 file can be downloaded normally (2/2)."
fi

echo
echo "Checking DLP(2)"

curl -X POST http://dlptest.com/http-post -H "Content-Type:multipart/form-data; boundary=---------------------------52410911313245418552292478843" -d '-----------------------------52410911313245418552292478843\nContent-Disposition: form-data; name="item_meta[6]"\n\n371193356045439\n-----------------------------52410911313245418552292478843'
if [ $? -ne 0 ]; then
    echo "Cannot leak data"
else
    echo "Warning: Data is leaked (1/2)."
fi
# wget --no-check-certificate https://secure.eicar.org/eicar.com
