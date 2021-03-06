<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  
  <xsl:import href="backwards-038.xsl"/>
  
  <!-- PURPOSE: effect of BC on keys in mixed 1.0 and 2.0 mode -->
  
  <xsl:key name="k" match="item" use="number(.)"/>
  
  <xsl:template match="/">
    <out>
      <xsl:for-each select="key('k', 1.0)">
        <k><xsl:copy-of select="."/></k>
      </xsl:for-each>
    </out>
  </xsl:template>
  
</xsl:stylesheet>