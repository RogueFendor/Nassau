#!/bin/bash
# Proper header for a Bash script.

# coinCreator, version 1

# run as root to allow instalation of depancies
#
# Author: RogueFendor
# Email: RogueFendor@gmail.com
# https://github.com/SatoshiNXSimudrone
# https://github.com/RogueFendor

# Install dependancies


apt-get install build-essential libtool autotools-dev autoconf pkg-configlibssl-dev
apt-get install libboost-all-dev
add-apt-repository ppa:bitcoin/bitcoin
apt-get update
apt-get install libminiupnpc-dev
apt-get install libdb4.8-dev
apt-get install libdb4.8++-dev
apt-get install libdb++-dev
apt-get install libboost1.37-dev


# Change Coin Name

      # needs 2 arguments for the new name 

#find ./ -type f -readable -writable -exec sed -i "s/Litecoin/$1coin/g" {} \;
#find ./ -type f -readable -writable -exec sed -i "s/LiteCoin/$1Coin/g" {} \;
#find ./ -type f -readable -writable -exec sed -i "s/LTC/$2/g" {} \;
#find ./ -type f -readable -writable -exec sed -i "s/litecoin/$1coin/g" {} \;
#find ./ -type f -readable -writable -exec sed -i "s/litecoind/$1coind/g" {}\;

# Change bitcoin-qt.pro
#mv bitcoin-qt.pro $1coin-qt.pro
