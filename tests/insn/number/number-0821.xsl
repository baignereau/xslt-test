<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<!-- Test xsl:number using digit-full-stop characters -->

<xsl:template match="/">
  <out>
    <xsl:for-each select="0 to 25">
      <xsl:number value="." format=" &#x2488;"/>
    </xsl:for-each>
  </out>
</xsl:template>
      

</xsl:stylesheet>
