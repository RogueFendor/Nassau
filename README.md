
#Nassau Coin creator

####Author: RogueFendor

##Summary##

Nassay coin creator provides users who wish to create one or multiple
Cryptographic currencies an easy way of coin creation by automating the
Coin creation process. Multiple coins can be created and uploaded straight
to github.
This project is in its infantry and should not be considered
as rock soldid solution for digital currency exchange rather it is viewed as an
educational attempt and oportunity to bring the blockchain technology to a wider audience.


##Install  Dependancies##

1. run sudo ./gui.sh

    this will prompt a menu similiar to the one shown below

    ![Menu1](/documentation/Menu1.png)


2. select "Install Dependancies"  

3. Press enter.

this will initialize the installation for the dependancies:

**Folowing packages are being installed!

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

a) You will be prompted to enter a new Coin Name enter the name for your Coin
b) You will be asked to enter a prefix for a public key just enter four random single digits 
c) You will be asked to enter a new abbreviation for your Coin example BTC for bitcoin

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
password=demo2015  
node=other nodes IP address

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