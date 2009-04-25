<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                
<xsl:template match="/">
  <xsl:call-template name="tokenize">
    <xsl:with-param name="string" select=" 'The rain in Spain falls  mainly in the plain.' "/>
    <xsl:with-param name="delimiters" select="''"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="tokenize">
	<xsl:param name="string" select="''" />
  <xsl:param name="delimiters" select="' &#x9;&#xA;'" />
  <xsl:choose>
    <xsl:when test="not($string)" />
    <xsl:when test="not($delimiters)">
      <xsl:call-template name="_tokenize-characters">
        <xsl:with-param name="string" select="$string" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="_tokenize-delimiters">
        <xsl:with-param name="string" select="$string" />
        <xsl:with-param name="delimiters" select="$delimiters" />
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--
<xsl:template name="_tokenize-characters">
  <xsl:param name="string" />
  <xsl:if test="$string">
    <token><xsl:value-of select="substring($string, 1, 1)" /></token>
    <xsl:call-template name="_tokenize-characters">
      <xsl:with-param name="string" select="substring($string, 2)" />
    </xsl:call-template>
  </xsl:if>
</xsl:template>
-->

<xsl:template name="_tokenize-characters">
  <xsl:param name="string" />
  <xsl:param name="len" select="string-length($string)"/>
  <xsl:choose>
	  <xsl:when test="$len = 1">
      <token><xsl:value-of select="$string"/></token>
	  </xsl:when>
	  <xsl:otherwise>
      <xsl:call-template name="_tokenize-characters">
        <xsl:with-param name="string" select="substring($string, 1, floor($len div 2))" />
        <xsl:with-param name="len" select="floor($len div 2)"/>
      </xsl:call-template>
      <xsl:call-template name="_tokenize-characters">
        <xsl:with-param name="string" select="substring($string, floor($len div 2) + 1)" />
        <xsl:with-param name="len" select="ceiling($len div 2)"/>
      </xsl:call-template>
	  </xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="_tokenize-delimiters">
  <xsl:param name="string" />
  <xsl:param name="delimiters" />
  <xsl:param name="last-delimit"/> 
  <xsl:variable name="delimiter" select="substring($delimiters, 1, 1)" />
  <xsl:choose>
    <xsl:when test="not($delimiter)">
      <token><xsl:value-of select="$string"/></token>
    </xsl:when>
    <xsl:when test="contains($string, $delimiter)">
      <xsl:if test="not(starts-with($string, $delimiter))">
        <xsl:call-template name="_tokenize-delimiters">
          <xsl:with-param name="string" select="substring-before($string, $delimiter)" />
          <xsl:with-param name="delimiters" select="substring($delimiters, 2)" />
        </xsl:call-template>
      </xsl:if>
      <xsl:call-template name="_tokenize-delimiters">
        <xsl:with-param name="string" select="substring-after($string, $delimiter)" />
        <xsl:with-param name="delimiters" select="$delimiters" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="_tokenize-delimiters">
        <xsl:with-param name="string" select="$string" />
        <xsl:with-param name="delimiters" select="substring($delimiters, 2)" />
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>