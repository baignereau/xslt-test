<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Purpose: test tunnel param specified within xsl:call-template
  		and another tunnel param overrides the value -->

   <t:template match="/">
	  <out>
         <t:call-template name="temp1">
			<t:with-param name="par1" select="'foo'" tunnel="yes"/>
		 </t:call-template>
      </out>
   </t:template>

   <t:template name="temp1">
		<t:call-template name="temp2">
			<t:with-param name="par1" select="'bar'" tunnel="yes"/>
		</t:call-template>
   </t:template>

   <t:template name="temp2">
		<t:param name="par1" select="'xyz'" tunnel="yes"/>
		<t:value-of select="$par1"/>
   </t:template>
   
</t:transform>
