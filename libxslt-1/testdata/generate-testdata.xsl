<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
 <xsl:output method="xml" indent="yes"/>

 <xsl:param name="max-count" select="3"/>
 <xsl:param name="max-level" select="3"/>
 <xsl:param name="nodename-with-count"/>
 <xsl:param name="nodename-with-level"/>
 <xsl:param name="node-with-attributes"/>


 <xsl:template name="root" match="testdata">
  <xsl:element name="rootnode">
   <xsl:call-template name="rek">
    <xsl:with-param name="count" select="0"/>
    <xsl:with-param name="level" select="0"/>
   </xsl:call-template>
  </xsl:element>
 </xsl:template>

 <xsl:template name="rek">
  <xsl:param name="count" />
  <xsl:param name="level" />
  <xsl:param name="path" />
  
  <xsl:if test=" number( $max-count) > number( $count) and number( $max-level) > number( $level)">

   <xsl:variable name="nodename-init" select="'node'"/>
   <!--<xsl:variable name="nodename" select="'node'"/>-->

   <xsl:variable name="nodename">
    <xsl:value-of select="$nodename-init" />

    <xsl:if test=" boolean( $nodename-with-count)">
     <xsl:text>-</xsl:text>
     <xsl:value-of select="$count" />
    </xsl:if>

    <xsl:if test=" boolean( $nodename-with-level)">
     <xsl:text>-</xsl:text>
     <xsl:value-of select="$level" />
    </xsl:if>

   </xsl:variable>

   <xsl:element name="{ $nodename}" > <!-- "node-{ $count}-{ $level}" -->

   <xsl:if test=" boolean( $node-with-attributes)">
    <xsl:attribute name="count">
     <xsl:value-of select="$count" />
    </xsl:attribute>
    <xsl:attribute name="level">
     <xsl:value-of select="$level" />
    </xsl:attribute>
    <xsl:attribute name="path">
     <xsl:value-of select="$path" />
    </xsl:attribute>
   </xsl:if>

   <xsl:element name="count">
    <xsl:value-of select="$count" />
   </xsl:element>
 
   <xsl:element name="level">
    <xsl:value-of select="$level" />
   </xsl:element>

   <xsl:element name="path">
    <xsl:value-of select="$path" />
   </xsl:element>

    <xsl:call-template name="rek">
     <xsl:with-param name="count" select="0"/>
     <xsl:with-param name="level" select="1+ number( $level)"/>
     <xsl:with-param name="path" select="concat( $path, ' ', $count)"/>
    </xsl:call-template>
    
   </xsl:element>

   <xsl:call-template name="rek">
    <xsl:with-param name="count" select="1+ number( $count)"/>
    <xsl:with-param name="level" select="$level"/>
    <xsl:with-param name="path" select="$path"/>
   </xsl:call-template>
  </xsl:if>

 </xsl:template>

</xsl:stylesheet>

