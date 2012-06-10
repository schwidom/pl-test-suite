#!/bin/bash

for xsl in topic-apply-templates*.xsl
do
 for xml in testdata*.xml
 do
  #echo $xsl $xml
  TESTBASE=$(basename $xsl .xsl)-with-$(basename $xml .xml)

cat <<EOF >${TESTBASE}.sh
#!/bin/bash

xsltproc $xsl $xml

EOF

  chmod u+x ${TESTBASE}.sh
  lib/test.sh ${TESTBASE}.sh

  test -s ${TESTBASE}.out || { rm -f ${TESTBASE}.*; false;} &&
  { cp -f ${TESTBASE}.out ${TESTBASE}.exp;}

 done
done
