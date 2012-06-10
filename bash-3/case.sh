#!/bin/bash

source testenv.source

tst_checkComplainAndAdjustExpected 0

(
 
 case 1 in
  
  1) tst_test true ;;

  1) tst_test false ;;

  *) tst_test false ;;

 esac

 case 1 in
  
  (1) tst_test true ;;

  (1) tst_test false ;;

  (*) tst_test false ;;

 esac

 case 2 in
  
  (1) tst_test false ;;

  (1) tst_test false ;;

  (*) tst_test true ;;

 esac

 case 1 in
  
  (1|2) tst_test true ;;

  (*) tst_test false ;;

 esac

 case 2 in
  
  (1|2) tst_test true ;;

  (*) tst_test false ;;

 esac

 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 5

echo $(tst_result)

