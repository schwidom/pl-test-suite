<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
 <xsl:output method="xml" indent="yes"/>
 <xsl:strip-space elements="*"/>

 <xsl:template name="root" match="node-self">
  <xsl:element name="result">

   <xsl:for-each select="child::node()">
    <xsl:copy />
   </xsl:for-each>

  </xsl:element>
 </xsl:template>

</xsl:stylesheet>

