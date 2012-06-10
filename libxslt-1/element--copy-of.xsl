<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
 <xsl:output method="xml" indent="yes"/>

 <xsl:variable name="var" select="'string content of variable var'"/>

 <xsl:template name="root" match="testdata">

  /: <xsl:copy-of select="/" />
  /.: <xsl:copy-of select="/." />
  /./.: <xsl:copy-of select="/./." />
  .: <xsl:copy-of select="." />
  ./.: <xsl:copy-of select="./." />
  ././.: <xsl:copy-of select="././." />
  /testdata: <xsl:copy-of select="/testdata" />
  @testattribute: <xsl:value-of select="@testattribute" />
  true(): <xsl:copy-of select="true()" />
  false(): <xsl:copy-of select="false()" />
  'this is a string': <xsl:copy-of select="'this is a string'" />
  1=1: <xsl:copy-of select="1=1" />
  $var: <xsl:copy-of select="$var" />

 </xsl:template>

</xsl:stylesheet>

