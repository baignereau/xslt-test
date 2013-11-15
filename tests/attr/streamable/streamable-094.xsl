<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

    <xsl:output indent="no"/>
    <xsl:strip-space elements="chapter"/>
  
    
    <xsl:mode name="s" streamable="yes"/>
    
    <xsl:template name="main">
    <out>
      <xsl:stream href="ot.xml">
        <xsl:apply-templates select="//book" mode="s"/>
      </xsl:stream>
    </out>
    </xsl:template>
    
    <xsl:template match="*" mode="s">
      <xsl:copy>
        <xsl:apply-templates mode="s"/>
      </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/" mode="s">
      <xsl:copy>
        <xsl:apply-templates mode="s"/>
      </xsl:copy>
    </xsl:template>
    
    <xsl:template match="v" mode="s"/>
  
</xsl:stylesheet>