#!/usr/bin/php

<?
 require "test-env.inc";

 $te= new TestEnv();

 $te->checkComplainAndAdjustExpected( 0);

 $te->test( true);

 $te->checkComplainAndAdjustExpected( 1);

 echo $te->result(). "\n";
?>
