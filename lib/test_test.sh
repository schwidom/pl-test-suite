#!/bin/bash

echo test_positive.sh
./test.sh test_positive.sh && echo ok
echo test_negative.sh
./test.sh test_negative.sh || echo fail
echo test_dot_sh_forgotten
./test.sh test_dot_sh_forgotten || echo fail
echo test_isdir.sh
./test.sh test_isdir.sh || echo fail


