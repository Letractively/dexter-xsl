<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output encoding="UTF-8" indent="no" media-type="text/html" method="html">
<!-- generated by dexter-0.3.0-beta (copyright (c) 2007-2009 Michael Dykman) from `source.xml'  -->
</xsl:output>
<xsl:template match="/">
		<xsl:element name="div">			<xsl:text>
	</xsl:text>
		<xsl:for-each select="data/person"><xsl:variable name="DexterDepthLevel1"><xsl:value-of select="position()"/></xsl:variable>				<xsl:element name="div">					<xsl:text>
		first </xsl:text>
									<xsl:element name="span"><xsl:value-of select="first"/></xsl:element>

									<xsl:text>
		middle </xsl:text>
									<xsl:element name="span"><xsl:choose><xsl:when test="middle"><xsl:value-of select="middle"/></xsl:when><xsl:otherwise><xsl:text>I have no middle name</xsl:text></xsl:otherwise></xsl:choose></xsl:element>

									<xsl:text>
		last </xsl:text>
									<xsl:element name="span"><xsl:choose><xsl:when test="(string-length(string(last)) &gt; 0)"><xsl:value-of select="last"/></xsl:when><xsl:otherwise><xsl:text>Jones</xsl:text></xsl:otherwise></xsl:choose></xsl:element>

									<xsl:text>
	</xsl:text>
				</xsl:element>

			</xsl:for-each>			<xsl:text>
</xsl:text>
		</xsl:element>

	</xsl:template>
</xsl:stylesheet>