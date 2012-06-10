#!/bin/bash

source testenv.source
source git-setup.source

tst_checkComplainAndAdjustExpected 0

(
 mkdir local

 (
  cd local

  git init

  echo init > init; git add init; git commit -m init init;
  COMMIT_INIT=$(git --no-pager log | head -n1 | sed 's/^commit //')
  

  echo 1 > a; git add a; git commit -m a a;
  echo 2 > a; git add a; git commit -m a a;
  echo 3 > a; git add a; git commit -m a a;
  echo 4 > a; git add a; git commit -m a a;
  echo 5 > a; git add a; git commit -m a a;
  COMMIT_5=$(git --no-pager log | head -n1 | sed 's/^commit //')
  echo 6 > a; git add a; git commit -m a a;
  echo 7 > a; git add a; git commit -m a a;
  echo 8 > a; git add a; git commit -m a a;
  echo 9 > a; git add a; git commit -m a a;
  
  tst_test test ! "${COMMIT_5}" == $(git --no-pager log | head -n1 | sed 's/^commit //')


  cat >test-script.sh <<EOF
#!/bin/bash

echo test-script

test 5 -ge \$( cat a) 

RES=\$?

case \$RES in
 (0) exit \$RES ;;
 (1) exit \$RES ;;
 (2) exit 125 ;;
 (*) echo "unexpected argument \$RES" ;;
esac

EOF

  chmod u+x test-script.sh

  git bisect start master "${COMMIT_INIT}" 
  git bisect run ./test-script.sh

  tst_test test "${COMMIT_5}" == $(git --no-pager log | head -n1 | sed 's/^commit //')

  tst_state_save
 )
 tst_state_load

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 2

echo $(tst_result)

