#!/bin/bash
#
# Script for checking ping
#

BP_SITES="MYREN MY TH PKS ID PH VN TEST GIST TW IN"
LOG="/home/tein/infra_checking_software/result/ping.log"
TIME=`date`

echo -n $TIME >> $LOG 

for countryID in $BP_SITES
do

echo -n "," >> $LOG

VM_PING2=`ping SmartX-BPlus-$countryID -c 1 -W 20 | grep icmp_seq`

        if [ "${VM_PING2:-null}" = null ]; then
                echo -n "DOWN" >> $LOG 
        else
		echo -n "UP" >> $LOG 

        fi

done

echo "" >> $LOG 
