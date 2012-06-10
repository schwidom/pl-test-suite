#!/bin/bash

for i in variant*.exp; do
 diff ../testdata/testdata-node-with-count-and-level-and-attributes.xml $i
done

