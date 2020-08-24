#!/bin/sh
#
# check_memory.sh script
#
# Author : Vittorio Memmo - Exinlab
# Ver. 1.0.0 - 1st June 2013

if [ "$#" -ne 2 ]; then
echo "Usage $0 check_memory.sh <Used RAM threshold> <Used SWAP threshold>"
exit
fi
tr1=$1
tr2=$2
ram_tot=$(free -m | grep Mem: | awk '{printf $2}')
ram_free_cache=$(free -m | grep -e "\-\/\+" | awk '{printf $4}')
ram_used_cache=$(free -m | grep -e "\-\/\+" | awk '{printf $3}')
swap_tot=$(free -m | grep Swap: | awk '{printf $2}')
swap_used=$(free -m | grep Swap: | awk '{printf $3}')
ram_used_perc=$(bc <<< "scale=2; ($ram_used_cache / $ram_tot) * 100")
swap_used_perc=$(bc <<< "scale=2;($swap_used / $swap_tot) * 100")
cmp_ram=$(echo "$ram_used_perc > $tr1" | bc)
cmp_swap=$(echo "$swap_used_perc > $tr2" | bc)
if [ $cmp_ram -eq 1  -a $cmp_swap -eq 1 ]
then
echo "CRITICAL: Used RAM $ram_used_perc% > $tr1% - Used Swap $swap_used_perc% > $tr2%"
exit 2
fi
if [ $cmp_ram -eq 1 ]; then
echo "WARNING: Used RAM $ram_used_perc% > $tr1%"
exit 1
fi
if [ $cmp_swap -eq 1 ]; then
echo "WARNING: Used Swap $swap_used_perc% > $tr2%"
exit 1ar
fi
echo "OK: Used RAM $ram_used_perc% < $tr1% - Used Swap $swap_used_perc% < $tr2%"
exit 0
