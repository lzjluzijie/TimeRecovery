for file in `ls files`
do
  time=`echo $file | sed -nr 's/[^0-9]//gp'`
  if [ ${#time} == "17" ]; then 
	time=${time:0:14}
  fi
  if [ ${#time} != "14" ]; then 
	continue
  fi
  time=${time:0:12}.${time:12:14}
  echo $time $file
  touch -t $time files/$file
done
