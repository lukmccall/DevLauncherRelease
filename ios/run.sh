IFS=$'\n'
DESIRE_VALUE=$1
SRC=$2

for file in $(find $SRC/Pods/Target\ Support\ Files -type f -name "*.xcconfig")
do
  if grep -q "EX_DEV_LAUNCHER_FORCE_DEBUG_TOOLS" $file; then
    if ! grep -q "EX_DEV_LAUNCHER_FORCE_DEBUG_TOOLS=$DESIRE_VALUE" $file; then
        sed -i '' -e "s/EX_DEV_LAUNCHER_FORCE_DEBUG_TOOLS=.*/EX_DEV_LAUNCHER_FORCE_DEBUG_TOOLS=$DESIRE_VALUE/" $file
    fi
  else
    echo "EX_DEV_LAUNCHER_FORCE_DEBUG_TOOLS=$DESIRE_VALUE" >> $file;
  fi
done
unset IFS
