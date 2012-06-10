#!/usr/bin/php

<?
 require "test-env.inc";

 $te= new TestEnv();

 $te->checkComplainAndAdjustExpected( 0);

 $te->test( true);
 $te->test( true);

 $te->checkComplainAndAdjustExpected( 2);

 $te->test( true);
 $te->test( true);
 $te->test( true);

 $te->checkComplainAndAdjustExpected( 3);

 echo $te->result(). "\n";
?>
