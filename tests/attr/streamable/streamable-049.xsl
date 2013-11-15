<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
       
  
    <!-- within a streaming template, streamed value as second argument of a function -->
     
    <xsl:mode streamable="yes"/>
         
    <xsl:output method="xml" indent="no" encoding="UTF-8" />
  
    <xsl:strip-space elements="*"/>
      
    <xsl:template name="main">
      <out>
        <xsl:stream href="mixed.xml"><xsl:apply-templates select="."/></xsl:stream>
      </out>
    </xsl:template>
    
    <xsl:template match="book">
      <xsl:apply-templates select=".//chtitle"/>
    </xsl:template>
    
    <xsl:template match="chtitle">
      <title><xsl:value-of select="starts-with('Chapter 1111111111', .)"/></title>
    </xsl:template>
    
      
</xsl:transform>

