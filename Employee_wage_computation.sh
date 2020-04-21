#!/bin/bash -x 

echo "Welcome to Employee Wage Computation.."

#INITIALIZE THE VARIABLES AND CONSTANTS
WAGE_PER_HOUR=20
IS_PART_TIME=1
IS_FULL_TIME=2
WORKING_DAYS_PER_MONTH=20
WORKING_HOURS_LIMIT=100
days=0
workingHours=0
MAX_HOURS_IN_MONTH=4

#INITIALIZE THE VARIABLE
IS_PRESENT=1

#CHECK THE CONDITIONS AND DISPLAY THE ATTENDANCE
echo "Attandance of Employee :"
if (( $(( RANDOM%2 ))==$IS_PRESENT ))
then
	echo "Employee is present"
else
	echo "Employee is Absent"
fi


#CHECK WORKING HOUR PER DAY OF AN EMPLOYEE
function workingHoursPerDay()
{
	case $1 in
		$IS_FULL_TIME)
			hoursPerDay=8
			;;
		$IS_PART_TIME)
			hoursPerDay=4
			;;
		*)
			hoursPerDay=0
			;;
	esac
	echo $hoursPerDay
}


#CALCULATE DAILY WAGE
function calculateDailyWage()
{
	localWorkHrs=$1
	wage=$(($localWorkHrs*$WAGE_PER_HOUR))
	echo $wage
}




#CALCULATING TOTAL WORKING HOURS
while [[ $workingHours -lt $WORKING_HOURS_LIMIT && $days -lt $WORKING_DAYS_PER_MONTH ]]
do
	(( days++ ))
	hoursPerDay=$( workingHoursPerDay $(( RANDOM%3 )) )
	workingHours=$(( $workingHours + $hoursPerDay ))
	employeeDailyWage[$days]=$( calculateDailyWage $hoursPerDay )
done


#CALCULATE THE TOTAL SALARY 
salary=$( calculateDailyWage $workingHours )

echo "Daily wage :" ${employeeDailyWage[@]}
echo "Days      :" ${!employeeDailyWage[@]}
