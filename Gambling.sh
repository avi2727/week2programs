#!/bin/bash -x

#CONSTANT AND  VARIABLE INITIALIZE
stake=100
BET=1
halfStake=$(($stake/2))
lossLimit=$(($halfStake*$stake/$stake))
gainLimit=$(($stake+$lossLimit))
totalDays=30
initialStake=100
GainOrLoss=0
NO_GAIN_NO_LOSS=0

#CHECK THE CONDITIONS FOR GAIN OR LOSS
while [[ $GainOrLoss -gt $NO_GAIN_NO_LOSS || $GainOrLoss -eq $NO_GAIN_NO_LOSS ]]
do
	declare -A dict
	for((day=1; day<=$totalDays; day++))
	do	
		while [ $stake -ne $lossLimit ]
		do
			if [ $stake -eq $gainLimit ]
			then
				break
			fi
			if [ $(( RANDOM%2 )) -eq $BET ]
			then
				stake=$(($stake+$BET))
			else
				stake=$(($stake-$BET))
			fi
		done
		echo "Daily stake changed : $stake"
		if [ $stake -gt $initialStake ]
		then
			stakeToBe=$(($stake-$initialStake))
		elif [ $stake -lt $initialStake ]
		then
			stakeToBe=$(($stake-$initialStake))
		fi
		echo "Stake changed by :$stakeToBe"
		echo ""
		GainOrLoss=$(($GainOrLoss+$stakeToBe))
		dict[$day]=$GainOrLoss
		stake=100
	done

	#DISPLAY DAY AND DAILY STAKE GENERATED
	echo "Daily stake: ${dict[@]}"
	echo "Day: ${!dict[@]}"

	#DISPLAY LUCKIEST DAY OF THE MONTH
	echo "luckiest day :"
	for k in ${!dict[@]}
	do
		echo $k '-' ${dict[$k]}
	done|sort -rn -k3|head -1

	#DISPLAY UNLUCKIEST DAY OF THE MONTH
	echo "Unluckiest day :"
	for k in ${!dict[@]}
	do
		echo $k '-' ${dict[$k]}
	done|sort -rn -k3|tail -1

	#DISPLAY TOTAL GAIN OR LOSS OF one month
	echo "Overall gain or loss : $GainOrLoss"
	if [ $GainOrLoss -lt $NO_GAIN_NO_LOSS ]
	then
		echo "money lost !!!!"
		break
	elif [ $GainOrLoss -gt $NO_GAIN_NO_LOSS ]
	then
		echo "Player wins !!!!"
		continue
	fi
	GainOrLoss=$NO_GAIN_NO_LOSS
done

