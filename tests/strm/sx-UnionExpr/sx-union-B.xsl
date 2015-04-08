<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="insertion" as="element()*">
      <a>A</a>
      <b>B</b>
    </xsl:variable>
    
    <xsl:variable name="numeric-insertion" as="element()*">
      <a>11</a>
      <b>22</b>
    </xsl:variable>
    
    <!-- union expression (streaming arg 2): grounded operand -->
    
    <xsl:template name="r-002" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="($insertion union  copy-of(/BOOKLIST/BOOKS/ITEM/PRICE))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): striding operand, inspection usage -->
    
    <xsl:template name="r-010" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="count(($insertion union  /BOOKLIST/BOOKS/ITEM/PRICE))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): striding operand, absorption usage -->
    
    <xsl:template name="r-011" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="sum(($numeric-insertion union /BOOKLIST/BOOKS/ITEM/PRICE))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): striding operand, transmission usage -->
    
    <xsl:template name="r-012" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="($insertion union  /BOOKLIST/BOOKS/ITEM/PRICE)[position() mod 2 = 0]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): striding operand, focus-setting usage -->
    
    <xsl:template name="r-013" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="($numeric-insertion union /BOOKLIST/BOOKS/ITEM/PRICE) ! (.+1)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): striding operand, focus-controlled usage -->
    
    <xsl:template name="r-014" use-when="true() or $RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="/BOOKLIST/BOOKS/ITEM[1] ! ($insertion union  *)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): striding operand, focus-setting usage -->
    
    <xsl:template name="r-015" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="($numeric-insertion union /BOOKLIST/BOOKS/ITEM/PRICE)">
            <xsl:value-of select=".+1 || ' '"/>
          </xsl:for-each>  
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): striding operand, focus-controlled usage -->
    
    <xsl:template name="r-016" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="/BOOKLIST/BOOKS/ITEM[1]">
            <xsl:copy-of select="($insertion union *)"/>
          </xsl:for-each>  
        </out>
      </xsl:stream>
    </xsl:template>    
    
    <!-- union expression (streaming arg 2): striding operand, focus-setting usage for inspection action -->
    
    <xsl:template name="r-017" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="($insertion union /BOOKLIST/BOOKS/ITEM[1]/*) ! contains(name(), 'E')"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): striding operand, apply-templates usage -->
    
    <xsl:template name="r-018" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:apply-templates select="($insertion union /BOOKLIST/BOOKS/ITEM[1]/*)" mode="r-018-mode"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:mode name="r-018-mode" streamable="yes" on-no-match="deep-skip"/>
    <xsl:template match="ITEM/*" mode="r-018-mode"><xsl:value-of select="."/></xsl:template>
    
    <!-- union expression (streaming arg 2): crawling operand, inspection usage -->
    
    <xsl:template name="r-020" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="count(($insertion union //PRICE))"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- union expression (streaming arg 2): crawling operand, absorption usage -->
    
    <xsl:template name="r-021" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="count(($insertion union /BOOKLIST/BOOKS/ITEM[1]//text()))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): crawling operand, transmission usage -->
    
    <xsl:template name="r-022" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="($insertion union /BOOKLIST/BOOKS/ITEM[1]//text())[position() lt 4]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): crawling operand, focus-setting usage -->
    
    <xsl:template name="r-023" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="($numeric-insertion, //PRICE/text()) ! (.+1)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): climbing operand, inspection usage -->
    
    <xsl:template name="r-030" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="($insertion union /BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::*) ! name()"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): climbing operand, inspection usage, removal of duplicates -->
    
    <xsl:template name="r-031" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="($insertion union  /BOOKLIST/BOOKS/ITEM/PRICE/ancestor::*) ! name()"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): climbing operand, absorption usage -->
    
    <xsl:template name="r-032" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="($insertion union /BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::*/@*)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): climbing operand, absorption usage -->
    
    <xsl:template name="r-033" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="($insertion union /BOOKLIST/BOOKS/ITEM/ancestor-or-self::*/@CAT)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): climbing operand, absorption usage, removal of duplicates -->
    
    <xsl:template name="r-034" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="($insertion union /BOOKLIST/BOOKS/ITEM/PRICE/ancestor-or-self::*/@CAT)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- union expression (streaming arg 2): climbing operand, absorption usage, removal of duplicates -->
    
    <xsl:template name="r-035" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="($insertion union //PRICE/ancestor-or-self::*/@*)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming union operator: striding operand, transmission usage  -->
    
    <xsl:template name="r-036" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="/*/CATEGORIES/CATEGORY">
            <v><xsl:value-of select="@DESC union @CODE"/></v>
          </xsl:for-each>
        </out>
      </xsl:stream>
    </xsl:template>  
    
    <!-- Streaming union operator: two climbing/motionless operands both comprising streamed nodes -->
    
    <xsl:template name="r-037" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="outermost(//WEIGHT)">
            <v><xsl:value-of select="ancestor-or-self::*[@UNIT]/@UNIT | 
                    ancestor::*[@OWNER]/@OWNER | ../@* | ancestor::*[@CAT]/@CAT"/></v>
          </xsl:for-each>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming union operator: a motionless and a striding operand both comprising streamed nodes -->
    
    <xsl:template name="r-038" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="/*/BOOKS/ITEM[1]">
            <xsl:value-of select="(. | *) ! local-name()"/>
          </xsl:for-each>
        </out>
      </xsl:stream>
    </xsl:template>   
    
    <!-- Streaming union operator: a motionless and a striding operand both comprising streamed nodes -->
    
    <xsl:template name="r-039" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="/*/BOOKS/ITEM[1]">
            <xsl:value-of select="(* | .) ! local-name()"/>
          </xsl:for-each>
        </out>
      </xsl:stream>
    </xsl:template>
  
  <!-- Streaming union operator: a motionless and a striding operand both comprising streamed nodes -->
  
  <xsl:template name="r-040" use-when="$RUN">
    <xsl:stream href="../docs/books.xml">
      <out>
        <xsl:for-each select="/*/BOOKS/ITEM[1]">
          <xsl:value-of select="(. | descendant-or-self::*) ! local-name()"/>
        </xsl:for-each>
      </out>
    </xsl:stream>
  </xsl:template>  
    
                  
    
</xsl:stylesheet>