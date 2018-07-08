#!/bin/bash
#!Coded by Suleman Malik
#!www.sulemanmalik.com
ln(){
	echo ''
	echo -e "\033[0;31m^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\033[0m"
	echo ''
}
bnk(){
	echo ''
}
clear
toilet BlockChain
echo -e "\033[0;32mby @SulemanMalik_3\033[0m                                               v1.2"
ln
echo "Bitcoin Address: "
read Address
bnk
ln
bnk
echo -e "\033[0;33m--- Processing Request ---\033[0m"
bnk
req=$(curl https://www.blockchain.com/en/btc/address/$Address >> _temp_bc)
Tr1=$(cat _temp_bc | grep -A1 "id=\"n_transactions\"" | sed -e 's/<[^>]*>//g' | sed 's/ //g' | Head -n 1)
Tr2=$(cat _temp_bc | grep -A1 "id=\"total_received\"" | sed -e 's/<[^>]*>//g' | sed -e 's/<[^>]*>//g' | sed 's/ //g' | Head -n 1)
fb=$(cat _temp_bc | grep -o '<font color="green">.*</font>' | Tail -n 1 | sed -e 's/<[^>]*>//g')
h160=$(cat _temp_bc | grep -A1 "class=\"mobile-f12\"" | tail -n 2 | sed -e 's/<[^>]*>//g' | sed 's/ //g' | Head -n 1)
qr='open https://blockchain.info/qr?data=$Address&size=200'
sleep 1
ln
echo "-- BTC Address Lookup ---"
bnk
sleep 1
echo -e "\033[0;33mNo. Transactions:\033[0m \033[0;32m$Tr1\033[0m"
bnk
sleep 1
echo -e "\033[0;33mTotal Received:\033[0m \033[0;32m$Tr2\033[0m"
bnk
sleep 1
echo -e "\033[0;33mFinal Balance:\033[0m \033[0;32m$fb\033[0m"
bnk
sleep 1
echo -e "\033[0;33mHash 160:\033[0m \033[0;32m$h160\033[0m"
bnk
sleep 1
echo -e "Opening QR for \033[0;32m$Address\033[0m"
sleep 1
eval $qr
bnk
echo "Process Done..."
ln
echo "Press return key to exit."
read ext
rm _temp_bc