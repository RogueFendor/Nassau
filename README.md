
#Nassau Coin creator

####Author: RogueFendor

##Summary##

Nassau coin creator provides users who wish to create one or multiple
Cryptographic currencies an easy way of coin creation by automating the
Coin creation process.
Multiple Coins can be created and uploaded straight
to github. Here is a Coin created and uploaded by Nassau

![Git1](/documentation/Git1.png)

This project is in its infantry and should not be considered
as rock solid solution for digital currency exchange, rather it is viewed as an
educational attempt and opportunity to bring the blockchain technology to a wider audience.

Here are some Screen shots about how and what we can do with the created Coins

You can execute the Coin directly from the Commandline:

![Term2](/documentation/Term2.png)

I compiled the Nassau Created clean sources of PirateCoin after i cloned
the repo on my Raspberry PI 2

![RPI2](/documentation/RPI.jpg)

As you can see here I executed PirateCoin and we have a connection

![Term4](/documentation/Term4.png)

And on my Local Machine

![Term3](/documentation/Term3.png)

In order to get information of the Coin wallet we execute 

./PirateCoin getInfo

On the Raspberry Pi we get:

![Term4](/documentation/Term4.png)

If you want to start CPU mining execute

./PirateCoin setgenerate true 4

![Term5](/documentation/Term5.png)

And to see progress simply execute ./PirateCoin getmininginfo

![Term6](/documentation/Term6.png)

WARNING:

This Implementation should not be used as working solution rather it is an
educational an learning process about Blockchains and crypto currencies in general

Special Thanks to:

Brian Sang, Solon High School




##Install  Dependancies##

1. run sudo ./gui.sh

    this will prompt a menu similiar to the one shown below

    ![Menu1](/documentation/Menu1.png)


2. select "Install Dependancies"  

3. Press enter.

this will initialize the installation for the dependancies:

**Folowing packages are being installed!**

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


##Create a Coin##

Run 

sudo ./gui.sh

This will prompt a gui similar to the one shown below.

![Menu1](/documentation/Menu2.png)

1. Select "Create Coin"

* a) You will be prompted to enter a new Coin Name enter the name for your Coin
* b) You will be asked to enter a prefix for a public key just enter four random single digits 
* c) You will be asked to enter a new abbreviation for your Coin example BTC for bitcoin

After the initial coin set up we beginn the main compilation and heash generation process.
This is essentially a very long process that compiles and recompiles your sources
The process takes a while so go and have a Coffee..
When the sources have finished compilation and genesis block s hashed the programm terminates 
and you can upload your new coin to git or run it.


##Run your Coin##

Run 

sudo ./gui.sh

This will prompt a gui similar to the one shown below.

![Menu3](/documentation/Menu3.png)


1. Select "Run"


Just type the path to the executable and select the file you want to execute
and press enter this will start the execution of your coin

Should you et an error that rpcpassword needs to be set up:

Add the following to ~/.yourCoin/yourCoin.conf

rpcuser=testUser 
rpcpassword=demo2015  
addnode=other nodes IP address

If You want to use this as first seed you need to setup a seed node to distribute the available connected wallets.
Otherwise you just can add an IP adress of a allready working running instance.
In future releases we will take care of the distribution of seed nodes.


##Upload clean Sources to Github##

Run 

sudo ./gui.sh

This will prompt a gui similar to the one shown below.

![Menu4](/documentation/Menu4.png)


1. Select "Upload Clean sources to github" 

You will be asked:

* To enter you github account username
* The Coin directory name within Nassau's git folder
* The Repository Name on github

If everything went well the clean sources of your coin are uploaded to git github
and available from the cloud.