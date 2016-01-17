<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:template match="/">
        <xsl:apply-templates select="//tei:body"/>
    </xsl:template>
    <xsl:template match="tei:body">
        <xsl:text><![CDATA[@prefix cito: <http://purl.org/spar/cito/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix efrbroo: <http://erlangen-crm.org/efrbroo/> .
@prefix prov: <http://www.w3.org/ns/prov#> .
@prefix ecrm: <http://erlangen-crm.org/current/> .
@prefix dc: <http://purl.org/dc/elements/1.1/> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix saws: <http://purl.org/saws/ontology/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix noto: <http://purl.org/net/noto/> .
@prefix frbr: <http://purl.org/vocab/frbr/core#> .
@base <http://www.bufaliniquaderno.it/resource/> . 
]]></xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="descendant::tei:div[@type ='quotation']">
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>cited-entity-</xsl:text>
            <xsl:number value="position()" format="001"/>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>a </xsl:text>
            <xsl:text>efrbroo:F23_Expression_Fragment</xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:text>      owl:sameAs </xsl:text>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>new fragment URI</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:text>      rdfs:seeAlso </xsl:text>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>URI-Online Ed fragm</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:text>      efrbroo:R15i_is_fragment_of </xsl:text>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>URI-Self-Cont</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:text>      dcterms:title </xsl:text>
            <!-- Extraction of the title and author of the cited fragment as identified by scholars (if the information is not in the TEI encoding, the empty entities are filled manually) -->
            <xsl:choose>
                <xsl:when test="tei:bibl/tei:title">
                    <xsl:text>"</xsl:text>
                    <xsl:value-of select="tei:bibl/tei:title/text()"/>
                    <xsl:text>"</xsl:text>
                </xsl:when>
                <xsl:otherwise> "?" </xsl:otherwise>
            </xsl:choose>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:text>      dc:creator </xsl:text>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>person/</xsl:text>
            <xsl:choose>
                <xsl:when test="tei:bibl/tei:persName[@role = 'author']">
                    <xsl:value-of select="tei:bibl/tei:persName[@role = 'author']/@key"/>
                </xsl:when>
                <xsl:otherwise>?</xsl:otherwise>
            </xsl:choose>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>.&#xa;&#xa;</xsl:text>
            
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>URI-Self-Cont</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>efrbroo:R3i_realises </xsl:text>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>URI-Work ediz buf</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>.&#xa;&#xa;</xsl:text>
            
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>URI-Work ediz buf</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>a </xsl:text>
            <xsl:text>efrbroo:F1_Work</xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:text>      frbr:relatedEndeavour </xsl:text>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>URI-Work ediz dig</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>.&#xa;&#xa;</xsl:text>
            
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>URI-Online Ed fragm</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>a </xsl:text>
            <xsl:text>efrbroo:F23_Expression_Fragment</xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:text>      efrbroo:R15i_is_fragment_of </xsl:text>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>URI-Self-Cont Ed Online</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:text>      efrbroo:R3_is_realised_in </xsl:text>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>URI-Work ediz dig</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>.&#xa;&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
