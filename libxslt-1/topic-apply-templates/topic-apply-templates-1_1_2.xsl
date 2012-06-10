<?xml version='1.0'?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
 <xsl:output method="html"/>
 <xsl:template match="document">
<H1><xsl:apply-templates/></H1>
<H2><xsl:apply-templates/></H2>
 </xsl:template>
</xsl:stylesheet>

