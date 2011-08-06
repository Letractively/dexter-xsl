<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE xsl:stylesheet [
 <!ENTITY hellip "&#8230;" >
 <!ENTITY nbsp "&#160;" >
 ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" encoding="UTF-8" indent="no" media-type="text/html" method="html">
<!-- generated by dexter from `index.html'  -->
</xsl:output><xsl:include href="index.html-header.xsl"/><xsl:template match="/"><xsl:element name="html"><xsl:text>
</xsl:text><xsl:element name="head"><xsl:text>
</xsl:text><xsl:element name="meta"><xsl:attribute name="content">text/html; charset=utf-8</xsl:attribute><xsl:attribute name="http-equiv">Content-Type</xsl:attribute></xsl:element><xsl:text>
</xsl:text><xsl:element name="title"><xsl:text>Workastica.com</xsl:text></xsl:element><xsl:text>
</xsl:text><xsl:element name="meta"><xsl:attribute name="content">careers</xsl:attribute><xsl:attribute name="name">keywords</xsl:attribute></xsl:element><xsl:text>
</xsl:text><xsl:element name="meta"><xsl:attribute name="content">How do I become a ... when I grow up</xsl:attribute><xsl:attribute name="name">description</xsl:attribute></xsl:element><xsl:text>
</xsl:text><xsl:element name="link"><xsl:attribute name="href">/css/workastica.css</xsl:attribute><xsl:attribute name="media">all</xsl:attribute><xsl:attribute name="rel">stylesheet</xsl:attribute><xsl:attribute name="type">text/css</xsl:attribute></xsl:element><xsl:text>
</xsl:text></xsl:element><xsl:text>
</xsl:text><xsl:element name="body"><xsl:text>
</xsl:text><xsl:element name="div"><xsl:attribute name="id"><xsl:text>ieCenter</xsl:text></xsl:attribute><xsl:text>
</xsl:text><xsl:element name="div"><xsl:attribute name="id"><xsl:text>centerContainer</xsl:text></xsl:attribute><xsl:text>
</xsl:text><xsl:call-template name="index-html-header"/><xsl:text>

</xsl:text><xsl:element name="div"><xsl:attribute name="class">floatleft</xsl:attribute><xsl:attribute name="id"><xsl:text>page</xsl:text></xsl:attribute><xsl:text>
	</xsl:text><xsl:element name="div"><xsl:attribute name="class">entry floatleft box-style1</xsl:attribute><xsl:attribute name="id"><xsl:text>box1</xsl:text></xsl:attribute><xsl:text>
		</xsl:text><xsl:element name="div"><xsl:attribute name="class">floatleft</xsl:attribute><xsl:element name="img"><xsl:attribute name="alt"/><xsl:attribute name="height">213</xsl:attribute><xsl:attribute name="src">images/homepage03.jpg</xsl:attribute><xsl:attribute name="width">584</xsl:attribute></xsl:element></xsl:element><xsl:text>
	
		</xsl:text><!-- loged in  --><xsl:text>

		</xsl:text><xsl:choose><xsl:when test="result/Member"><xsl:element name="div"><xsl:attribute name="id"><xsl:text>login</xsl:text></xsl:attribute><xsl:text>
			</xsl:text><xsl:element name="div"><xsl:element name="h2"><xsl:attribute name="class">title</xsl:attribute><xsl:text>Client Information</xsl:text></xsl:element></xsl:element><xsl:text>
			 </xsl:text><xsl:element name="div"><xsl:attribute name="class">entry leftmargin</xsl:attribute><xsl:text>
				</xsl:text><xsl:element name="form"><xsl:attribute name="action"/><xsl:attribute name="method">post</xsl:attribute><xsl:text>
					</xsl:text><xsl:element name="fieldset"><xsl:attribute name="class">leftmargin</xsl:attribute><xsl:text>
						</xsl:text><xsl:element name="table"><xsl:text>
							</xsl:text><xsl:element name="tr"><xsl:element name="td"><xsl:text>username:</xsl:text></xsl:element><xsl:element name="td"><xsl:value-of select="result/Member/username"/></xsl:element></xsl:element><xsl:text>
							</xsl:text><xsl:element name="tr"><xsl:element name="td"><xsl:text>Job Title:</xsl:text></xsl:element><xsl:element name="td"><xsl:value-of select="employment/jobtitle"/></xsl:element></xsl:element><xsl:text>
							</xsl:text><xsl:element name="tr"><xsl:element name="td"><xsl:text>Marital Status:</xsl:text></xsl:element><xsl:element name="td"><xsl:value-of select="personal/married"/></xsl:element></xsl:element><xsl:text>
							</xsl:text><xsl:element name="tr"><xsl:element name="td"><xsl:text>Last Logged in:</xsl:text></xsl:element><xsl:element name="td"><xsl:value-of select="lastLogged"/></xsl:element></xsl:element><xsl:text>
							</xsl:text><xsl:element name="tr"><xsl:element name="td"><xsl:text>Unread emails:</xsl:text></xsl:element><xsl:element name="td"><xsl:value-of select="email/numUnread"/></xsl:element></xsl:element><xsl:text>
							</xsl:text><xsl:element name="tr"><xsl:element name="td"><xsl:text>Friends online:</xsl:text></xsl:element><xsl:element name="td"><xsl:value-of select="friends/online"/></xsl:element></xsl:element><xsl:text>
							</xsl:text><xsl:element name="tr"><xsl:element name="td"><xsl:element name="a"><xsl:attribute name="href">logout</xsl:attribute><xsl:text>logout</xsl:text></xsl:element></xsl:element><xsl:element name="td"><xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="result/Member/username"/></xsl:attribute><xsl:text>profile</xsl:text></xsl:element></xsl:element></xsl:element><xsl:text>
						</xsl:text></xsl:element><xsl:text>
						
					</xsl:text></xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>	
			</xsl:text></xsl:element><xsl:text>
		</xsl:text></xsl:element></xsl:when><xsl:otherwise><xsl:element name="div"><xsl:attribute name="id"><xsl:text>login</xsl:text></xsl:attribute><xsl:text>
			</xsl:text><xsl:element name="div"><xsl:element name="h2"><xsl:attribute name="class">title</xsl:attribute><xsl:text>Client Login</xsl:text></xsl:element></xsl:element><xsl:text>
			 </xsl:text><xsl:element name="div"><xsl:attribute name="class">entry leftmargin</xsl:attribute><xsl:text>
				</xsl:text><xsl:element name="form"><xsl:attribute name="action">login</xsl:attribute><xsl:attribute name="method">post</xsl:attribute><xsl:text>
					</xsl:text><xsl:element name="fieldset"><xsl:attribute name="class">leftmargin</xsl:attribute><xsl:text>
						</xsl:text><xsl:element name="input"><xsl:attribute name="name">action</xsl:attribute><xsl:attribute name="type">hidden</xsl:attribute><xsl:attribute name="value">login</xsl:attribute></xsl:element><xsl:text>
						</xsl:text><xsl:if test="*/fail"><xsl:element name="div"><xsl:attribute name="class">fail</xsl:attribute><xsl:text>Username / Password Incorrect</xsl:text></xsl:element></xsl:if><xsl:text>
						</xsl:text><xsl:element name="div"><xsl:text>username</xsl:text></xsl:element><xsl:text>
						</xsl:text><xsl:element name="div"><xsl:element name="input"><xsl:attribute name="class">input-text</xsl:attribute><xsl:attribute name="name">username</xsl:attribute><xsl:attribute name="type">text</xsl:attribute><xsl:attribute name="value"/></xsl:element></xsl:element><xsl:text>
						</xsl:text><xsl:element name="div"><xsl:text>password</xsl:text></xsl:element><xsl:text>
						</xsl:text><xsl:element name="div"><xsl:element name="input"><xsl:attribute name="class">input-text</xsl:attribute><xsl:attribute name="name">password</xsl:attribute><xsl:attribute name="type">password</xsl:attribute><xsl:attribute name="value"/></xsl:element></xsl:element><xsl:text>
						</xsl:text><xsl:element name="div"><xsl:text>
							</xsl:text><xsl:element name="div"><xsl:element name="input"><xsl:attribute name="class">input-submit</xsl:attribute><xsl:attribute name="name">submit</xsl:attribute><xsl:attribute name="type">submit</xsl:attribute><xsl:attribute name="value">Login</xsl:attribute></xsl:element></xsl:element><xsl:text>
							</xsl:text><xsl:element name="div"><xsl:text>
								</xsl:text><xsl:element name="div"><xsl:element name="a"><xsl:attribute name="href">#</xsl:attribute><xsl:text>Forgot your password?</xsl:text></xsl:element></xsl:element><xsl:text>
								</xsl:text><xsl:element name="div"><xsl:element name="a"><xsl:attribute name="href">register</xsl:attribute><xsl:text>Register a new Account?</xsl:text></xsl:element></xsl:element><xsl:text>
							</xsl:text></xsl:element><xsl:text>
						</xsl:text></xsl:element><xsl:text>
					</xsl:text></xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>	
			</xsl:text></xsl:element><xsl:text>
		</xsl:text></xsl:element></xsl:otherwise></xsl:choose><xsl:text>

		</xsl:text><!-- NOT loged in  --><xsl:text>
	</xsl:text></xsl:element><xsl:text>
	</xsl:text><xsl:element name="div"><xsl:attribute name="class">clearboth</xsl:attribute></xsl:element><xsl:text>
	</xsl:text><xsl:element name="div"><xsl:attribute name="id"><xsl:text>box3</xsl:text></xsl:attribute><xsl:text>
		</xsl:text><xsl:element name="div"><xsl:attribute name="id"><xsl:text>box4</xsl:text></xsl:attribute><xsl:text>
			</xsl:text><xsl:element name="ul"><xsl:text>
				</xsl:text><xsl:for-each select="*/siteVars/mainBoxLinks/*"><xsl:variable name="DexterDepthLevel1"><xsl:value-of select="position()"/></xsl:variable><xsl:element name="li"><xsl:attribute name="class">first</xsl:attribute><xsl:text>
					</xsl:text><xsl:element name="h2"><xsl:element name="span"><xsl:value-of select="MainHeading"/></xsl:element><xsl:value-of select="SubHeading"/></xsl:element><xsl:text>
					</xsl:text><xsl:element name="p"><xsl:value-of select="para"/></xsl:element><xsl:text>
				</xsl:text></xsl:element></xsl:for-each><xsl:text>
				</xsl:text><xsl:text>
				</xsl:text><xsl:text>
			</xsl:text></xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
		</xsl:text><xsl:element name="div"><xsl:attribute name="id"><xsl:text>box5</xsl:text></xsl:attribute><xsl:text>
			</xsl:text><xsl:element name="h2"><xsl:value-of select="*/siteVars/featureLink/MainHeading"/></xsl:element><xsl:text>
			</xsl:text><xsl:element name="img"><xsl:attribute name="src"><xsl:value-of select="*/siteVars/featureLink/image/src"/></xsl:attribute><xsl:attribute name="alt"><xsl:value-of select="*/siteVars/featureLink/image/alt"/></xsl:attribute><xsl:attribute name="class">alignleft border</xsl:attribute><xsl:attribute name="height">46</xsl:attribute><xsl:attribute name="width">46</xsl:attribute></xsl:element><xsl:text>
			</xsl:text><xsl:element name="h3"><xsl:value-of select="*/siteVars/featureLink/SubHeading"/></xsl:element><xsl:text>
			</xsl:text><xsl:element name="p"><xsl:value-of select="*/siteVars/featureLink/para"/></xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
	</xsl:text></xsl:element><xsl:text>
	</xsl:text><xsl:element name="div"><xsl:attribute name="id"><xsl:text>content</xsl:text></xsl:attribute><xsl:text>
		</xsl:text><!-- search --><xsl:text>
		</xsl:text><xsl:element name="div"><xsl:attribute name="class">box-style2</xsl:attribute><xsl:attribute name="id"><xsl:text>box6</xsl:text></xsl:attribute><xsl:text>
			</xsl:text><xsl:element name="div"><xsl:attribute name="class">entry</xsl:attribute><xsl:element name="h2"><xsl:text>I want to be a(n) </xsl:text><xsl:element name="input"><xsl:attribute name="class">input-text</xsl:attribute><xsl:attribute name="name">username</xsl:attribute><xsl:attribute name="type">text</xsl:attribute><xsl:attribute name="value"/></xsl:element><xsl:text> when I grow up.</xsl:text></xsl:element></xsl:element><xsl:text>
			</xsl:text><xsl:element name="div"><xsl:element name="p"><xsl:attribute name="class">more</xsl:attribute><xsl:element name="a"><xsl:attribute name="href">#</xsl:attribute><xsl:text>Search</xsl:text>&hellip;</xsl:element></xsl:element></xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
		</xsl:text><!-- search --><xsl:text>
		</xsl:text><!-- calendar --><xsl:text>
		</xsl:text><xsl:element name="div"><xsl:attribute name="class">box-style3</xsl:attribute><xsl:attribute name="id"><xsl:text>box7</xsl:text></xsl:attribute><xsl:text>
			</xsl:text><xsl:element name="div"><xsl:element name="h2"><xsl:attribute name="class">title</xsl:attribute><xsl:text>Upcoming Events</xsl:text></xsl:element></xsl:element><xsl:text>
			</xsl:text><xsl:element name="div"><xsl:attribute name="class">entry</xsl:attribute><xsl:text>
				</xsl:text><xsl:for-each select="*/events/*"><xsl:variable name="DexterDepthLevel1"><xsl:value-of select="position()"/></xsl:variable><xsl:element name="div"><xsl:text>
					</xsl:text><xsl:element name="p"><xsl:attribute name="class">date</xsl:attribute><xsl:element name="span"><xsl:attribute name="class">month</xsl:attribute><xsl:value-of select="month"/></xsl:element><xsl:text> </xsl:text><xsl:element name="span"><xsl:attribute name="class">day</xsl:attribute><xsl:value-of select="day"/></xsl:element></xsl:element><xsl:text>
					</xsl:text><xsl:element name="h3"><xsl:value-of select="title"/></xsl:element><xsl:text>
					</xsl:text><xsl:element name="p"><xsl:value-of select="desc"/></xsl:element><xsl:text>
					</xsl:text><xsl:element name="p"><xsl:attribute name="class">spacer</xsl:attribute>&nbsp;</xsl:element><xsl:text>
				</xsl:text></xsl:element></xsl:for-each><xsl:text>
				</xsl:text><xsl:text>
				</xsl:text><xsl:text>
			</xsl:text></xsl:element><xsl:text>
			</xsl:text><xsl:element name="div"><xsl:element name="p"><xsl:attribute name="class">more</xsl:attribute><xsl:element name="a"><xsl:attribute name="href">#</xsl:attribute><xsl:text>See more events:</xsl:text>&hellip;</xsl:element></xsl:element></xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
		</xsl:text><!-- calendar --><xsl:text>
		</xsl:text><!-- site Upgrades --><xsl:text>
		</xsl:text><xsl:element name="div"><xsl:attribute name="class">box-style4</xsl:attribute><xsl:attribute name="id"><xsl:text>box8</xsl:text></xsl:attribute><xsl:text>
			</xsl:text><xsl:element name="div"><xsl:element name="h2"><xsl:attribute name="class">title</xsl:attribute><xsl:text>Site Improvements</xsl:text></xsl:element></xsl:element><xsl:text>
			</xsl:text><xsl:element name="div"><xsl:attribute name="class">entry</xsl:attribute><xsl:text> 
				</xsl:text><xsl:for-each select="*/siteImprov/*"><xsl:variable name="DexterDepthLevel1"><xsl:value-of select="position()"/></xsl:variable><xsl:element name="div"><xsl:text>
					</xsl:text><xsl:element name="img"><xsl:attribute name="src"><xsl:value-of select="image/src"/></xsl:attribute><xsl:attribute name="alt"><xsl:value-of select="image/alt"/></xsl:attribute><xsl:attribute name="class">alignleft border</xsl:attribute><xsl:attribute name="height">82</xsl:attribute><xsl:attribute name="width">79</xsl:attribute></xsl:element><xsl:text>
					</xsl:text><xsl:element name="h3"><xsl:value-of select="MainHeading"/></xsl:element><xsl:text>
					</xsl:text><xsl:element name="p"><xsl:attribute name="vx:value">para</xsl:attribute><xsl:text>Read how our Gossimer platform supports mobile devices.</xsl:text></xsl:element><xsl:text>
					</xsl:text><xsl:element name="p"><xsl:element name="a"><xsl:attribute name="class">link1</xsl:attribute><xsl:attribute name="href">#</xsl:attribute><xsl:element name="span"><xsl:text>Details</xsl:text></xsl:element></xsl:element></xsl:element><xsl:text>
					</xsl:text><xsl:element name="p">&nbsp;</xsl:element><xsl:text>
				</xsl:text></xsl:element></xsl:for-each><xsl:text>
				</xsl:text><xsl:text>
			</xsl:text></xsl:element><xsl:text>
			</xsl:text><xsl:element name="div"><xsl:element name="p"><xsl:attribute name="class">more</xsl:attribute><xsl:element name="a"><xsl:attribute name="href">#</xsl:attribute><xsl:text>See more Upgrades:</xsl:text>&hellip;</xsl:element></xsl:element></xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
		</xsl:text><!-- site Upgrades --><xsl:text>
	</xsl:text></xsl:element><xsl:text>
	</xsl:text><xsl:element name="div"><xsl:attribute name="id"><xsl:text>sidebar</xsl:text></xsl:attribute><xsl:text>
		</xsl:text><xsl:element name="div"><xsl:attribute name="class">box-style3</xsl:attribute><xsl:attribute name="id"><xsl:text>box9</xsl:text></xsl:attribute><xsl:text>
			</xsl:text><xsl:element name="h2"><xsl:attribute name="class">title</xsl:attribute><xsl:text>Sponsored Links</xsl:text></xsl:element><xsl:text>
			</xsl:text><xsl:element name="div"><xsl:attribute name="class">entry</xsl:attribute><xsl:text>
				</xsl:text><xsl:element name="h3"><xsl:text>Donec ipsum non pulvin</xsl:text></xsl:element><xsl:text>
				</xsl:text><xsl:element name="p"><xsl:text>Cras vitae felis eget mi laoreet cursus. Nunc vehicula est ac sem. Sed mollis consequat massa ut sodales.</xsl:text></xsl:element><xsl:text>
				</xsl:text><xsl:element name="h3"><xsl:text>Vestibulum eget lacus vitae</xsl:text></xsl:element><xsl:text>
				</xsl:text><xsl:element name="p"><xsl:text>Etiam id turpis vel diam congue viverra. Cras vitae felis eget mi laoreet cursus. Nunc vehicula est ac sem.</xsl:text></xsl:element><xsl:text>
				</xsl:text><xsl:element name="h3"><xsl:text>Aenean sed ante commodo</xsl:text></xsl:element><xsl:text>
				</xsl:text><xsl:element name="p"><xsl:text>Morbi convallis tempus magna. Cras pretium. Ut eleifend dolor ac purus molestie consectetuer maecenas interdum.</xsl:text></xsl:element><xsl:text>
				</xsl:text><xsl:element name="h3"><xsl:text>Nunc vitae eros suscipit</xsl:text></xsl:element><xsl:text>
				</xsl:text><xsl:element name="p"><xsl:text>Integer auctor congue magna. Suspendisse enim tellus dictum non adipiscing eget placerat sit amet</xsl:text></xsl:element><xsl:text>
			</xsl:text></xsl:element><xsl:text>
		  </xsl:text><xsl:element name="div"><xsl:element name="p"><xsl:attribute name="class">more</xsl:attribute><xsl:element name="a"><xsl:attribute name="href">#</xsl:attribute><xsl:text>More links</xsl:text>&hellip;</xsl:element></xsl:element></xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
	</xsl:text></xsl:element><xsl:text>
</xsl:text></xsl:element><xsl:text>
</xsl:text><xsl:element name="div"><xsl:attribute name="class">clearboth</xsl:attribute><xsl:attribute name="id"><xsl:text>footer</xsl:text></xsl:attribute><xsl:text>
	</xsl:text><xsl:element name="p"><xsl:value-of select="result/siteVars/copyright"/></xsl:element><xsl:text>
</xsl:text></xsl:element><xsl:text>
</xsl:text></xsl:element><xsl:text>
</xsl:text></xsl:element><xsl:text>
</xsl:text></xsl:element><xsl:text>
</xsl:text></xsl:element></xsl:template></xsl:stylesheet>