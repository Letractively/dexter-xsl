<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output encoding="UTF-8" indent="no" media-type="text/html" method="html">
<!-- generated by dexter from `source.xml'  -->
</xsl:output><xsl:template match="/"><xsl:choose><xsl:when test="/*/thing2"><xsl:apply-templates mode="source-xml-zzz" select="/*/thing2"/></xsl:when><xsl:otherwise><xsl:call-template name="source-xml-zzz"/></xsl:otherwise></xsl:choose></xsl:template><xsl:template match="/*/thing2" mode="source-xml-zzz" name="source-xml-zzz">
								<xsl:element name="zzz"><xsl:attribute name="id"><xsl:text>zzz</xsl:text></xsl:attribute><xsl:value-of select="stuff"/></xsl:element></xsl:template></xsl:stylesheet>