<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

    <!-- Test xsl:context-item with apply-templates and use="prohibited" (dynamic error).-->
  
    <xsl:template match="doc">
      <xsl:context-item use="prohibited"/>
      <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="/">
      <out>
        <xsl:apply-templates select="doc"/> 
      </out>
    </xsl:template>  
          
  </xsl:stylesheet>