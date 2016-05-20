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
_uploadToGit () {

username=""
# open fd
exec 3>&1

# Store data to $VALUES variable
USERNAME=$(dialog --ok-label "Submit" \
    --backtitle "Nassau Menu" \
    --title "Nassau v.0.1" \
    --form "Nassau Set Up" \
30 100 0 \
  "Enter Github username Name:"    1 1 "$username"   2 1 25 0 \
2>&1 1>&3)

# close fd
exec 3>&-

clear
repo=""
# open fd
exec 3>&1

# Store data to $VALUES variable
REPO=$(dialog --ok-label "Submit" \
    --backtitle "Nassau Menu" \
    --title "Nassau v.0.1" \
    --form "Nassau Set Up" \
30 100 0 \
  "Enter Github Repository Name:"    1 1 "$repo"   2 1 25 0 \
2>&1 1>&3)

# close fd
exec 3>&-

clear

folder=""
# open fd
exec 3>&1

# Store data to $VALUES variable
FOLDER=$(dialog --ok-label "Submit" \
    --backtitle "Nassau Menu" \
    --title "Nassau v.0.1" \
    --form "Nassau Set Up" \
30 100 0 \
  "Enter Folder Name:"    1 1 "$folder"   2 1 25 0 \
2>&1 1>&3)

# close fd
exec 3>&-

clear
cd git/$FOLDER
rm README.md
echo "# $FOLDER " >> README.md
echo "#Automatically generated README.md#" >> README.md
echo "##Author: Benjamim Keil##" >> README.md
echo "##Email : roguefendor@gmail.com##" >> README.md
echo "##Github: https://github.com/RogueFendor" >> README.md
echo "###$FOLDER###" >> README.md
echo "Add Description here:" >> README.md

git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/$USERNAME/$FOLDER.git
git push -u origin master


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
  "Enter New Coin Name:"    1 1 "$coin"   2 1 25 0 \
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
  "Enter 4 Single Digits:"  1 1 "$digit"  2 1 25 0 \
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
  "Enter Acronym for Coin:"  1 1 "$acr"  2 1 25 0 \
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
find ./ -type f -readable -writable -exec sed -i "s/##EP##/$EP/g" {} \;
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
./$VAR$C2
echo "[*] Error Expected continue"
echo "[*] Executing tail -1 ~/.$VAR$C1/debug.log"

TMP=`tail -1 ~/.$VAR$C2/debug.log`
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
./$VAR$C2

echo "[*] Finalising "
echo "[*] $VAR$C1/debug.log "
TMP2=`cat ~/.$VAR$C2/debug.log | grep block.nNonce`
TMP3=`cat ~/.$VAR$C2/debug.log | grep block.GetHash`
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
cd ..
echo "[*] moving sources to git folder"

cp -r $COIN ../git

cd $COIN
echo "[*] recompiling clean Source "
cd src
make -f makefile.unix USE_UNP=-
echo "[*] executing ./$VAR$C3"
./$VAR$C2
}

_main () {
   dialog --title "Nassau Set Up" \
           --menu "Please choose an option:" 15 55 5 \
                   1 "Install Dependancies" \
                   2 "Create Coin" \
                   3 "Run" \
                   4 "Upload Clean sources to github" \
                   5 "Exit from this menu" 2> $tempfile3

   retv=$?
   choice=$(cat $tempfile3)
   [ $retv -eq 1 -o $retv -eq 255 ] && exit

   case $choice in
       1) #dialog --textbox $file 0 0
          _install
           ;;
       2) _createCoin
           ;;
       3) _run
           ;;
       4) _uploadToGit
           ;;
       5) clear
          exit ;;
   esac
}

_main
