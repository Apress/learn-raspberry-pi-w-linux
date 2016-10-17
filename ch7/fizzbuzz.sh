#!/bin/bash
number=1
while [ $number -le 100 ]; do
if [ $(($number % 3)) -eq 0 ]; then
    if [ $(($number % 5)) -eq 0 ]; then
        echo "$number - FizzBuzz"
    else
           echo "$number - Fizz"
    fi
else
    if [ $(($number % 5)) -eq 0 ]; then
        echo "$number - Buzz"
    else
        echo $number
    fi
fi
number=$(($number +1))
done
