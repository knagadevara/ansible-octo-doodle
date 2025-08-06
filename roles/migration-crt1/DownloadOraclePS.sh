#!/bin/sh

#

#
LANG=C
export LANG

# SSO username and password
#read -p 'SSO User Name:' SSO_USERNAME
#read -sp 'SSO Password:' SSO_PASSWORD
SSO_USERNAME="babu"
SSO_PASSWORD="balu"

# Path to wget command
WGET=/usr/bin/wget
# Location of cookie file
COOKIE_FILE=/tmp/$$.cookies

# Log directory and file
LOGDIR=.
LOGFILE=$LOGDIR/wgetlog-`date +%m-%d-%y-%H:%M`.log
# Output directory and file
OUTPUT_DIR=.
#
# End of user configurable variable
#

if [ "$SSO_PASSWORD " = " " ]
then
 echo "Please edit script and set SSO_PASSWORD"
 exit
fi

SSO_RESPONSE=`$WGET --user-agent="Mozilla/5.0"  --no-check-certificate https://edelivery.oracle.com/osdc/faces/SoftwareDelivery -O- 2>&1|grep Location`

# Extract request parameters for SSO
SSO_TOKEN=`echo $SSO_RESPONSE| cut -d '=' -f 2|cut -d ' ' -f 1`
SSO_SERVER=`echo $SSO_RESPONSE| cut -d ' ' -f 2|cut -d '/' -f 1,2,3`
SSO_AUTH_URL=/sso/auth
AUTH_DATA="ssousername=$SSO_USERNAME&password=$SSO_PASSWORD&site2pstoretoken=$SSO_TOKEN"

# The following command to authenticate uses HTTPS. This will work only if the wget in the environment
# where this script will be executed was compiled with OpenSSL. Remove the --secure-protocol option
# if wget was not compiled with OpenSSL
# Depending on the preference, the other options are --secure-protocol= auto|SSLv2|SSLv3|TLSv1
$WGET --user-agent="Mozilla/5.0" --secure-protocol=auto --post-data $AUTH_DATA --save-cookies=$COOKIE_FILE --keep-session-cookies $SSO_SERVER$SSO_AUTH_URL -O sso.out >> $LOGFILE 2>&1

rm -f sso.out


$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=B24430-01.zip&token=WmplR24yUHZqeHNKMGk5cVBDb0dUZyE6OiFmaWxlSWQ9MTU2NDkyNDQmZmlsZVNldENpZD04NDkyMjAmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/B24430-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=B27257-01.zip&token=OUZaS3lTR3p6WU4wMFRUZ1NOYVpDUSE6OiFmaWxlSWQ9MTY0Njc5MTgmZmlsZVNldENpZD04NDkyMjEmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/B27257-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=B29774-01.zip&token=V0xUb1NPWEpIM0lpbG5EVXNVbit4dyE6OiFmaWxlSWQ9MTczMzIwMTQmZmlsZVNldENpZD04NDkyMjImZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/B29774-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=B30696-01.zip&token=ZVpaTmI5bERhQlpzdzdmaXhnNGxSUSE6OiFmaWxlSWQ9MTc5ODY5OTEmZmlsZVNldENpZD04NDkyMjMmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/B30696-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=B30764-01.zip&token=WXBsMUtZYUF3Y3pCajJsNFN3NldmdyE6OiFmaWxlSWQ9MTc4NzY2NjUmZmlsZVNldENpZD04NDkyMjQmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/B30764-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=B34340-01.zip&token=SjhyWHZhdFB4bVY3Ly9rRFRRR0Q2USE6OiFmaWxlSWQ9MTg0MDQ2ODkmZmlsZVNldENpZD04NDkyMjUmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/B34340-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=B42380-01.zip&token=b0NLMUg1T1E1U1RUcFNXVC9TRkY2USE6OiFmaWxlSWQ9MTkxMDI3ODcmZmlsZVNldENpZD04NDkyMjYmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/B42380-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=B43373-01.zip&token=VTVLd21TOW9Wc1loTkcxVUh1ZkJYQSE6OiFmaWxlSWQ9MTk3OTIwMDEmZmlsZVNldENpZD04NDkyMjgmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/B43373-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=B43642-01.zip&token=UXdocExTZTBkSitiaFJISmdHQVJ0dyE6OiFmaWxlSWQ9MTk5NzMzMTcmZmlsZVNldENpZD04NDkyMjkmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/B43642-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=B43895-01.zip&token=S1NqenhlQnd2SjJtb3BKR2xnNzFVdyE6OiFmaWxlSWQ9MjAzNjQ3NjcmZmlsZVNldENpZD04NDkyMzAmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/B43895-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=B45935-01.zip&token=dlRHRjhKSDA4a1hmWkdZVitaRnB2dyE6OiFmaWxlSWQ9MjIzNDEwODgmZmlsZVNldENpZD04NDkyMzEmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/B45935-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V13630-01.zip&token=djBIUUpyZ25aMFNrQXBDTnJoOG9lUSE6OiFmaWxlSWQ9MjQzNjg4MjQmZmlsZVNldENpZD04NDkyOTImZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/V13630-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V15055-01.zip&token=V2hmYmVnZCtHRlkvdTlnNVNGTDNxdyE6OiFmaWxlSWQ9MjYwNjk3MjImZmlsZVNldENpZD04MzkxMzQmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/V15055-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V16824-01.zip&token=NVdZcEthOWFqTG1QNC91OVNjL2pFQSE6OiFmaWxlSWQ9MjczNzQzNDcmZmlsZVNldENpZD04NDkyOTMmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/V16824-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V18882-01.zip&token=TUt3RnZERFlhZGQrSEtYUkQzSHZlQSE6OiFmaWxlSWQ9MjkwMDYwNTgmZmlsZVNldENpZD04NDkyOTQmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/V18882-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V19060-01.zip&token=QlZkY05WUndHTXJjZFJyRnVVcEpiZyE6OiFmaWxlSWQ9MjkxMTQ4OTcmZmlsZVNldENpZD04NDkyOTUmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/V19060-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V22324-01.zip&token=Uk9DYVFlb3ZZMExsaDFHTWdrbGFWUSE6OiFmaWxlSWQ9MzE5MjY1ODYmZmlsZVNldENpZD04Mzg0MzgmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/V22324-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V22547-01.zip&token=cTgrT2d1VE1ROVJmbWxPUDdDUmEvdyE6OiFmaWxlSWQ9MzI1MDc2NDImZmlsZVNldENpZD04Mzg0MzkmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/V22547-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V22548-01.zip&token=K0JHWXIyY2g2SkxXRWlYOXJOKzlTUSE6OiFmaWxlSWQ9MzI1MDc5MDcmZmlsZVNldENpZD04Mzg0NDAmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/V22548-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V22549-01.zip&token=YUlZQk5vQVVMRVpUb2g4TzV6cGNSZyE6OiFmaWxlSWQ9MzI1MDc2MzUmZmlsZVNldENpZD04Mzg0NDEmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/V22549-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V28347-01.zip&token=R3p3ck55WURoM3UyRXYyWERpN3phdyE6OiFmaWxlSWQ9NDQ1NTc1NDcmZmlsZVNldENpZD04NTE3MjkmZG93bmxvYWRUeXBlPTk1NzY3JmFncmVlbWVudElkPTUwMjA3NjkmZW1haWxBZGRyZXNzPWFydW5rdW1hci5nb3N1bGFAc3VuZXJhdGVjaC5jb20mdXNlck5hbWU9RVBELUFSVU5LVU1BUi5HT1NVTEFAU1VORVJBVEVDSC5DT00maXBBZGRyZXNzPTExMS45My4yNC4xMTgmdXNlckFnZW50PU1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83MC4wLjM1MzguMTEwIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9SU4" -O $OUTPUT_DIR/V28347-01.zip>> $LOGFILE 2>&1 
