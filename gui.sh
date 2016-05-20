#!/bin/sh

# Proper header for a Bash script.

# coinCreator, version 1

# run as root to allow instalation of depancies
#
# Author: RogueFendor
#         Benjamin Keil
# Email: RogueFendor@gmail.com
# https://github.com/SatoshiNXSimudrone
# https://github.com/RogueFendor

file='/home/user9/work/conf.txt'
tempfile1=/tmp/dialog_1_$$
tempfile2=/tmp/dialog_2_$$
tempfile3=/tmp/dialog_3_$$

trap "rm -f $tempfile1 $tempfile2 $tempfile3" 0 1 2 5 15

_install () {

   # Install dependancies

apt-get install build-essential libtool autotools-dev autoconf pkg-configlibssl-dev
apt-get install libboost-all-dev
add-apt-repository ppa:bitcoin/bitcoin
apt-get update
apt-get install libboost­program­options­dev
apt-get install libminiupnpc-dev
apt-get install libdb4.8-dev
apt-get install libdb4.8++-dev
apt-get install libdb++-dev
apt-get install libboost1.37-dev
apt-get install libboost­thread­dev
apt-get install libcurl­4­openssl­dev
apt-get install libboost­filesystem­dev
apt-get install qt­sdk
apt-get install libminiupnpc­dev
apt-get install openssl

_main

}

_errorMessage () {


  dialog --begin 10 30 --backtitle "System Information" \
--title "Error" \
--msgbox 'Wrong format for Digits Enter 4 Digits. Digits will replace a Public Key index you need to enter 4 single digits' 10 30

_createCoin

}
_run () {}
_createCoin () {

javac Parser.java

coin=""
digits=""
acr=""
# open fd
exec 3>&1

# Store data to $VALUES variable
COIN=$(dialog --ok-label "Submit" \
    --backtitle "Nassau Menu" \
    --title "Nassau v.0.1" \
    --form "Nassau Set Up" \
30 100 0 \
  "Enter New Coin Name:"    1 1 "$coin"   2 1 10 0 \
2>&1 1>&3)

# close fd
exec 3>&-

clear
# open fd
exec 3>&1

# Store data to $VALUES variable
PUB_KEY_INDEX=$(dialog --ok-label "Submit" \
    --backtitle "Nassau Menu" \
    --title "Nassau v.0.1" \
    --form "Nassau Set Up" \
30 100 0 \
  "Enter 4 Single Digits:"  1 1 "$digit"  2 1 10 0 \
2>&1 1>&3)

# close fd
exec 3>&-

clear

# open fd
exec 3>&1

# Store data to $VALUES variable
ACR=$(dialog --ok-label "Submit" \
    --backtitle "Nassau Menu" \
    --title "Nassau v.0.1" \
    --form "Nassau Set Up" \
30 100 0 \
  "Enter Acronym for Coin:"  1 1 "$acr"  2 1 10 0 \
2>&1 1>&3)

# close fd
exec 3>&-

clear
# display values just entered
EP=`date +%s`

#echo "$COIN"
#echo "$PUB_KEY_INDEX"
#echo "$ACR"
VAR=`java Parser 1 $COIN`
DIGITS=`java Parser 2 $PUB_KEY_INDEX`
PUB_KEY=`java Parser 6 $COIN`

if [ $DIGITS -eq 0 ]
then
   _errorMessage $MESSAGE
fi


echo "[*] Copying new Sources"
cp -r tmp/sourceCoin sourceCoin
cp -r sourceCoin $COIN
cd $COIN
echo "[*] Starting to clean files"
echo "[*]   this may take a while!"

C1="coin"
C2="Coin"
C3="Coind"


find ./ -type f -readable -writable -exec sed -i "s/Learncoin/$VAR$C1/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/LearnCoin/$VAR$C2/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/learncoin/$VAR$C1/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/learnCoin/$VAR$C2/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/LTC/$ACR/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/ltc/$ACR/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/Learncoind/$VAR$C3/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/learncoind/$VAR$C3/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/LearnCoind/$VAR$C3/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/learnCoind/$VAR$C3/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/##EP##/$EP/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/##XX##/$PUB_KEY/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/##C##/$COIN/g" {} \;
echo "[*] creating new qt file"
mv bitcoin-qt.pro $COIN-qt.pro
echo "[*] creating new Directory for clean $COIN source"
mkdir ../clean
cp -r ../$COIN ../clean/$COIN
find ./ -type f -readable -writable -exec sed -i "s/##RG##//g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/##GB##//g" {} \;
echo "[*] Compiling $COIN source"
cd src
make -f makefile.unix USE_UNP=-
echo "[*] "
echo "[*] "
echo "[*] "
echo "[*] Done"
echo "[*] Preparing Merkle Root"
./$VAR$C3
echo "[*] Error Expected continue"
echo "[*] Executing tail -1 ~/.$VAR$C1/debug.log"

TMP=`tail -1 ~/.$VAR$C1/debug.log`
cd ..
cd ..

MERKLE_ROOT=`java Parser 3 $TMP`
cd $COIN
echo "[*] Setting MERKLE_ROOT"
find ./ -type f -readable -writable -exec sed -i "s/##MR##/$MERKLE_ROOT/g" {} \;
cd src
echo "[*] recompiling $COIN source"
make -f makefile.unix USE_UNP=-
echo "[*] executing ./$VAR$C3"
echo "[*] HASHING GENESIS BLOCK may take a while:"
./$VAR$C3

echo "[*] Finalising "
echo "[*] $VAR$C1/debug.log "
TMP2=`cat ~/.$VAR$C1/debug.log | grep block.nNonce`
TMP3=`cat ~/.$VAR$C1/debug.log | grep block.GetHash`
echo "[*] $TMP2"
echo "[*] $TMP3"
cd ..
cd ..
NONCE=`java Parser 4 $TMP2`
GET_HASH=`java Parser 4 $TMP3`

cd clean/$COIN
echo "[*] Creating clean Source "
find ./ -type f -readable -writable -exec sed -i "s/##CHP##/$GET_HASH/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/##RG##/$GET_HASH/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/##GB##/$GET_HASH/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/##MR##/$MERKLE_ROOT/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/block.nNonce   = 0;/block.nNonce   = $NONCE;/g" {} \;
echo "[*] recompiling clean Source "
cd src
make -f makefile.unix USE_UNP=-
echo "[*] executing ./$VAR$C3"
./$VAR$C3
}
_main () {
   dialog --title "Nassau Set Up" \
           --menu "Please choose an option:" 15 55 5 \
                   1 "Install Dependancies" \
                   2 "Create Coin" \
                   3 "First Run" \
                   4 "Exit from this menu" 2> $tempfile3

   retv=$?
   choice=$(cat $tempfile3)
   [ $retv -eq 1 -o $retv -eq 255 ] && exit

   case $choice in
       1) #dialog --textbox $file 0 0
          _install
           ;;
       2) _createCoin
           ;;
       3) _firstRun
           ;;
       4) clear
          exit ;;
   esac
}

_main
