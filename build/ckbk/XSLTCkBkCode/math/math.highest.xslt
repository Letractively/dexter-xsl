<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:math="http://www.exslt.org/math" exclude-result-prefixes="math test"
 xmlns:test="http://www.ora.com/XSLTCookbook/test" id="math:math.highest">

<xsl:import href="math.max.xslt"/>

<xsl:template name="math:highest">
	<xsl:param name="nodes" select="/.."/>

	<xsl:variable name="max">
		<xsl:call-template name="math:max">
			<xsl:with-param name="nodes" select="$nodes"/>
		</xsl:call-template>
	</xsl:variable> 
	<xsl:choose>
		<xsl:when test="number($max) = $max">
			<xsl:copy-of select="$nodes[. = $max]"/>
		</xsl:when>
		<xsl:otherwise/>
	</xsl:choose>
</xsl:template>


<!-- TEST CODE: DO NOT REMOVE! -->
<xsl:template match="xsl:stylesheet[@id='math:math.log'] | xsl:include[@href='math.highest.xslt']"
xmlns:exsl="http://exslt.org/common">
<xsl:message>
TESTING math.highest
</xsl:message>

<xsl:choose>
	<xsl:when test="system-property('xsl:version') = 1.1">
		<xsl:for-each select="document('')/*/test:test">
			<xsl:variable name="ans">
				<xsl:call-template name="math:highest">
					<xsl:with-param name="nodes" select="test:data"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:if test="not($ans/* != test:data[. = current()/@ans]) and count($ans/*) != count(test:data[. = current()/@ans])">
				<xsl:message>
					math:highest TEST <xsl:value-of select="@num"/> FAILED [<xsl:copy-of select="$ans"/>] [<xsl:copy-of select="test:data[. = @ans]"/>]
				</xsl:message>
			</xsl:if>
		</xsl:for-each>
	</xsl:when>
	<xsl:when test="function-available('exsl:node-set')">
		<xsl:for-each select="document('')/*/test:test">
			<xsl:variable name="ans">
				<xsl:call-template name="math:highest">
					<xsl:with-param name="nodes" select="test:data"/>
				</xsl:call-template>
			</xsl:variable>
			<!--
			<xsl:message>
				<xsl:copy-of select="$ans"/>
				<xsl:text>&#xa;&#xa;&#xa;</xsl:text>
			</xsl:message>
			-->
			<xsl:if test="not(exsl:node-set($ans)/* != test:data[. = current()/@ans]) and count(exsl:node-set($ans)/*) != count(test:data[. = current()/@ans])">
				<xsl:message>
					math:highest TEST <xsl:value-of select="@num"/> FAILED [<xsl:copy-of select="exsl:node-set($ans)"/>] [<xsl:copy-of select="test:data[. = @ans]"/>]
				</xsl:message>
			</xsl:if>
		</xsl:for-each>
	</xsl:when>
	<xsl:otherwise>
		<xsl:message>
		WARNING math.highest test code requires XSLT 1.1 or higher or exsl:node-set
		THIS VERSION=[<xsl:value-of select="system-property('xsl:version')"/>] VENDOR=[<xsl:value-of select="system-property('xsl:vendor')"/>]
		</xsl:message>
	</xsl:otherwise>
</xsl:choose>

</xsl:template>

<test:test num="1" ans="9" xmlns="http://www.ora.com/XSLTCookbook/test">
	<data>9</data>
	<data>8</data>
	<data>7</data>
	<data>6</data>
	<data>5</data>
	<data>4</data>
	<data>3</data>
	<data>2</data>
	<data>1</data>
</test:test>

<test:test num="2" ans="1" xmlns="http://www.ora.com/XSLTCookbook/test">
	<data>1</data>
</test:test>


<test:test num="3" ans="1" xmlns="http://www.ora.com/XSLTCookbook/test">
	<data>-1</data>
	<data>1</data>
</test:test>

<test:test num="4" ans="0" xmlns="http://www.ora.com/XSLTCookbook/test">
	<data>0</data>
	<data>0</data>
</test:test>

<test:test num="5" ans="NaN" xmlns="http://www.ora.com/XSLTCookbook/test">
	<data>foo</data>
	<data>1</data>
</test:test>

<test:test num="6" ans="NaN" xmlns="http://www.ora.com/XSLTCookbook/test">
	<data>1</data>
	<data>foo</data>
</test:test>

<test:test num="7" ans="NaN" xmlns="http://www.ora.com/XSLTCookbook/test">
</test:test>

</xsl:stylesheet>
