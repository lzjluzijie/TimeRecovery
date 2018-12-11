cd files
if [ ! -d notime ]; then
  mkdir notime
fi

for file in `ls`
do
  if [ -d "$file" ]; then
    continue
  fi
  
  time=`echo $file | sed -nr 's/[^0-9]//gp'`
  
  if [ ${#time} == "17" ]; then 
	time=${time:0:14}
  fi
  
  if [ ${#time} != "14" ]; then 
    echo cannot find time: $file
    mv $file notime/
	continue
  fi
  
  time=${time:0:12}.${time:12:14}
  echo $time $file
  touch -t $time $file
done
