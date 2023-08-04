#!/bin/bash

echo "Please enter a password:"
read  password

length=${#password}
echo "$length"

if [[ $length -gt 9 ]]; then
  v1=1
else
  v1=0
fi

if [[ $password =~ [A-Z] ]]; then
  v2=1
else
  v2=0
fi

if [[ $password =~ ['!@#$%^&*()_+'] ]]; then
  v3=1
else
  v3=0
fi

if [[ $password =~ [a-z] ]]; then
  v4=1
else
  v4=0
fi

total=$((v1 + v2 + v3 + v4))

if [[ $v1 != 1 ]]; then
  echo "Low strength password"
elif [[ $total == 2 ]]; then
  echo "Medium strength password"
elif [[ $total == 3 ]]; then
  echo "High strength password"
elif [[ $total == 4 ]]; then
  echo "Strong strength password"
fi

