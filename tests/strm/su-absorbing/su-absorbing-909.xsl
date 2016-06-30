<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:f="http://www.w3.org/xslt30tests/functions" exclude-result-prefixes="map xs err f">


  <xsl:strip-space elements="*"/>



  <!-- Non-streamable absorbing function - has-children() is not deemed consuming -->
  
  <xsl:function name="f:has-children" as="xs:boolean" streamability="absorbing">
    <xsl:param name="input" as="node()"/>
    <xsl:sequence select="has-children(.)"/>
  </xsl:function>
  
  <xsl:template name="main">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM) ! f:has-children(.)"/>
      </out>
    </xsl:stream>
  </xsl:template>

</xsl:stylesheet>
