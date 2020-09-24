#!/bin/sh

# wondercake - easy traffic shaping with CAKE
#
# by Keegan Quinn <keegan@qtk.io>
# inspired by Wonder Shaper


if [ $# -eq 1 ]; then
    tc qdisc ls dev "$1"
    tc qdisc ls dev "ifb4${1}"
    exit
fi

if [ $# -eq 2 ]; then
    tc qdisc del dev "$2" root
    tc qdisc del dev "$2" ingress
    tc qdisc del dev "ifb4${2}" root
    exit
fi

if [ $# -ne 3 ]; then
    echo wondercake - easy traffic shaping with CAKE
    echo
    echo "Enable:  $0 <device> <downlink> <uplink>"
    echo "Disable: $0 remove <device>"
    echo "Status:  $0 <device>"
    echo
    echo Uplink and downlink values should be somewhat less than your actual
    echo maximum download and upload speed, in kilobits per second.
    exit
fi

DEV=$1
DOWNLINK=$2
UPLINK=$3


# clean existing qdiscs
tc qdisc del dev "$DEV" root       2> /dev/null > /dev/null
tc qdisc del dev "$DEV" ingress    2> /dev/null > /dev/null
tc qdisc del dev "ifb4${DEV}" root 2> /dev/null > /dev/null


# uplink
tc qdisc add dev "$DEV" root cake bandwidth "${UPLINK}kbit"


# downlink
ip link add name "ifb4${DEV}" type ifb
tc qdisc add dev "$DEV" handle ffff: ingress
tc qdisc add dev "ifb4${DEV}" root cake bandwidth "${DOWNLINK}kbit" besteffort
ip link set "ifb4${DEV}" up
tc filter add dev "$DEV" parent ffff: protocol all prio 10 u32 match u32 0 0 \
   flowid 1:1 action mirred egress redirect dev "ifb4${DEV}"
