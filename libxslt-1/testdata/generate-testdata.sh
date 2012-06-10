#!/bin/bash

xsltproc --param nodename-with-count 0 --param nodename-with-level 0 --param node-with-attributes 0 generate-testdata.xsl seed.xml > testdata.xml
xsltproc --param nodename-with-count 1 --param nodename-with-level 0 --param node-with-attributes 0 generate-testdata.xsl seed.xml > testdata-node-with-count.xml
xsltproc --param nodename-with-count 0 --param nodename-with-level 1 --param node-with-attributes 0 generate-testdata.xsl seed.xml > testdata-node-with-level.xml
xsltproc --param nodename-with-count 1 --param nodename-with-level 1 --param node-with-attributes 0 generate-testdata.xsl seed.xml > testdata-node-with-count-and-level.xml
xsltproc --param nodename-with-count 0 --param nodename-with-level 0 --param node-with-attributes 1 generate-testdata.xsl seed.xml > testdata-node-with-attributes.xml
xsltproc --param nodename-with-count 1 --param nodename-with-level 0 --param node-with-attributes 1 generate-testdata.xsl seed.xml > testdata-node-with-count-and-attributes.xml
xsltproc --param nodename-with-count 0 --param nodename-with-level 1 --param node-with-attributes 1 generate-testdata.xsl seed.xml > testdata-node-with-level-and-attributes.xml
xsltproc --param nodename-with-count 1 --param nodename-with-level 1 --param node-with-attributes 1 generate-testdata.xsl seed.xml > testdata-node-with-count-and-level-and-attributes.xml
