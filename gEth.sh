#!/bin/sh

#Install Go note must have downleaded tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz
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
geth init ./genesis.json
geth --datadir /data --allow-insecure-unlock --password "" account new
geth --allow-insecure-unlock --rpc --http --ws --networkid 666 --datadir /data  init genesis.json

