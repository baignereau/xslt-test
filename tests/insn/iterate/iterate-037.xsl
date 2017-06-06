<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    expand-text="yes"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <!-- context item absent in xsl:on-completion -->
    
    <xsl:output method="xml"/>
    
    <xsl:variable name="in">
        <tome name="pentateuch">
            <book>Genesis</book>
            <book>Exodus</book>
            <book>Leviticus</book>
            <book>Numbers</book>
            <book>Deuteronomy</book>
        </tome>
    </xsl:variable>
    
    <xsl:template name="xsl:initial-template">
        <out>
            <xsl:apply-templates select="$in/tome"/>
        </out>
    </xsl:template>

    <xsl:template match="tome">
        <xsl:variable name="me">
            <xsl:copy-of select="."/>
        </xsl:variable>
        <xsl:iterate select="*">
            <xsl:on-completion>
                <xsl:call-template name="fail"/>
            </xsl:on-completion>
            <xsl:sequence select="."/>
        </xsl:iterate>  
    </xsl:template>
    
    <xsl:template name="fail">
        <xsl:copy-of select="."/>
    </xsl:template>
    
 
    
</xsl:stylesheet>