<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output encoding="UTF-8" indent="no" media-type="text/html" method="html">
<!-- generated by dexter-0.3.0-beta (copyright (c) 2007-2009 Michael Dykman) from `source.xml'  -->
</xsl:output>
<xsl:template match="/">
		<xsl:element name="tests">			<xsl:text>
	</xsl:text>
					<xsl:element name="div"><xsl:attribute name="id"><xsl:text>group-1</xsl:text></xsl:attribute>				<xsl:text>
		</xsl:text>
							<xsl:element name="div"><xsl:attribute name="id"><xsl:text>test-1</xsl:text></xsl:attribute><xsl:attribute name="name">found</xsl:attribute><xsl:value-of select="data/found/."/></xsl:element>

							<xsl:text>
		</xsl:text>
							<xsl:element name="div"><xsl:attribute name="id"><xsl:text>test-1</xsl:text></xsl:attribute><xsl:attribute name="name">found</xsl:attribute><xsl:choose><xsl:when test="data/found/."><xsl:text>the value is `</xsl:text><xsl:value-of select="data/found/."/><xsl:text>'</xsl:text></xsl:when><xsl:otherwise><xsl:text/></xsl:otherwise></xsl:choose></xsl:element>

							<xsl:text>
		</xsl:text>
							<xsl:element name="div"><xsl:attribute name="fakeattribute"><xsl:choose><xsl:when test="data/found/."><xsl:text>the value is `</xsl:text><xsl:value-of select="data/found/."/><xsl:text>'</xsl:text></xsl:when><xsl:otherwise><xsl:text/></xsl:otherwise></xsl:choose></xsl:attribute><xsl:attribute name="id"><xsl:text>test-2</xsl:text></xsl:attribute><xsl:attribute name="name">found</xsl:attribute></xsl:element>

							<xsl:text>
		</xsl:text>
							<xsl:element name="div"><xsl:attribute name="id"><xsl:text>test-3</xsl:text></xsl:attribute><xsl:attribute name="name">valueoffound</xsl:attribute><xsl:value-of select="data/found/./@value"/></xsl:element>

							<xsl:text>
		</xsl:text>
			<xsl:if test="string(data/found/./@value) = &quot;y&quot;">					<xsl:element name="div"><xsl:attribute name="id"><xsl:text>test-4a</xsl:text></xsl:attribute><xsl:attribute name="name">amfound</xsl:attribute></xsl:element>

				</xsl:if>				<xsl:text>
		</xsl:text>
			<xsl:if test="string(data/found/./@value) = &quot;n&quot;">					<xsl:element name="div"><xsl:attribute name="id"><xsl:text>test-4b</xsl:text></xsl:attribute><xsl:attribute name="name">notfound</xsl:attribute></xsl:element>

				</xsl:if>				<xsl:text>
		</xsl:text>
			<xsl:choose><xsl:when test="string(data/found/./@value) = &quot;y&quot;">						<xsl:element name="div"><xsl:attribute name="cond">true</xsl:attribute><xsl:attribute name="id"><xsl:text>test-5a</xsl:text></xsl:attribute>							<xsl:text>only one should show with 42</xsl:text>
						</xsl:element>

					</xsl:when><xsl:otherwise>						<xsl:element name="div"><xsl:attribute name="cond">false</xsl:attribute><xsl:attribute name="id"><xsl:text>test-5b</xsl:text></xsl:attribute>							<xsl:text>only one should show with 42</xsl:text>
						</xsl:element>

					</xsl:otherwise></xsl:choose>				<xsl:text>
		</xsl:text>
			<xsl:choose><xsl:when test="string(data/found/./@value) = &quot;n&quot;">						<xsl:element name="div"><xsl:attribute name="cond">false</xsl:attribute><xsl:attribute name="id"><xsl:text>test-6a</xsl:text></xsl:attribute>							<xsl:text>only one should show with 43</xsl:text>
						</xsl:element>

					</xsl:when><xsl:otherwise>						<xsl:element name="div"><xsl:attribute name="cond">true</xsl:attribute><xsl:attribute name="id"><xsl:text>test-6b</xsl:text></xsl:attribute>							<xsl:text>only one should show with 43</xsl:text>
						</xsl:element>

					</xsl:otherwise></xsl:choose>				<xsl:text>
		</xsl:text>
							<xsl:element name="option"><xsl:if test="string(data/found/./@value) = &quot;n&quot;"><xsl:attribute name="checked"><xsl:value-of select="&quot;true&quot;"/></xsl:attribute></xsl:if><xsl:attribute name="id"><xsl:text>test-7</xsl:text></xsl:attribute><xsl:attribute name="name">thing</xsl:attribute><xsl:attribute name="value">C</xsl:attribute></xsl:element>

							<xsl:text>
		</xsl:text>
							<xsl:element name="option"><xsl:if test="string(data/found/./@value) = &quot;y&quot;"><xsl:attribute name="checked"><xsl:value-of select="&quot;true&quot;"/></xsl:attribute></xsl:if><xsl:attribute name="id"><xsl:text>test-8</xsl:text></xsl:attribute><xsl:attribute name="name">thing</xsl:attribute><xsl:attribute name="value">D</xsl:attribute></xsl:element>

							<xsl:text>
	</xsl:text>
			</xsl:element>

					<xsl:text>


	</xsl:text>
					<xsl:element name="div"><xsl:attribute name="id"><xsl:text>group-2</xsl:text></xsl:attribute>				<xsl:text>
			a record
		</xsl:text>
			<xsl:for-each select="data/record/*"><xsl:variable name="DexterDepthLevel1"><xsl:value-of select="position()"/></xsl:variable>					<xsl:element name="div"><xsl:choose><xsl:when test="local-name(.) and ."><xsl:text>new record </xsl:text><xsl:value-of select="local-name(.)"/><xsl:text> = </xsl:text><xsl:value-of select="."/></xsl:when><xsl:otherwise><xsl:text/></xsl:otherwise></xsl:choose></xsl:element>

				</xsl:for-each>				<xsl:text>

	
		</xsl:text>
							<xsl:element name="div">					<xsl:text>
			</xsl:text>
									<xsl:element name="span"><xsl:value-of select="data/record/one"/></xsl:element>

									<xsl:text>
			</xsl:text>
									<xsl:element name="span"><xsl:value-of select="data/record/two"/></xsl:element>

									<xsl:text>
			</xsl:text>
									<xsl:element name="span"><xsl:value-of select="data/record/three"/></xsl:element>

									<xsl:text>
			</xsl:text>
									<xsl:element name="span"><xsl:value-of select="data/record/four"/></xsl:element>

									<xsl:text>
		</xsl:text>
				</xsl:element>

							<xsl:text>
	</xsl:text>
			</xsl:element>

					<xsl:text>
</xsl:text>
		</xsl:element>

	</xsl:template>
</xsl:stylesheet>