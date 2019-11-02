#!bin/bash
clear
echo '   -- Menjalankan server -- '
echo -n '              .'
sleep 1s
echo -n '.'
sleep 1s
echo '.'
sleep 1s
echo -n 'Masukan Port: '
read port
echo 'Port Server : ' $port
ssh -T -R $port:localhost:$port serveo.net&


