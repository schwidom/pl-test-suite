<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
 <xsl:output method="xml" indent="yes"/>

 <xsl:template name="root" match="rootnode">
  <xsl:element name="{name()}">
   <xsl:apply-templates mode="next"/>
  </xsl:element>
 </xsl:template>

 <xsl:template match="node()" mode="next">
   <xsl:copy-of select="." />
 </xsl:template>

</xsl:stylesheet>

