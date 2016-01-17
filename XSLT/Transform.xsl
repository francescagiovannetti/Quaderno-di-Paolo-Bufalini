<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"  xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- delete divs delimiting pages -->
    <xsl:template match="//tei:body/tei:div">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- add an attribute verso in all pb -->
    <xsl:template match="//tei:pb">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="type">
                <xsl:value-of select="./preceding-sibling::tei:milestone/@unit"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- delete the milestone -->
    <xsl:template match="//tei:milestone[@unit = 'recto']"/>
    <xsl:template match="//tei:milestone[@unit = 'verso']"/>
    <xsl:template match="//tei:milestone[@unit = 'opening']"/>
 <!--     <xsl:template match="//tei:dateline">
        <xsl:element name="div">
            <xsl:copy>
                <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
        </xsl:element>
    </xsl:template>-->
    <xsl:template match="@org"/>
    <xsl:template match="@part"/>
    <xsl:template match="@sample"/>
    <xsl:template match="@full"/>
    <xsl:template match="@instant"/>
    <xsl:template match="@default"/>
    <xsl:template match="@status"/>
</xsl:stylesheet>
