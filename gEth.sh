#!/bin/sh

cd /local/repository/
#Install Go note must have downleaded tar.gz
wget -c https://golang.org/dl/go1.17.7.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.7.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version

#Install stable version of geth
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum

#Check if Geth installed
geth
#Make Data Cache
mkdir data

#Initialize geth node 
nohup geth --mine --minerthreads 1 --allow-insecure-unlock --rpc --http --ws --networkid 666 --datadir /data init genesis.json &
geth attach --exec "eth.blockNumber"
