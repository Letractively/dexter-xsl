<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output encoding="UTF-8" indent="no" media-type="text/html" method="html">
<!-- generated by dexter-0.3.0-beta (copyright (c) 2007-2009 Michael Dykman) from `source.xml'  -->
</xsl:output>
<xsl:template match="/">
<xsl:apply-templates mode="a5610a21d9d23b1d" select="data/found"/>
</xsl:template>
<xsl:template match="data/found" mode="a5610a21d9d23b1d">			<xsl:element name="tests">				<xsl:text>
		</xsl:text>
			<xsl:if test="@value = 'y'">					<xsl:element name="div"><xsl:attribute name="id"><xsl:text>test-4a</xsl:text><xsl:if test="last() &gt; 1">-<xsl:value-of select="generate-id()"/></xsl:if></xsl:attribute><xsl:attribute name="name">amfound</xsl:attribute></xsl:element>

				</xsl:if>				<xsl:text>
		</xsl:text>
			<xsl:if test="@value = 'n'">					<xsl:element name="div"><xsl:attribute name="id"><xsl:text>test-4b</xsl:text><xsl:if test="last() &gt; 1">-<xsl:value-of select="generate-id()"/></xsl:if></xsl:attribute><xsl:attribute name="name">notfound</xsl:attribute></xsl:element>

				</xsl:if>				<xsl:text>
</xsl:text>
			</xsl:element>

		</xsl:template>
</xsl:stylesheet>