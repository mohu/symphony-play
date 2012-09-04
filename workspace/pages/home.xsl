<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<h1><xsl:value-of select="$page-title"/></h1>

        <xsl:for-each select="/data/philosophers/entry">
            <div>
                <h1>
                    <strong>
                        <xsl:value-of select="name" />
                    </strong>
                </h1>
                <xsl:value-of select="basic-philosophy" />
                <div>
                    <xsl:if test="count(related-a/item) > 0">
                        <h4>Related</h4>
                        <ul>
                            <xsl:for-each select="related-a/item">
                            <li>
                                <xsl:value-of select="text()" />
                            </li>
                            </xsl:for-each>
                            <xsl:for-each select="related-philosophies/item">
                                <li>
                                    <xsl:value-of select="text()" />
                                </li>
                            </xsl:for-each>
                        </ul>
                    </xsl:if>
                </div>
            </div>
        </xsl:for-each>
</xsl:template>

</xsl:stylesheet>