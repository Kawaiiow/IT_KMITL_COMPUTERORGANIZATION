#!/bin/bash

CODE=67070114

sudo mkdir -p /Acc-${CODE}_Dept
sudo chown acc01:account /Acc-${CODE}_Dept
sudo mkdir -p /Eng-${CODE}_Dept
sudo chown eng01:engineer /Eng-${CODE}_Dept
sudo mkdir -p /Mgr-${CODE}_Dept
sudo chown mgr01:manager /Mgr-${CODE}_Dept
sudo mkdir -p /Mgr-${CODE}_Dept/Mgr-${CODE}-PL
sudo chown mgr01:manager /Mgr-${CODE}_Dept/Mgr-${CODE}-PL

sudo setfacl -m u:acc01:rwx -m g:account:rx -m u:mgr01:r -m o:- /Acc-${CODE}_Dept
sudo setfacl -m g:account:r -m u:eng01:rwx -m g:engineer:rx -m g:manager:r -m o:- /Eng-${CODE}_Dept
sudo setfacl -m g:account:x -m g:engineer:x -m u:mgr01:rwx -m g:manager:rx -m o:x /Mgr-${CODE}_Dept
sudo setfacl -m u:mgr01:rw -m o:- /Mgr-${CODE}_Dept/Mgr-${CODE}-PL
