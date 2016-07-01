<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:f="http://www.w3.org/xslt30tests/functions" exclude-result-prefixes="map xs err f">

  <xsl:variable name="RUN" select="true()" static="yes"/>
  <xsl:strip-space elements="*"/>


  <!-- Test arity=1 ascent function -->

  <xsl:function name="f:depth-001" as="xs:integer" streamability="ascent">
    <xsl:param name="input" as="node()"/>
    <xsl:sequence select="count($input/ancestor-or-self::*)"/>
  </xsl:function>

  <xsl:template name="t-001" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM) ! f:depth-001(.)"/>
      </out>
    </xsl:stream>
  </xsl:template>
  
  <!-- Test arity=1 recursive ascent function -->
  
  <xsl:function name="f:depth-002" as="xs:integer" streamability="ascent">
    <xsl:param name="input" as="node()"/>
    <xsl:sequence select="if ($input/.. instance of document-node()) then 1 else f:depth-002($input/..) + 1"/>
  </xsl:function>
  
  <xsl:template name="t-002" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM) ! f:depth-002(.)"/>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test arity=2 ascent function -->

  <xsl:function name="f:get-attribute-value-003" as="xs:string"  streamability="ascent" use-when="true() or $RUN">
    <xsl:param name="element" as="node()"/>
    <xsl:param name="attribute-name" as="xs:string"/>
    <xsl:sequence select="string($element/@*[local-name() = $attribute-name])"/>
  </xsl:function>

  <xsl:template name="t-003" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:sequence select="/BOOKLIST/BOOKS/ITEM/WEIGHT ! f:get-attribute-value-003(., 'UNIT')"/>
      </out>
    </xsl:stream>
  </xsl:template>

  <!-- Test arity=2 ascent function with recursion -->
  
  <xsl:function name="f:get-inherited-attribute-value-004"  streamability="ascent" as="xs:string?" use-when="true() or $RUN">
    <xsl:param name="element" as="node()?"/>
    <xsl:param name="attribute-name" as="xs:string"/>
    <xsl:sequence select="
      if (empty($element)) then ()
      else if (exists($element/@*[local-name() = $attribute-name])) 
      then string($element/@*[local-name() = $attribute-name])
      else f:get-inherited-attribute-value-004($element/.., $attribute-name)"/>
  </xsl:function>
  
  <xsl:template name="t-004" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:sequence select="/BOOKLIST/BOOKS/ITEM/WEIGHT ! f:get-inherited-attribute-value-004(., 'CAT')"/>
      </out>
    </xsl:stream>
  </xsl:template>
  
  <!-- Test arity=1 recursive ascent function returning an ancestor node-->
  
  <xsl:function name="f:outermost-section" as="element(section)" streamability="ascent">
    <xsl:param name="input" as="node()"/>
    <xsl:sequence select="if ($input/ancestor::section) then f:outermost-section($input/ancestor::section[1]) else $input"/>
  </xsl:function>
  
  <xsl:template name="t-005" use-when="$RUN">
    <xsl:stream href="../docs/recursive.xml">
      <out>
        <xsl:value-of select="//foot ! f:outermost-section(.) ! @id"/>
      </out>
    </xsl:stream>
  </xsl:template>
  
  <!-- Test arity=1 ascent function returning an ancestor node-->
  
  <xsl:function name="f:outermost-section-id"  streamability="ascent">
    <xsl:param name="input" as="node()?"/>
    <xsl:sequence select="if ($input) then if (matches($input/@id, '^[0-9]+\.[0-9]+$')) then $input else f:outermost-section-id($input/..) else ()"/>
  </xsl:function>
  
  <xsl:template name="t-006" use-when="$RUN">
    <xsl:stream href="../docs/recursive.xml">
      <out>
        <xsl:value-of select="//foot ! f:outermost-section-id(.) ! @id"/>
      </out>
    </xsl:stream>
  </xsl:template>
  
 

</xsl:stylesheet>