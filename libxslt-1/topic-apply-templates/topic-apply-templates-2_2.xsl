<?xml version='1.0'?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
 <xsl:output method="html"/>
 <xsl:template match="document">
  <html>
   <body>
    <h1>

    </h1>
    <h2>

    </h2>
   </body>
  </html>
 </xsl:template>
 <xsl:template match="inside-document">
<p><xsl:apply-templates/></p>
 </xsl:template>
</xsl:stylesheet>

