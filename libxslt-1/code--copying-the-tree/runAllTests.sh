#!/bin/bash

for i in variant*.sh; do ../lib/test.sh $i; done

../lib/test.sh chkdiffs.sh

