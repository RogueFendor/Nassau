#Nassau Coin Creator

## Dependancies
**Build your dependencies:**
* install dependencies for building
* sudo apt-get install build-essential libtool autotools-dev autoconf pkg-config
libssl-dev
* sudo apt-get install libboost-all-dev
* sudo add-apt-repository ppa:bitcoin/bitcoin
* sudo apt-get update
* sudo apt-get install libminiupnpc-dev

* sudo apt-get install libdb4.8-dev
* sudo apt-get install libdb4.8++-dev
* sudo apt-get install libboost1.37-dev
(If using Boost 1.37, append -mt to the boost libraries in the makefile)

##Check that litecoin compiles:

**USE this command to change your names (from within your working directory):**
* find ./ -type f -readable -writable -exec sed -i "s/Litecoin/Learncoin/g" {} \;
* find ./ -type f -readable -writable -exec sed -i "s/LiteCoin/LearnCoin/g" {} \;
* find ./ -type f -readable -writable -exec sed -i "s/LTC/LERN/g" {} \;
* find ./ -type f -readable -writable -exec sed -i "s/litecoin/learncoin/g" {} \;
* find ./ -type f -readable -writable -exec sed -i "s/litecoind/learncoind/g" {}\;
