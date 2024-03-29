<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" indent="no" media-type="text/html" method="html" />
	
<xsl:template name="escape-quotes">
	<xsl:param name="param1" select="."/>
	<xsl:param name="param2" >'</xsl:param>
	<xsl:param name="param3" >\</xsl:param>
	<xsl:choose>
		<xsl:when test="contains($param1,$param2)" >
			<xsl:value-of select="substring-before($param1,$param2)" />
			<xsl:value-of select="$param3" />
			<xsl:value-of select="$param2" />
			<xsl:call-template name="escape-quotes">
				<xsl:with-param name="param1" select="substring-after($param1,$param2)" />
				<xsl:with-param name="param2" select="$param2" />
				<xsl:with-param name="param3" select="$param3" />
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$param1" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

	
<xsl:template name="csv">
	<xsl:param name="param1" ><xsl:copy-of select="." /></xsl:param> 
	<xsl:apply-templates select="$param1" mode="csv" />
</xsl:template>

<xsl:template match="*" mode="csv" >
	<xsl:param name="seperator">,</xsl:param>
	<xsl:for-each select="descendant-or-self::*[string-length(normalize-space(text()))> 0]">
 		<xsl:value-of select="." />
 		<xsl:if test="position() != last()" >
 			<xsl:value-of select="$seperator" />
 		</xsl:if> 
	</xsl:for-each>
</xsl:template>
<xsl:template name="jsstr" >
	<xsl:param name="param1" select="."/>'<xsl:call-template name="escape-quotes">
			<xsl:with-param name="param1" ><xsl:call-template name="escape-quotes">
			<xsl:with-param name="param1" select="$param1" />
			<xsl:with-param name="param2" >\</xsl:with-param>
			<xsl:with-param name="param3" >\</xsl:with-param>
		</xsl:call-template></xsl:with-param>
			<xsl:with-param name="param2" >'</xsl:with-param>
			<xsl:with-param name="param3" >\</xsl:with-param>
		</xsl:call-template>'</xsl:template>



<xsl:template name="jshash">
	<xsl:param name="param1" ><xsl:copy-of select="." /></xsl:param>
	<xsl:apply-templates select="$param1" mode="jshash" />
</xsl:template>


<xsl:template match="*" mode="jshash">
	<xsl:text>{ </xsl:text>
	<xsl:for-each select="*" >
		<xsl:value-of select="local-name(.)" />
		<xsl:text>:</xsl:text>
		<xsl:choose>
			<xsl:when test="*">
			<!-- 
				<xsl:call-template name="jshash" >
					<xsl:with-param name="param1">
						<xsl:copy-of select="document(.)" />
					</xsl:with-param>
				</xsl:call-template>
			 -->
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="jsstr" />
			</xsl:otherwise>
		</xsl:choose>
 		<xsl:if test="position()!=last()" >
 			<xsl:text>, </xsl:text>
 		</xsl:if>
	</xsl:for-each>
	<xsl:text> }</xsl:text>
</xsl:template>

<xsl:template match="text()" mode="jshash">
	<xsl:call-template name="jsstr" />
</xsl:template>


</xsl:stylesheet>