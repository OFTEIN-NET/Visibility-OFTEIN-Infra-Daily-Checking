#!/bin/bash
# Created By: AZEEM IQBAL (NUST, PAKISTAN) SUMMER INTERN 2015 (NETCS, GIST)
# Daily  Up time status report for all the OF@TEIN sites
# Replace the email at the end of the script on which you want to get the daily status

# Edited By: ARIS C. RISDIANTO (GIST, KOREA) PhD Student
# Formatting and Scheduling

# Edited By: MUHAMMAD USMAN (GIST, KOREA) MS/PhD Student
# Formatting/Calculation
LOGDIR="/home/tein/infra_checking_software/result"

if [ -f "$LOGDIR/result.html" ]
then
        rm $LOGDIR/result.html
        echo "$file found."
fi

cd /home/tein/infra_checking_software/result/
cat /home/tein/infra_checking_software/result/ping.log | tail -n 288 > /home/tein/infra_checking_software/result/log.txt

total=$(cat log.txt | wc -l) 
echo "total entries are : $total"

############################### MYREN Site ###############################

MYREN=$(cat log.txt | cut -d , -f 2 | grep DOWN | wc -l)

echo "MYREN down entries : $MYREN"

ans1=$((total - MYREN ))

#frac_perc1=$(echo "scale=2; $MYREN/$total" | bc)
frac_perc1=$(echo "scale=2; $ans1/$total" | bc)

MYREN_up_perc=$(echo "scale=0; $frac_perc1 * 100" | bc)
MYREN_down_time=$(echo "scale=0; $MYREN * 5" | bc)

echo "MYREN was up for $MYREN_up_perc % of the time/day"
echo "MYREN was down for $MYREN_down_time minutes/day"

############################### MY Site ###############################

MY=$(cat log.txt | cut -d , -f 3 | grep DOWN | wc -l)

echo "MY down entries : $MY"

ans2=$((total - MY ))

frac_perc2=$(echo "scale=2; $ans2/$total" | bc)

MY_up_perc=$(echo "scale=0; $frac_perc2 * 100" | bc)
MY_down_time=$(echo "scale=0; $MY * 5" | bc)

echo "MY was up for $MY_up_perc % of the time/day"
echo "MY was down for $MY_down_time minutes/day"

############################### TH Site ###############################

TH=$(cat log.txt | cut -d , -f 4 | grep DOWN | wc -l)

echo "TH down entries : $TH"


ans3=$((total - TH ))

frac_perc3=$(echo "scale=2; $ans3/$total" | bc)

TH_up_perc=$(echo "scale=0; $frac_perc3 * 100" | bc)
TH_down_time=$(echo "scale=0; $TH * 5" | bc)

echo "TH was up for $TH_up_perc % of the time/day"
echo "TH was down for $TH_down_time minutes/day"

############################### PKS Site ###############################

PKS=$(cat log.txt | cut -d , -f 5 | grep DOWN | wc -l)

echo "PKS down entries : $PKS"

ans4=$((total - PKS ))

frac_perc4=$(echo "scale=2; $ans4/$total" | bc)

PKS_up_perc=$(echo "scale=0; $frac_perc4 * 100" | bc)
PKS_down_time=$(echo "scale=0; $PKS * 5" | bc)

echo "PKS was up for $PKS_up_perc % of the time/day"
echo "PKS was down for $PKS_down_time minutes/day"

############################### ID Site ###############################

ID=$(cat log.txt | cut -d , -f 6 | grep DOWN | wc -l)

echo "ID down entries : $ID"

ans5=$((total - ID ))

frac_perc5=$(echo "scale=2; $ans5/$total" | bc)

ID_up_perc=$(echo "scale=0; $frac_perc5 * 100" | bc)
ID_down_time=$(echo "scale=0; $ID * 5" | bc)

echo "ID was up for $ID_up_perc % of the time/day"
echo "ID was down for $ID_down_time minutes/day"

############################### PH Site ###############################

PH=$(cat log.txt | cut -d , -f 7 | grep DOWN | wc -l)

echo "PH down entries : $PH"

ans6=$((total - PH ))

frac_perc6=$(echo "scale=2; $ans6/$total" | bc)

PH_up_perc=$(echo "scale=0; $frac_perc6 * 100" | bc)
PH_down_time=$(echo "scale=0; $PH * 5" | bc)

echo "PH was up for $PH_up_perc % of the time/day"
echo "PH was down for $PH_down_time minutes/day"

############################### VN Site ###############################

VN=$(cat log.txt | cut -d , -f 8 | grep DOWN | wc -l)

echo "VN down entries : $VN"

ans7=$((total - VN ))

frac_perc7=$(echo "scale=2; $ans7/$total" | bc)

VN_up_perc=$(echo "scale=0; $frac_perc7 * 100" | bc)
VN_down_time=$(echo "scale=0; $VN * 5" | bc)

echo "VN was up for $VN_up_perc % of the time/day"
echo "VN was down for $VN_down_time minutes/day"

############################### TEST Site #############################

TEST=$(cat log.txt | cut -d , -f 9 | grep DOWN | wc -l)

echo "TEST down entries : $TEST"

ans8=$((total - TEST ))

frac_perc8=$(echo "scale=2; $ans8/$total" | bc)

TEST_up_perc=$(echo "scale=0; $frac_perc8 * 100" | bc)
TEST_down_time=$(echo "scale=0; $TEST * 5" | bc)

echo "TEST was up for $TEST_up_perc % of the time/day"
echo "TEST was down for $TEST_down_time minutes/day"

############################### GIST Site ###############################

GIST=$(cat log.txt | cut -d , -f 10 | grep DOWN | wc -l)

echo "GIST down entries : $GIST"

ans9=$((total - GIST ))

frac_perc9=$(echo "scale=2; $ans9/$total" | bc)

GIST_up_perc=$(echo "scale=0; $frac_perc9 * 100" | bc)
GIST_down_time=$(echo "scale=0; $GIST * 5" | bc)

echo "GIST was up for $GIST_up_perc % of the time/day"
echo "GIST was down for $GIST_down_time minutes/day"
############################### TEST Site ###############################

TW=$(cat log.txt | cut -d , -f 11 | grep DOWN | wc -l)

echo "TW down entries : $TW"

ans10=$((total - TW ))

frac_perc10=$(echo "scale=2; $ans10/$total" | bc)

TW_up_perc=$(echo "scale=0; $frac_perc10 * 100" | bc)
TW_down_time=$(echo "scale=0; $TW * 5" | bc)

echo "TW was up for $TW_up_perc % of the time/day"
echo "TW was down for $TW_down_time minutes/day"

############################### GIST Site ###############################

IN=$(cat log.txt | cut -d , -f 12 | grep DOWN | wc -l)

echo "IN down entries : $IN"

ans11=$((total - IN ))

frac_perc11=$(echo "scale=2; $ans11/$total" | bc)

IN_up_perc=$(echo "scale=0; $frac_perc11 * 100" | bc)
IN_down_time=$(echo "scale=0; $IN * 5" | bc)

echo "IN was up for $IN_up_perc % of the time/day"
echo "IN was down for $IN_down_time minutes/day"

#################################Mesh Ping Test############################
############################# From GIST Site ##############################
ID_FROM_GIST=$(cat PING_RESULT_GIST.log | cut -d , -f 3)
IN_FROM_GIST=$(cat PING_RESULT_GIST.log | cut -d , -f 4)
MYREN_FROM_GIST_P=$(cat PING_RESULT_GIST.log | cut -d , -f 5)
PH_FROM_GIST=$(cat PING_RESULT_GIST.log | cut -d , -f 6)
PKS_FROM_GIST=$(cat PING_RESULT_GIST.log | cut -d , -f 7)
VN_FROM_GIST=$(cat PING_RESULT_GIST.log | cut -d , -f 8)
############################ From MYREN Site ##############################
GIST_FROM_MYREN=$(cat PING_RESULT_MYREN.log | cut -d , -f 2)
ID_FROM_MYREN=$(cat PING_RESULT_MYREN.log | cut -d , -f 3)
IN_FROM_MYREN=$(cat PING_RESULT_MYREN.log | cut -d , -f 4)
PH_FROM_MYREN=$(cat PING_RESULT_MYREN.log | cut -d , -f 6)
PKS_FROM_MYREN=$(cat PING_RESULT_MYREN.log | cut -d , -f 7)
VN_FROM_MYREN=$(cat PING_RESULT_MYREN.log | cut -d , -f 8)
########################### From TEST Site ##############################
MY_FROM_TEST=$(cat PING_RESULT_TEST.log | cut -d , -f 2)
TH_FROM_TEST=$(cat PING_RESULT_TEST.log | cut -d , -f 4)
TW_FROM_TEST=$(cat PING_RESULT_TEST.log | cut -d , -f 5)

###########################VM Contrl Plane Ping Test#######################
############################# From GIST Site ##############################
#VM_C_TEST_FROM_GIST=$(cat PING_RESULT_CONTROL_GIST_VM.log | cut -d , -f 2)
#VM_C_TH_FROM_GIST=$(cat PING_RESULT_CONTROL_GIST_VM.log | cut -d , -f 3)

################################ Summary ##################################
TIME=`date +%Y/%m/%d`
echo $TIME
#################################Iperf TCP Test############################
############################# From GIST Site ##############################
#MYREN_FROM_GIST=$(cat IPERF_TCP_RESULT_GIST_BOX.log | cut -d , -f 2)
#################################Iperf UDP Test############################
echo "========================================================" >> temp.txt
echo "                        pBox - pBox Iperf (UDP) Test            " >> temp.txt
echo "========================================================" >> temp.txt
echo "  Server       Client        Bandwidth             Jitter        Packet Loss            " >> temp.txt
echo "========================================================" >> temp.txt
file1="/home/tein/infra_checking_software/result/IPERF_UDP_RESULT_GIST_BOX.log"
file2="/home/tein/infra_checking_software/result/IPERF_UDP_RESULT_MYREN_BOX.log"
while IFS=" " read -r f1 f2 f3 f4 f5 f6 f7 f8
do
        # display $line or do somthing with $line
#       echo -e "  $f1    $f2    $f4    $f5    $f6 " >> temp.txt
        #printf '%s\n' "$f1 $f2 $f3"
        printf "%-13s" "  $f1" >> temp.txt
        printf "%-13s" "  $f2" >> temp.txt
        printf "%-10s" "  $f4" >> temp.txt
        printf "%-10s" "$f5" >> temp.txt
        printf "%-13s" "  $f6" >> temp.txt
        printf "%-13s" "  $f7" >> temp.txt
	printf "%-13s\n" "  $f8" >> temp.txt
done <"$file1"
while IFS=" " read -r f1 f2 f3 f4 f5 f6 f7 f8
do
        # display $line or do somthing with $line
        #echo -e "  $f1    $f2    $f4    $f5    $f6 " >> temp.txt
        #printf '%s\n' "$line"
        printf "%-13s" "  $f1" >> temp.txt
        printf "%-13s" "  $f2" >> temp.txt
        printf "%-10s" "  $f4" >> temp.txt
        printf "%-10s" "$f5" >> temp.txt
        printf "%-13s" "  $f6" >> temp.txt
        printf "%-13s" "  $f7" >> temp.txt
	printf "%-13s\n" "  $f8" >> temp.txt
done <"$file2"
echo -e "*****************************************************************************************\n" >> temp.txt

#echo "========================================================" >> temp.txt
#echo "                        vBox Control Plane Status Checking From GIST Site            " >> temp.txt
#echo "========================================================" >> temp.txt
#echo "  Site Name                     vBox Status (Up/Down)" >> temp.txt
#echo "========================================================" >> temp.txt
#echo -e "  TEST                             $VM_C_TEST_FROM_GIST" >> temp.txt
#echo -e "  TH                                 $VM_C_TH_FROM_GIST" >> temp.txt
#echo -e "*****************************************************************************************\n" >> temp.txt


#/usr/sbin/sendmail -F playground@oftein.net aris@smartx.kr < temp.txt
###/usr/sbin/sendmail -t usman@smartx.kr < temp.txt
#cat temp.txt | mail -s "[$TIME] OF@TEIN SmartX Box Daily Status"  usman@smartx.kr
#/usr/sbin/sendmail -F ops@oftein.net aris@smartx.kr < temp.txt
echo "<html><head><style>
table {
    width:100%;
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color:#fff;
}
table#t01 th	{
    background-color: black;
    color: white;
}
</style>
</head>
<body>
<p style='color:black;'>Dear OF@TEIN Administrators,</p>
<p style='color:red;'>***      This is an automatically generated email, please do not reply      ***</p>
<br>

<table style='width:50%; border: 1px solid black; border-collapse:collapse;'>
  <tr><th style='font-size:120%; color:blue;' colspan='3'>pBox Status Summary</th></tr>
  <tr><th style='background-color: black; color:white; border: 1px solid black; text-align: left; padding: 5px; border: 1px solid black;'>Site</th><th style='background-color: black; color:white; border: 1px solid black; text-align: right; padding: 5px; border: 1px solid black;'>Up Time Percntage/Day</th><th style='background-color: black; color:white; border: 1px solid black; text-align: right; padding: 5px; border: 1px solid black;'>Down Time Minutes/Day</th></tr>
  <tr style='background-color: #fff;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>GIST</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$GIST_up_perc</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$GIST_down_time</td></tr>
  <tr style='background-color: #eee;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>MYREN</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$MYREN_up_perc</td> <td style='text-align: right; padding: 5px; border: 1px solid black;'>$MYREN_down_time</td></tr>
  <tr style='background-color: #fff;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>MY</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$MY_up_perc</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$MY_down_time</td></tr>
  <tr style='background-color: #eee;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>TH</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$TH_up_perc</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$TH_down_time</td></tr>
  <tr style='background-color: #fff;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>PKS</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$PKS_up_perc</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$PKS_down_time</td></tr>
  <tr style='background-color: #eee;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>ID</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$ID_up_perc</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$ID_down_time</td></tr>
  <tr style='background-color: #fff;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>PH</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$PH_up_perc</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$PH_down_time</td></tr>
  <tr style='background-color: #eee;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>GIST+</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$TEST_up_perc</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$TEST_down_time</td></tr>
  <tr style='background-color: #fff;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>TW</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$TW_up_perc</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$TW_down_time</td></tr>
  <tr style='background-color: #eee;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>VN</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$VN_up_perc</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$VN_down_time</td></tr>
  <tr style='background-color: #fff;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>IN</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$IN_up_perc</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$IN_down_time</td></tr>
</table>

<p></p><p></p>
<table style='width:50%; border: 1px solid black; border-collapse:collapse;'>
  <tr><th style='font-size:120%; color:blue;' colspan='3'>pBox Status Checking From GIST Site</th></tr>
  <tr><th style='background-color: black; color:white; border: 1px solid black; text-align: left; padding: 5px; border: 1px solid black;'>Site</th><th style='background-color: black; color:white; border: 1px solid black; text-align: center; padding: 5px; border: 1px solid black;'>Box Status (Up/Down)</th></tr>
  <tr style='background-color: #fff;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>ID</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$ID_FROM_GIST</td>
  </tr>
  <tr style='background-color: #eee;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>IN</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$IN_FROM_GIST</td>
  </tr>
  <tr style='background-color: #fff;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>PH</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$PH_FROM_GIST</td>
  </tr>
  <tr style='background-color: #eee;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>PKS</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$PKS_FROM_GIST</td>
  </tr>
  <tr style='background-color: #fff;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>VN</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$VN_FROM_GIST</td>
  </tr>
</table>
<p></p><p></p>
<table style='width:50%; border: 1px solid black; border-collapse:collapse;'>
  <tr><th style='font-size:120%; color:blue;' colspan='3'>pBox Status Checking From MYREN Site</th></tr>
  <tr><th style='background-color: black; color:white; border: 1px solid black; text-align: left; padding: 5px; border: 1px solid black;'>Site</th><th style='background-color: black; color:white; border: 1px solid black; text-align: center; padding: 5px; border: 1px solid black;'>Box Status (Up/Down)</th></tr>
  <tr style='background-color: #fff;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>ID</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$ID_FROM_MYREN</td>
  </tr>
  <tr style='background-color: #eee;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>IN</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$IN_FROM_MYREN</td>
  </tr>
  <tr style='background-color: #fff;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>PH</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$PH_FROM_MYREN</td>
  </tr>
  <tr style='background-color: #eee;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>PKS</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$PKS_FROM_MYREN</td>
  </tr>
  <tr style='background-color: #fff;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>VN</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$VN_FROM_MYREN</td>
  </tr>
</table>

<p></p><p></p>
<table style='width:50%; border: 1px solid black; border-collapse:collapse;'>
  <tr><th style='font-size:120%; color:blue;' colspan='3'>pBox Status Checking From GIST+ Site</th></tr>
  <tr><th style='background-color: black; color:white; border: 1px solid black; text-align: left; padding: 5px; border: 1px solid black;'>Site</th><th style='background-color: black; color:white; border: 1px solid black; text-align: center; padding: 5px; border: 1px solid black;'>Box Status (Up/Down)</th></tr>
  <tr style='background-color: #fff;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>MY</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$MY_FROM_TEST</td>
  </tr>
  <tr style='background-color: #eee;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>TH</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$TH_FROM_TEST</td>
  </tr>
  <tr style='background-color: #fff;'>
    <td style='text-align: left; padding: 5px; border: 1px solid black;'>TW</td>
    <td style='text-align: center; padding: 5px; border: 1px solid black;'>$TW_FROM_TEST</td>
  </tr>
</table>" >> result.html

#################################Iperf TCP Test############################
MYREN_FROM_GIST=$(cat IPERF_TCP_RESULT_GIST_BOX.log | cut -d , -f 2)

echo "<p></p><p></p>
<table style='width:50%; border: 1px solid black; border-collapse:collapse;'>
  <tr><th style='font-size:120%; color:blue; text-align: center;' colspan='4'>pBox - pBox Iperf (TCP) Test</th></tr>
  <tr><th style='background-color: black; color:white; border: 1px solid black; text-align: left; padding: 5px; border: 1px solid black;'>Server</th><th style='background-color: black; color:white; border: 1px solid black; text-align: left; padding: 5px; border: 1px solid black;'>Client</th><th style='background-color: black; color:white; border: 1px solid black; text-align: right; padding: 5px; border: 1px solid black;'>Sender Bandwidth</th><th style='background-color: black; color:white; border: 1px solid black; text-align: right; padding: 5px; border: 1px solid black;'>Receiver Bandwidth</th></tr>" >> result.html
bgco="#fff"
file1="/home/tein/infra_checking_software/result/IPERF_TCP_RESULT_GIST_BOX.log"
file2="/home/tein/infra_checking_software/result/IPERF_TCP_RESULT_MYREN_BOX.log"
while IFS=" " read -r f1 f2 f3 f4 f5 f6 f7
do
  echo "<tr style='background-color: $bgco;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>$f1</td><td style='text-align: left; padding: 5px; border: 1px solid black;'>$f2</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$f4 $f5</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$f6 $f7</td></tr>" >>result.html
  if [ "$bgco" == "#fff" ]; then
     bgco="#eee"
  else
     bgco="#fff"
  fi
done <"$file1"
while IFS=" " read -r f1 f2 f3 f4 f5 f6 f7
do
  echo "<tr style='background-color: $bgco;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>$f1</td><td style='text-align: left; padding: 5px; border: 1px solid black;'>$f2</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$f4 $f5</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$f6 $f7</td></tr>" >>result.html
  if [ "$bgco" == "#fff" ]; then
     bgco="#eee"
  else
     bgco="#fff"
  fi
done <"$file2"
echo "</table>" >> result.html
#################################Iperf UDP Test############################
echo "<p></p><p></p><table style='width:50%; border: 1px solid black; border-collapse:collapse;'>
  <tr><th style='font-size:120%; color:blue; text-align: center;' colspan='5'>pBox - pBox Iperf (UDP) Test</th></tr>
  <tr><th style='background-color: black; color:white; border: 1px solid black; text-align: left; padding: 5px; border: 1px solid black;'>Server</th><th style='background-color: black; color:white; border: 1px solid black; text-align: left; padding: 5px; border: 1px solid black;'>Client</th><th style='background-color: black; color:white; border: 1px solid black; text-align: right; padding: 5px; border: 1px solid black;'>Bandwidth</th><th style='background-color: black; color:white; border: 1px solid black; text-align: right; padding: 5px; border: 1px solid black;'>Jitter</th><th style='background-color: black; color:white; border: 1px solid black; text-align: right; padding: 5px; border: 1px solid black;'>Packet Loss</th></tr>" >> result.html
bgco="#fff"
file1="/home/tein/infra_checking_software/result/IPERF_UDP_RESULT_GIST_BOX.log"
file2="/home/tein/infra_checking_software/result/IPERF_UDP_RESULT_MYREN_BOX.log"
while IFS=" " read -r f1 f2 f3 f4 f5 f6 f7 f8
do
  echo "<tr style='background-color: $bgco;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>$f1</td><td style='text-align: left; padding: 5px; border: 1px solid black;'>$f2</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$f4 $f5</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$f6</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$f7 $f8</td></tr>" >>result.html
  if [ "$bgco" == "#fff" ]; then
     bgco="#eee"
  else
     bgco="#fff"
  fi
done <"$file1"
while IFS=" " read -r f1 f2 f3 f4 f5 f6 f7
do
  echo "<tr style='background-color: $bgco;'><td style='text-align: left; padding: 5px; border: 1px solid black;'>$f1</td><td style='text-align: left; padding: 5px; border: 1px solid black;'>$f2</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$f4 $f5</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$f6</td><td style='text-align: right; padding: 5px; border: 1px solid black;'>$f7 $f8</td><tr>" >>result.html
  if [ "$bgco" == "#fff" ]; then
     bgco="#eee"
  else
     bgco="#fff"
  fi
done <"$file2"
echo "</table>" >> result.html

echo "</table></body></html>" >> result.html
mail -a "Content-type: text/html;" -s "[$TIME] SmartX Playground Infrastructure Daily Visibility Report" playground@oftein.net < result.html
#mail -a "Content-type: text/html;" -s "[$TIME] SmartX Playground Infrastructure Daily Visibility Report" usman@smartx.kr < result.html
#mail -a "Content-type: text/html;" -s "[$TIME] OF@TEIN SmartX Box Daily Status" playground@oftein.net < result.html
