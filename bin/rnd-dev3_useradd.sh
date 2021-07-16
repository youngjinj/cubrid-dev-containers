#!/bin/bash

useradd bwkim
useradd shpark
useradd ctshim
useradd hgryoo
useradd youngjinj

cp -rT /etc/skel /home/bwkim
cp -rT /etc/skel /home/shpark
cp -rT /etc/skel /home/ctshim
cp -rT /etc/skel /home/hgryoo
cp -rT /etc/skel /home/youngjinj

chown -R bwkim:bwkim /home/bwkim
chown -R shpark:shpark /home/shpark
chown -R ctshim:ctshim /home/ctshim
chown -R hgryoo:hgryoo /home/hgryoo
chown -R youngjinj:youngjinj /home/youngjinj

echo "bwkim:password" | chpasswd
echo "shpark:password" | chpasswd
echo "ctshim:password" | chpasswd
echo "hgryoo:password" | chpasswd
echo "youngjinj:password" | chpasswd

usermod -aG wheel bwkim
usermod -aG wheel shpark
usermod -aG wheel ctshim
usermod -aG wheel hgryoo
usermod -aG wheel youngjinj
