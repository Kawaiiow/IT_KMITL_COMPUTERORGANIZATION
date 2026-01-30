#!/bin/bash

sudo groupadd account
sudo groupadd engineer
sudo groupadd manager

sudo useradd acc01
sudo useradd acc02
sudo useradd eng01
sudo useradd eng02
sudo useradd mgr01
sudo useradd mgr02

sudo usermod -aG account acc01
sudo usermod -aG account acc02
sudo usermod -aG engineer eng01
sudo usermod -aG engineer eng02
sudo usermod -aG manager mgr01
sudo usermod -aG manager mgr02

