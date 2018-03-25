#!/bin/sh -e
# inspired by https://gist.github.com/corny/7a07f5ac901844bd20c9
hostname=$1
device=$2
file=$HOME/.dynv6.addr6
[ -e $file ] && old=`cat $file`

if [ -z "$hostname" -o -z "$token" -o -z "$device" ]; then
  echo "Usage: token=<your-authentication-token> [netmask=64] $0 your-name.dynv6.net device"
  exit 1
fi

if [ -z "$netmask" ]; then
  netmask=128
fi

address=$(netstat -rn -I $device -W | awk '{print $4}' | grep '^[0-9a-f:]*$' | grep -v "^fe80:" | head -n 1)

which curl && bin="curl -fsS"
which wget && bin="wget -O-"
if [ -z "$bin" ]; then
  echo "neither curl nor wget found"
  exit 1
fi

if [ -z "$address" ]; then
  echo "no IPv6 address found"
  exit 1
fi

# address with netmask
current=$address/$netmask

if [ "$old" = "$current" ]; then
  echo "IPv6 address unchanged"
  exit
fi

# send addresses to dynv6
$bin "https://dynv6.com/api/update?hostname=$hostname&ipv6=$current&token=$token"
# $bin "https://ipv4.dynv6.com/api/update?hostname=$hostname&ipv4=auto&token=$token"

# save current address
echo $current > $file
