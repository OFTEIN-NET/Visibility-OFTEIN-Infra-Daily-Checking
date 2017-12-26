#!/bin/bash

#
# Name 		: ping-iperf-check.v1.sh
# Description	: Script for OF@TEIN Infrastructure Resources Checking and Verification
#
# Created by    : TEIN_GIST@nm.gist.ac.kr
# Version       : 0.1
#

# Configuration Parameter
LOGDIR="log"
LOGRES="/home/tein/infra_checking_software/result"
#LOGFILE=experiment.check.`date +%Y%m%d.%H%M%S`.log
#B_SITES="MYREN MY TH PKS ID PH VN TEST GIST TW IN"
B_SITES="GIST ID IN MYREN PH PKS VN"
B_PLUS_SITES="MY TEST TH TW"
VM_SITES_GIST="ID PKS PH"
VM_SITES_MYREN="ID PKS PH"
#VM_SITES_MYREN="PH MY PKS ID"
#BP_SITES="GIST ID" # separated by spaces
GIST_PING_RESULT=$(date)
MYREN_PING_RESULT=$(date)
TEST_PING_RESULT=$(date)
GIST_CONTROL_VM_PING_RESULT=$(date)
MYREN_CONTROL_VM_PING_RESULT=$(date)

if [ -f "$LOGRES/PING_RESULT_GIST.log" ]
then
        rm $LOGRES/PING_RESULT_GIST.log
        echo "$file found."
fi
if [ -f "$LOGRES/PING_RESULT_MYREN.log" ]
then
        rm $LOGRES/PING_RESULT_MYREN.log
        echo "$file found."
fi
if [ -f "$LOGRES/PING_RESULT_TEST.log" ]
then
        rm $LOGRES/PING_RESULT_TEST.log
        echo "$file found."
fi

if [ -f "$LOGRES/IPERF_TCP_RESULT_GIST_BOX.log" ]
then
	rm $LOGRES/IPERF_TCP_RESULT_GIST_BOX.log
	rm $LOGRES/IPERF_UDP_RESULT_GIST_BOX.log	
	touch $LOGRES/IPERF_TCP_RESULT_GIST_BOX.log
	touch $LOGRES/IPERF_UDP_RESULT_GIST_BOX.log
	echo "$file found."
fi
if [ -f "$LOGRES/IPERF_TCP_RESULT_MYREN_BOX.log" ]
then
	rm $LOGRES/IPERF_TCP_RESULT_MYREN_BOX.log
	rm $LOGRES/IPERF_UDP_RESULT_MYREN_BOX.log
	touch $LOGRES/IPERF_TCP_RESULT_MYREN_BOX.log
        touch $LOGRES/IPERF_UDP_RESULT_MYREN_BOX.log
        echo "$file found."
fi

if [ -f "$LOGRES/PING_RESULT_CONTROL_GIST_VM.log" ]
then
        rm $LOGRES/PING_RESULT_CONTROL_GIST_VM.log
        rm $LOGRES/PING_RESULT_CONTROL_MYREN_VM.log
        echo "$file found."
fi

#
# [1] Compute Resource Checking
#

function check_box {

	echo -e "\n"
	echo -e "--------------------------------------------------"
	echo -e "|    Start Compute Resource (Box) Checking       |"
	echo -e "--------------------------------------------------"
	echo -e "\n"

	ACTIVE_OVS_VM_GIST=`ssh root@SmartX-BPlus-GIST 'virsh list --all | grep ovs-vm | grep running' | awk '{print $2}'`
        ACTIVE_OVS_VM_MYREN=`ssh root@SmartX-BPlus-MYREN 'virsh list --all | grep ovs-vm | grep running' | awk '{print $2}'`

        if [ "$ACTIVE_OVS_VM_GIST" == "ovs-vm1" ]; then
            ACTIVE_OVS_VM_GIST="GIST-OVS-VM1"
        else
            ACTIVE_OVS_VM_GIST="GIST-OVS-VM2"
        fi
        if [ "$ACTIVE_OVS_VM_MYREN" == "ovs-vm1" ]; then
            ACTIVE_OVS_VM_MYREN="MYREN-OVS-VM1"
        else
            ACTIVE_OVS_VM_MYREN="MYREN-OVS-VM2"
        fi

	for countryID in $B_SITES
	do
		echo -e "Checking for SmartX-BPlus-$countryID"

		echo -e "------------------------"
		
		#ACTIVE_OVS_VM_GIST=`ssh root@SmartX-BPlus-GIST 'virsh list --all | grep ovs-vm | grep running' | awk '{print $2}'`
		#ACTIVE_OVS_VM_MYREN=`ssh root@SmartX-BPlus-MYREN 'virsh list --all | grep ovs-vm | grep running' | awk '{print $2}'`
	
	        #if [ "$ACTIVE_OVS_VM_GIST" == "ovs-vm1" ]; then
        	#        ACTIVE_OVS_VM_GIST="GIST-OVS-VM1"
        	#else
        	#        ACTIVE_OVS_VM_GIST="GIST-OVS-VM2"
        	#fi
		#if [ "$ACTIVE_OVS_VM_MYREN" == "ovs-vm1" ]; then
                #        ACTIVE_OVS_VM_MYREN="MYREN-OVS-VM1"
                #else
                #        ACTIVE_OVS_VM_MYREN="MYREN-OVS-VM2"
                #fi
 
		GIST_PING=`ssh tein@$ACTIVE_OVS_VM_GIST 'ping 'Data-$countryID' -c 1 | grep icmp_seq'`
		MYREN_PING=`ssh tein@$ACTIVE_OVS_VM_MYREN 'ping 'Data-$countryID' -c 1 | grep icmp_seq'`
		echo -e $GIST_PING
		echo -e $MYREN_PING

		#GIST Ping Checking
		if [ "${GIST_PING:-null}" = null ]; then
			echo "Host SmartX-BPlus-$countryID is not reachable !!!"
			COMPUTE_RESULT="FAILED"
			GIST_PING_RESULT=$GIST_PING_RESULT,DOWN
		else
			echo "Host SmartX-BPlus-$countryID is reachable."
			GIST_PING_RESULT=$GIST_PING_RESULT,UP
		fi

                #MYREN Ping Checking
		if [ "${MYREN_PING:-null}" = null ]; then
                        echo "Host SmartX-BPlus-$countryID is not reachable !!!"
                        COMPUTE_RESULT="FAILED"
                        MYREN_PING_RESULT=$GIST_PING_RESULT,DOWN
                else
                        echo "Host SmartX-BPlus-$countryID is reachable."
                        MYREN_PING_RESULT=$GIST_PING_RESULT,UP
                fi
	done
	for countryID in $B_PLUS_SITES
        do
                echo -e "Checking for SmartX-BPlus-$countryID"
                echo -e "------------------------"

                TEST_PING=`ssh root@SmartX-BPlus-GIST 'ping 'SmartX-BPlus-$countryID' -c 1 | grep icmp_seq'`
                echo -e $TEST_PING
               
                #TEST Ping Checking
                if [ "${TEST_PING:-null}" = null ]; then
                        echo "Host SmartX-BPlus-$countryID is not reachable !!!"
                        TEST_PING_RESULT=$TEST_PING_RESULT,DOWN
                else
                        echo "Host SmartX-BPlus-$countryID is reachable."
                        TEST_PING_RESULT=$TEST_PING_RESULT,UP
                fi
        done
	
	#echo -e $GIST_PING_RESULT
	echo $GIST_PING_RESULT >> $LOGRES/PING_RESULT_GIST.log
	echo $MYREN_PING_RESULT >> $LOGRES/PING_RESULT_MYREN.log
	echo $TEST_PING_RESULT >> $LOGRES/PING_RESULT_TEST.log
        echo -e "Box Checking is done...\n"
}

function check_box_bandwidth {
        echo -e "\n"
        echo -e "------------------------------------------------------------"
        echo -e "|               Start Iperf Test For (Box)                 |"
        echo -e "------------------------------------------------------------"
        echo -e " Start Iperf Server Application at Box SmartX-BPlus-MYREN  "
        echo -e "------------------------------------------------------------"
        #Execute Iperf Server on Server
        ssh root@SmartX-BPlus-MYREN 'iperf3 -s -D'&
        sleep 5
        for countryID in $VM_SITES_MYREN
        do
                #Execute Iperf Client on Client Site
                echo -e " Start iperf TCP Client on SmartX-BPlus-$countryID Site"
                ssh root@SmartX-BPlus-$countryID "iperf3 -c 103.26.47.229 -i 3 -t 20 -l 1M -O 12 -4 -N" | grep -A 1 "sender" | awk '{print $7" "$8}' | sed 'N;s/\n/ /' | sed 's/^/MYREN '$countryID' TCP /' >> $LOGRES/IPERF_TCP_RESULT_MYREN_BOX.log
                echo -e " Start iperf UDP Client on SmartX-BPlus-$countryID Site"
                ssh root@SmartX-BPlus-$countryID "iperf3 -c 103.26.47.229 -u -i 3 -t 15 -b 20M " | grep "0.00-15.00" | awk '{print $7" "$8" "$9" "$11" "$12}' | sed 's/^/MYREN '$countryID' UDP /' >> $LOGRES/IPERF_UDP_RESULT_MYREN_BOX.log

                #Execute Iperf Server on Client Side
		echo -e "************************************************************"
                echo -e " Start Iperf Server Application at Box SmartX-BPlus-$countryID"
		echo -e "************************************************************"
                ssh root@SmartX-BPlus-$countryID 'iperf3 -s -D'&
                sleep 5

                echo -e " Start iperf TCP Client on SmartX-BPlus-MYREN Site"
                ssh root@SmartX-BPlus-MYREN "iperf3 -c Data-$countryID -i 3 -t 20 -l 1M -O 12 -4 -N" | grep -A 1 "sender" | awk '{print $7" "$8}' | sed 'N;s/\n/ /' | sed 's/^/'$countryID' MYREN TCP /' >> $LOGRES/IPERF_TCP_RESULT_MYREN_BOX.log
                echo -e " Start iperf UDP Client on SmartX-BPlus-MYREN Site\n"
                ssh root@SmartX-BPlus-MYREN "iperf3 -c Data-$countryID -u -i 3 -t 15 -b 20M " | grep "0.00-15.00" | awk '{print $7" "$8" "$9" "$11" "$12}' | sed 's/^/'$countryID' MYREN UDP /' >> $LOGRES/IPERF_UDP_RESULT_MYREN_BOX.log

                echo " Terminate iperf Server on the SmartX-BPlus-$countryID Site"
                ssh root@SmartX-BPlus-$countryID 'killall -r -s KILL iperf3'
        done
        echo " Terminate iperf Server on the SmartX-BPlus-MYREN Site"
        ssh root@SmartX-BPlus-MYREN 'killall -r -s KILL iperf3'
	echo -e "-----------------------------------------------------------"

	echo -e "\n"
	echo -e "------------------------------------------------------------"
        echo -e " Start Iperf Server Application at Box SmartX-BPlus-GIST  "
        echo -e "------------------------------------------------------------"

        #Execute Iperf Server on GIST
        ssh root@SmartX-BPlus-GIST 'iperf3 -s -D'&
        sleep 5
        
	for countryID in $VM_SITES_GIST
        do
		#Execute Iperf Client on Client Site
		#Iperf Experiment 
		echo -e " Start iperf TCP Client on SmartX-BPlus-$countryID Site"
		ssh root@SmartX-BPlus-$countryID "iperf3 -c 61.252.52.11 -i 3 -t 20 -l 1M -O 12 -4 -N" | grep -A 1 "sender" | awk '{print $7" "$8}' | sed 'N;s/\n/ /' | sed 's/^/GIST '$countryID' TCP /' >> $LOGRES/IPERF_TCP_RESULT_GIST_BOX.log
		echo -e " Start iperf UDP Client on SmartX-BPlus-$countryID Site"
		ssh root@SmartX-BPlus-$countryID "iperf3 -c 61.252.52.11 -u -i 3 -t 15 -b 20M " | grep "0.00-15.00" | awk '{print $7" "$8" "$9" "$11" "$12}' | sed 's/^/GIST '$countryID' UDP /' >> $LOGRES/IPERF_UDP_RESULT_GIST_BOX.log
		
		#Execute Iperf Server on Client Side
		echo -e "************************************************************"
 	        echo -e " Start Iperf Server Application at Box SmartX-BPlus-$countryID" 
		echo -e "************************************************************"
	        ssh root@SmartX-BPlus-$countryID 'iperf3 -s -D'&
        	sleep 10

		echo -e " Start iperf TCP Client on SmartX-BPlus-GIST Site"
		ssh root@SmartX-BPlus-GIST "iperf3 -c Data-$countryID -i 3 -t 20 -l 1M -O 12 -4 -N" | grep -A 1 "sender" | awk '{print $7" "$8}' | sed 'N;s/\n/ /' | sed 's/^/'$countryID' GIST TCP /' >> $LOGRES/IPERF_TCP_RESULT_GIST_BOX.log
		echo -e " Start iperf UDP Client on SmartX-BPlus-GIST Site"
                ssh root@SmartX-BPlus-GIST "iperf3 -c Data-$countryID -u -i 3 -t 15 -b 20M " | grep "0.00-15.00" | awk '{print $7" "$8" "$9" "$11" "$12}' | sed 's/^/'$countryID' GIST UDP /' >> $LOGRES/IPERF_UDP_RESULT_GIST_BOX.log

		echo " Terminate iperf Server on the SmartX-BPlus-$countryID Site"
	        ssh root@SmartX-BPlus-$countryID 'killall -r -s KILL iperf3'
	done
	echo " Terminate iperf Server on the $SRVNAME Site"
	echo -e "-----------------------------------------------------------\n"
	ssh root@SmartX-BPlus-GIST 'killall -r -s KILL iperf3'

        echo -e "Iperf is done...\n"
}

function check_vm {
        echo -e "\n"
        echo -e "--------------------------------------------------"
        echo -e "|      Start Compute Resource (VM) Checking      |"
        echo -e "--------------------------------------------------"
        
	for vmID in $VM_SITES_GIST
        do
                echo -e "Checking for SmartX-BPlus-$vmID"
                echo -e "-------------------------------"

                GIST_CONTROL_PING_VM=`ssh root@SmartX-BPlus-GIST 'ping 'VM-Control-$vmID' -c 1 | grep icmp_seq'`
                echo -e $GIST_CONTROL_PING_VM

                #GIST VM Ping Checking
                if [ "${GIST_CONTROL_PING_VM:-null}" = null ]; then
                        echo "Host VM-Control-$vmID is not reachable !!!"
                        GIST_CONTROL_VM_PING_RESULT=$GIST_CONTROL_VM_PING_RESULT,DOWN
                else
                        echo "Host vm-SmartX-BPlus-$vmID is reachable."
                        GIST_CONTROL_VM_PING_RESULT=$GIST_CONTROL_VM_PING_RESULT,UP
                fi
        done

        echo -e $GIST_CONTROL_VM_PING_RESULT
        echo $GIST_CONTROL_VM_PING_RESULT >> $LOGRES/PING_RESULT_CONTROL_GIST_VM.log
        echo $MYREN_CONTROL_VM_PING_RESULT >> $LOGRES/PING_RESULT_CONTROL_MYREN_VM.log
        echo -e "VM Checking is done...\n"
}

#
# Main Script
#

echo -e "\n"
echo -e "#######################################################"
echo -e "# Checking Playground Resources for Health Monitoring #"
echo -e "#######################################################"

check_box
#check_box_bandwidth
#check_vm

echo -e "Checking Playground Resources is Completed.\n"
echo -e "\n"
