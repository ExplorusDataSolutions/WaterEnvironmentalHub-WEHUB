<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	xmlns:geonet="http://www.fao.org/geonetwork"
	xmlns:media="http://search.yahoo.com/mrss/"
	xmlns:georss="http://www.georss.org/georss"
	xmlns:gml="http://www.opengis.net/gml"
	exclude-result-prefixes="geonet">

	<xsl:output method="xml" media-type="application/rss+xml"/>

	<xsl:strip-space elements="*"/>

	<xsl:include href="rss-utils.xsl"/>

	<xsl:variable name="siteURL" select="/root/gui/siteURL"/>
	<xsl:variable name="baseURL" select="substring-before($siteURL,'/srv/')" />
	
	<xsl:template match="/root">
		
		<rss version="2.0" xmlns:media="http://search.yahoo.com/mrss/" xmlns:georss="http://www.georss.org/georss" xmlns:gml="http://www.opengis.net/gml">
			<channel>
				<xsl:apply-templates mode="item" select="//rssItems/*">
					<xsl:with-param name="siteURL" select="$siteURL" />
				</xsl:apply-templates>
			</channel>
		</rss>
	</xsl:template>
	
</xsl:stylesheet>

