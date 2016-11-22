#!/bin/bash

set -e

mkdir -p tmp

SEE_ALSO_LINES="tmp/see-also-lines.txt"
CURRENT_LINE="tmp/current-line.txt"

cat <<EOF >"${SEE_ALSO_LINES}"
; 3rz4essgzj ; see also: dot_equals.clj identical?.clj
; c0phq1uqc2 ; see also: first.clj second.clj last.clj rest.clj drop.clj next.clj drop-last.clj butlast.clj fnext.clj
; etyc439hrp ; see also: areduce.clj reduce.clj
; h9o7bq5hnc ; see also: doc.clj source.clj with-out-str.clj
; ovmbllmxt4 ; see also: cons.clj topic-list-types.clj first.clj second.clj rest.clj next.clj
; udpxmt8cvv ; see also: defmacro.clj macroexpand.clj macroexpand-1.clj eval.clj let.clj binding.clj declare.clj 
; y004gg0rwc ; see also: fn.clj defn.clj
; z6bud4wslo ; see also: topic-polymorphism.clj defn.clj fn.clj defmulti.clj defmethod.clj
EOF

if ! test 0 -eq "$( cat "${SEE_ALSO_LINES}" | awk '{print $2}' | sort | uniq -d | wc -l )"; then
 echo "duplicate keys, exiting from $0"
 cat "${SEE_ALSO_LINES}" | awk '{print $2}' | sort | uniq -d 
 exit 1
fi

cat "${SEE_ALSO_LINES}" | while read -d $'\n' LINE ; do

 KEY="$( printf "%s\n" "$LINE" | awk '{ print $2 }' )"

 expr length "$KEY" ">=" 10 >/dev/null || { echo >&2 '! expr length "$KEY" ">=" 10 , exiting'; exit 1;} # created by createTestLineBashFromStdinOR.sh

done
  
cat "${SEE_ALSO_LINES}" | while read -d $'\n' LINE ; do

 printf "%s\n" "$LINE" >"$CURRENT_LINE"

 KEY="$( printf "%s\n" "$LINE" | awk '{ print $2 }' )"
  
 FNAMES=$( grep -o '[[:alnum:]@?!_-]*\.clj\>' "$CURRENT_LINE") # currently not needed
 for i in $FNAMES; do
  if ! test -f "$i" ; then echo "5267fbpqnj_1 : file not exists: $i from key $KEY" 
   else { 
    grep --fixed-strings --quiet "$KEY" "$i" || echo "5267fbpqnj_2: key $KEY not in file $i"
   }
  fi
 done
 # baustelle: pruefen, ob der key auch in den Dateien $FNAMES vorhanden ist und in anderen nicht

 # echo -- sed -i "/$KEY"'[[:space:];]\+see[[:space:]]*also[[:space:]]*:/ { r '"$CURRENT_LINE"$'\n'' d } ' *.clj
 # sed -i "/$KEY"'[[:space:];]\+see[[:space:]]*also[[:space:]]*:/ { r '"$CURRENT_LINE"$'\n'' d } ' *.clj
 sed -i "/$KEY"'[[:space:];]\+see[[:space:]]*also/ { r '"$CURRENT_LINE"$'\n'' d } ' *.clj

done

