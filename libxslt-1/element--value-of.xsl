<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
 <xsl:output method="xml" indent="yes"/>

 <xsl:variable name="var" select="'string content of variable var'"/>

 <xsl:template name="root" match="testdata">

  /: <xsl:value-of select="/" />
  /.: <xsl:value-of select="/." />
  /./.: <xsl:value-of select="/./." />
  .: <xsl:value-of select="." />
  ./.: <xsl:value-of select="./." />
  ././.: <xsl:value-of select="././." />
  /testdata: <xsl:value-of select="/testdata" />
  @testattribute: <xsl:value-of select="@testattribute" />
  true(): <xsl:value-of select="true()" />
  false(): <xsl:value-of select="false()" />
  'this is a string': <xsl:value-of select="'this is a string'" />
  1=1: <xsl:value-of select="1=1" />
  $var: <xsl:value-of select="$var" />

 </xsl:template>

</xsl:stylesheet>

