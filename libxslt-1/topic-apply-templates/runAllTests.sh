#!/bin/bash

for xsl in topic-apply-templates*.xsl
do
 for xml in testdata*.xml
 do
  #echo $xsl $xml
  TESTBASE=$(basename $xsl .xsl)-with-$(basename $xml .xml)

  test -x "${TESTBASE}.sh" && lib/test.sh ${TESTBASE}.sh

 done
done
