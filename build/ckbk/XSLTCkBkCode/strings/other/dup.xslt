<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>


	<xsl:template match="/">
	
	<result>
		<xsl:variable name="test">
			<xsl:call-template name="dup">
				<xsl:with-param name="input" select=" 'Sal' "/>
				<xsl:with-param name="count" select="10001"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="$test"/><xsl:value-of select="string-length($test)"/>
	</result>
	
	</xsl:template>
	
	<xsl:template name="dup">
	<xsl:param name="input"/>
	<xsl:param name="count" select="1"/>
	<xsl:choose>
		<xsl:when test="not($count) or not($input)"/>
		<xsl:when test="$count = 1">
			<xsl:value-of select="$input"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:if test="$count mod 2">
				<xsl:value-of select="$input"/>
			</xsl:if>
			<xsl:call-template name="dup">
				<xsl:with-param name="input" 
					select="concat($input,$input)"/>
				<xsl:with-param name="count" 
					select="floor($count div 2)"/>
			</xsl:call-template>	
		</xsl:otherwise>
	</xsl:choose>
	</xsl:template>
<!--
	<xsl:template name="dup">
		<xsl:param name="input"/>
		<xsl:param name="count" select="1"/>
		<xsl:variable name="rem" select="$count mod 2"/>
		<xsl:choose>
			<xsl:when test="$count=0"/>
			<xsl:when test="$count=1"><xsl:value-of select="$input"/></xsl:when>
			<xsl:when test="$rem = 0">
				<xsl:call-template name="dup">
					<xsl:with-param name="input" select="concat($input,$input)"/>
					<xsl:with-param name="count" select="$count div 2"/>
				</xsl:call-template>	
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$input"/>
				<xsl:call-template name="dup">
					<xsl:with-param name="input" select="concat($input,$input)"/>
					<xsl:with-param name="count" select="floor($count div 2)"/>
				</xsl:call-template>			
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
-->
</xsl:stylesheet>