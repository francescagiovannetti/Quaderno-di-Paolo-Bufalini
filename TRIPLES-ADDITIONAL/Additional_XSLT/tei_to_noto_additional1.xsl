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
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix noto: <http://purl.org/net/noto/> .
@base <http://www.bufaliniquaderno.it/resource/> . 
]]></xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="//tei:persName/@key[not(. = preceding::*/@key)]">
            <xsl:variable name="name">
                <xsl:value-of select="."/>
            </xsl:variable>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>person/</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>ecrm:P84_has_preferred_identifier </xsl:text>
            <xsl:text>"</xsl:text>
            <xsl:text>Name (Dates)</xsl:text>
            <xsl:text>" </xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:text>      owl:sameAs </xsl:text>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>VIAF</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>.&#xa;&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
