<?xml version='1.0'?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
 <xsl:output method="html"/>
 <xsl:template match="document">
  <html>
   <body>
    <h1>
<xsl:value-of select="."/>
    </h1>
   </body>
  </html>
 </xsl:template>
</xsl:stylesheet>

