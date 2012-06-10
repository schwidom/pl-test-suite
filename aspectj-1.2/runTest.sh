#/bin/bash

test $# -eq 1 || { echo "usage: $0 <test>.java; exiting"; exit 1;}

CLASSPATH+=":/usr/share/aspectj/lib/aspectjrt.jar"
CLASSPATH+=":/usr/share/aspectj/lib/aspectjtools.jar"


ajc TestEnv.java $1 &&

java ${1/%.java/}


