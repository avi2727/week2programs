#!/bin/bash -x
#!/bin/bash -x

echo "Welcome to Arithmetic Computation"

#TAKE USER INPUT 
read -p "Enter the value of a :" number1
read -p "Enter the value of b :" number2
read -p "Enter the value of c :" number3

#ARITHMETIC OPERATIONS
answer1=$(echo "scale=2;$number1+$number2*$number3"|bc)
answer2=$(echo "scale=2;$number1*$number2+$number3"|bc)
answer3=$(echo "scale=2;$number3+$number1/$number2"|bc)
answer4=$(echo "scale=2;$number1%$number2+$number3"|bc)

#STORE ANSWERS IN THE DICTIONARY
declare -A answersDictionary

answersDictionary[answer1]=$answer1
answersDictionary[answer2]=$answer2
answersDictionary[answer3]=$answer3
answersDictionary[answer4]=$answer4

#READ VALUES FROM THE DICTIONARY INTO ARRAY
echo "values from the dictionary into array:"
for((index=0; index<${#answersDictionary[@]}; index++))
do
	array[$index]=${answersDictionary[answer$((index+1))]}
done

#DISPLAY THE VALUES OF ARRAY
echo "Array elements in decending order"
echo ${array[@]}

#LENGTH OF ARRAY
length=${#array[@]}

#SORTING ARRAY IN DESCENDING ORDER
for((index1=0; index1<$length; index1++))
do
	for((index2=$(($index1+1)); index2<$length; index2++))
	do
		if(( $( echo "${array[index1]} < ${array[index2]}" |bc -l ) ))
		then
			temp=${array[index1]}
			array[index1]=${array[index2]}
			array[index2]=$temp
		fi
	done
done
#SORTING ARRAY IN ASSENDING ORDER
for((index1=0; index1<$length; index1++))
do
	for((index2=$(($index1+1)); index2<$length; index2++))
	do
		if(( $( echo "${array[index1]} > ${array[index2]}" |bc -l ) ))
		then
			temp=${array[index1]}
			array[index1]=${array[index2]}
			array[index2]=$temp
		fi
	done
done

#DISPLAY THE SORTED ARRAY
echo "Array elements in assending order"
echo ${array[@]}

