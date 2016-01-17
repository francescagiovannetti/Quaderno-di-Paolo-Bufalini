<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:template match="/">
        <xsl:apply-templates select="//tei:body"/>
    </xsl:template>
    <!-- Named Templates -->
    <xsl:template name="prov">
        <xsl:text>      prov:wasAttributedTo </xsl:text>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:text>person/FG</xsl:text>
        <xsl:text><![CDATA[>]]> </xsl:text>
        <xsl:text> ;&#xa;</xsl:text>
        <xsl:text>      prov:hadPrimarySource </xsl:text>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:text>F22-notebook-expression</xsl:text>
        <xsl:text><![CDATA[>]]> </xsl:text>
    </xsl:template>
    <xsl:template name="uri_from_id">
        <xsl:variable name="myid" select="@xml:id"/>
        <xsl:variable name="myuri">
            <xsl:text>http://www.bufaliniquaderno.it/bufaliniquaderno.xml</xsl:text>
            <xsl:value-of select="$myid"/>
        </xsl:variable>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:value-of select="$myuri"/>
        <xsl:text><![CDATA[>]]> </xsl:text>
    </xsl:template>
    <xsl:template name="uri_from_id_hash">
        <xsl:variable name="myid" select="@xml:id"/>
        <xsl:variable name="myuri">
            <xsl:text>http://www.bufaliniquaderno.it/bufaliniquaderno.xml#</xsl:text>
            <xsl:value-of select="$myid"/>
        </xsl:variable>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:value-of select="$myuri"/>
        <xsl:text><![CDATA[>]]> </xsl:text>
    </xsl:template>
    <xsl:template name="uri_lang">
        <xsl:variable name="myid" select="@xml:lang"/>
        <xsl:variable name="myuri">
            <xsl:text>http://id.loc.gov/vocabulary/iso639-2/</xsl:text>
            <xsl:value-of select="$myid"/>
        </xsl:variable>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:value-of select="$myuri"/>
        <xsl:text><![CDATA[>]]> </xsl:text>
    </xsl:template>
    <xsl:template name="uri_from_corresp">
        <xsl:variable name="myid" select="@corresp"/>
        <xsl:variable name="myuri">
            <xsl:text>http://www.bufaliniquaderno.it/bufaliniquaderno.xml</xsl:text>
            <xsl:value-of select="$myid"/>
        </xsl:variable>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:value-of select="$myuri"/>
        <xsl:text><![CDATA[>]]> </xsl:text>
    </xsl:template>
    <xsl:template name="uri_from_n_to_n">
        <xsl:variable name="myrange" select="ancestor::tei:div[not(@type)]/child::tei:pb/@n"/>
        <xsl:variable name="myuri">
            <xsl:text>http://www.bufaliniquaderno.it/bufaliniquaderno.xml#</xsl:text>
            <xsl:value-of select="$myrange"/>
        </xsl:variable>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:value-of select="$myuri"/>
        <xsl:text><![CDATA[>]]> </xsl:text>
    </xsl:template>
    <xsl:template name="uri_from_opening_to_opening">
        <xsl:variable name="myopening">
            <xsl:choose>
                <xsl:when test="./preceding-sibling::tei:pb[@n = '1']">
                    <xsl:value-of
                        select="substring(./ancestor::tei:div[not(@type)][1]/parent::tei:body/preceding-sibling::tei:milestone[1][@unit = 'opening']/@facs, 3, string-length(./ancestor::tei:div[not(@type)][1]/parent::tei:body/preceding-sibling::tei:milestone[1][@unit = 'opening']/@facs) - 6)"
                    />
                </xsl:when>
                <xsl:when test="./parent::tei:div[@type]">
                    <xsl:value-of
                        select="substring(./parent::tei:div[@type]/ancestor::tei:div[not(@type)][1]/parent::tei:body/preceding-sibling::tei:milestone[1][@unit = 'opening']/@facs, 3, string-length(./ancestor::tei:div[not(@type)][1]/parent::tei:body/preceding-sibling::tei:milestone[1][@unit = 'opening']/@facs) - 6)"
                    />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of
                        select="substring(./ancestor::tei:div[not(@type)][1]/preceding-sibling::tei:milestone[1][@unit = 'opening']/@facs, 3, string-length(./parent::tei:div[not(@type)]/preceding-sibling::tei:milestone[1][@unit = 'opening']/@facs) - 6)"
                    />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="myuri">
            <xsl:text>http://www.bufaliniquaderno.it/bufaliniquaderno.xml#opening-</xsl:text>
            <xsl:value-of select="$myopening"/>
        </xsl:variable>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:value-of select="$myuri"/>
        <xsl:text><![CDATA[>]]> </xsl:text>
    </xsl:template>
    <xsl:template name="fragment_refers_to_person">
        <xsl:if test="descendant::tei:persName">
            <xsl:for-each select="descendant::tei:persName[not(parent::tei:bibl) and not(@role)]">
                <xsl:text>;&#xa;</xsl:text>
                <xsl:text>      ecrm:P67_refers_to </xsl:text>
                <xsl:text><![CDATA[<]]></xsl:text>
                <xsl:text>person/</xsl:text>
                <xsl:value-of select="@key"/>
                <xsl:text><![CDATA[>]]> </xsl:text>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    <xsl:template name="fragment_has_physical_representation">
        <xsl:text>;&#xa;</xsl:text>
        <xsl:text>      ecrm:P128i_carried_by </xsl:text>
        <xsl:variable name="fragment_carrier">
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:value-of select="@xml:id"/>
            <xsl:text>/carrier</xsl:text>
            <xsl:text><![CDATA[>]]></xsl:text>
        </xsl:variable>
        <xsl:value-of select="$fragment_carrier"/>
        <xsl:text>.&#xa;&#xa;</xsl:text>
        <xsl:value-of select="$fragment_carrier"/>
        <xsl:text> a ecrm:E84_Information_Carrier </xsl:text>
        <xsl:text>;&#xa;</xsl:text>
        <xsl:text>      ecrm:P46i_forms_part_of </xsl:text>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:text>F4-notebook-manifestation</xsl:text>
        <xsl:text><![CDATA[>]]> </xsl:text>
        <xsl:text>;&#xa;</xsl:text>
        <xsl:text>      saws:physicallyLocatedAt </xsl:text>
        <xsl:variable name="fragment_locus">
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:value-of select="@xml:id"/>
            <xsl:text>/locus</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
        </xsl:variable>
        <xsl:value-of select="$fragment_locus"/>
        <xsl:text>.&#xa;&#xa;</xsl:text>
        <xsl:value-of select="$fragment_locus"/>
        <xsl:text>a saws:Locus</xsl:text>
        <xsl:text>;&#xa;</xsl:text>
        <xsl:text>      ecrm:P59i_is_located_on_or_within </xsl:text>
        <xsl:variable name="pb">
            <xsl:call-template name="uri_from_n_to_n"/>
        </xsl:variable>
        <xsl:value-of select="$pb"/>
        <xsl:text>.&#xa;&#xa;</xsl:text>
        <xsl:value-of select="$pb"/>
        <xsl:text>a noto:NotebookPage </xsl:text>
        <xsl:text>;&#xa;</xsl:text>
        <xsl:text>      ecrm:P46i_forms_part_of </xsl:text>
        <xsl:variable name="opening">
            <xsl:call-template name="uri_from_opening_to_opening"/>
        </xsl:variable>
        <xsl:value-of select="$opening"/>
        <xsl:text>.&#xa;&#xa;</xsl:text>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:text>image/</xsl:text>
        <xsl:choose>
            <xsl:when test="./preceding-sibling::tei:pb[@n = '1']">
                <xsl:value-of
                    select="./ancestor::tei:div[not(@type)][1]/parent::tei:body/preceding-sibling::tei:milestone[1][@unit = 'opening']/@facs"
                />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of
                    select="./ancestor::tei:div[not(@type)][1]/preceding-sibling::tei:milestone[1][@unit = 'opening']/@facs"
                />
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text><![CDATA[>]]> </xsl:text>
        <xsl:text>a ecrm:E38_Image </xsl:text>
        <xsl:text>;&#xa;</xsl:text>
        <xsl:text>      ecrm:P138_represents </xsl:text>
        <xsl:value-of select="$opening"/>
    </xsl:template>
    <xsl:template name="fragment_is_fragment_of_notebook">
        <xsl:text>      efrbroo:R15i_is_fragment_of </xsl:text>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:text>F22-notebook-expression</xsl:text>
        <xsl:text><![CDATA[>]]> </xsl:text>
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
        <!-- Statements about textual fragments (quotations, translations, comments) -->
        <!-- Quotation -->
        <xsl:for-each select="descendant::tei:div[@type = 'quotation']">
            <!-- Description of citation act (relationship between citing fragment and cited entity) -->
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>citation-act-</xsl:text>
            <xsl:number value="position()" format="001"/>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>a </xsl:text>
            <xsl:text>cito:CitationAct </xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:text>      cito:hasCitingEntity </xsl:text>
            <xsl:call-template name="uri_from_id_hash"/>
            <xsl:text> ;&#xa;</xsl:text>
            <xsl:text>      cito:hasCitedEntity </xsl:text>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>cited-entity-</xsl:text>
            <xsl:number value="position()" format="001"/>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:text>      cito:hasCitationCharacterization </xsl:text>
            <xsl:text>noto:quotes </xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <!-- Date when the quotation was jotted down -->
            <xsl:if test="child::tei:dateline/tei:date[@when]">
                <xsl:text>      dcterms:date </xsl:text>
                <xsl:text>"</xsl:text>
                <xsl:value-of select="child::tei:dateline/tei:date/@when"/>
                <xsl:text>"</xsl:text>
                <xsl:text>^^xsd:date</xsl:text>
                <xsl:text> ;&#xa;</xsl:text>
            </xsl:if>
            <xsl:call-template name="prov"/>
            <xsl:text>.&#xa;&#xa;</xsl:text>
            <!-- Description of citing fragment -->
            <xsl:call-template name="uri_from_id_hash"/>
            <xsl:text>a </xsl:text>
            <xsl:text>noto:Quotation </xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <!-- Lanugage of quotation ('ita' when not specified) -->
            <xsl:text>      ecrm:P72_has_language </xsl:text>
            <xsl:choose>
                <xsl:when test="@xml:lang">
                    <xsl:call-template name="uri_lang"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text><![CDATA[<]]></xsl:text>
                    <xsl:text>http://id.loc.gov/vocabulary/iso639-2/ita</xsl:text>
                    <xsl:text><![CDATA[>]]> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <!-- Author attributed to citing entity by Paolo Bufalini -->
            <xsl:if test="tei:head//tei:persName[@role = 'author']">
                <xsl:text>;&#xa;</xsl:text>
                <xsl:text>      saws:AttributedAuthor </xsl:text>
                <xsl:text><![CDATA[<]]></xsl:text>
                <xsl:text>person/</xsl:text>
                <xsl:value-of select="tei:head//tei:persName[@role = 'author']/@key"/>
                <xsl:text><![CDATA[>]]> </xsl:text>
            </xsl:if>
            <xsl:if test="tei:trailer//tei:persName[@role = 'author']">
                <xsl:text>;&#xa;</xsl:text>
                <xsl:text>      saws:AttributedAuthor </xsl:text>
                <xsl:text><![CDATA[<]]></xsl:text>
                <xsl:text>person/</xsl:text>
                <xsl:value-of select="tei:head//tei:persName[@role = 'author']/@key"/>
                <xsl:text><![CDATA[>]]> </xsl:text>
            </xsl:if>
            <!-- Reference(s) to person(s) in fragment (authors are excluded) -->
            <xsl:call-template name="fragment_refers_to_person"/>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:call-template name="fragment_is_fragment_of_notebook"/>
            <!-- Physical representation of fragment (relationship between fragment and physical page of ms ) -->
            <xsl:call-template name="fragment_has_physical_representation"/>
            <xsl:text>.&#xa;&#xa;</xsl:text>
            <!-- Description of cited fragment: the statements are extracted manually  -->
        </xsl:for-each>
        <!-- Description of translation -->
        <xsl:for-each select="descendant::tei:div[@type = 'translation']">
            <xsl:call-template name="uri_from_id_hash"/>
            <xsl:text>a </xsl:text>
            <xsl:text>noto:Translation </xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <!-- Relationship between translation and translated citation -->
            <xsl:if test="@corresp">
                <xsl:text>      ecrm:P73i_is_translation_of </xsl:text>
                <xsl:call-template name="uri_from_corresp"/>
                <xsl:text>;&#xa;</xsl:text>
            </xsl:if>
            <!-- Language of translation ('ita' when not specified) -->
            <xsl:text>      ecrm:P72_has_language </xsl:text>
            <xsl:choose>
                <xsl:when test="@xml:lang">
                    <xsl:call-template name="uri_lang"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text><![CDATA[<]]></xsl:text>
                    <xsl:text>http://id.loc.gov/vocabulary/iso639-2/ita</xsl:text>
                    <xsl:text><![CDATA[>]]> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <!-- Author of translation ('Paolo Bufalini' when not specified)-->
            <xsl:text>;&#xa;</xsl:text>
            <xsl:text>      dc:creator </xsl:text>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:choose>
                <xsl:when test="descendant::tei:persName[@role = 'translator']">
                    <xsl:variable name="myid" select="descendant::tei:persName[@role = 'translator']/@key"/>
                    <xsl:variable name="myuri">
                        <xsl:text>person/</xsl:text>
                        <xsl:value-of select="$myid"/>
                    </xsl:variable>
                    <xsl:value-of select="$myuri"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>person/PB</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <!-- Reference(s) to person(s) in fragment (authors are excluded) -->
            <xsl:call-template name="fragment_refers_to_person"/>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:call-template name="fragment_is_fragment_of_notebook"/>
            <!-- Physical representation of fragment (relationship between fragment and physical page of ms ) -->
            <xsl:call-template name="fragment_has_physical_representation"/>
            <xsl:text>.&#xa;&#xa;</xsl:text>
        </xsl:for-each>
        <!-- Description of comment -->
        <xsl:for-each select="//tei:div[@type = 'comment']">
            <xsl:call-template name="uri_from_id_hash"/>
            <xsl:text>a </xsl:text>
            <xsl:text>noto:Comment </xsl:text>
            <xsl:text>;&#xa;</xsl:text>
            <!-- Language of comment ('ita' when not specified) -->
            <xsl:text>      ecrm:P72_has_language </xsl:text>
            <xsl:choose>
                <xsl:when test="@xml:lang">
                    <xsl:call-template name="uri_lang"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text><![CDATA[<]]></xsl:text>
                    <xsl:text>http://id.loc.gov/vocabulary/iso639-2/ita</xsl:text>
                    <xsl:text><![CDATA[>]]> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>;&#xa;</xsl:text>
            <!-- Relationship between comment and commented citation -->
            <xsl:if test="starts-with(@corresp, '#cit')">
                <xsl:text>      noto:isCommentOf </xsl:text>
                <xsl:call-template name="uri_from_corresp"/>
                <xsl:text>;&#xa;</xsl:text>
            </xsl:if>
            <!-- Creator of comment -->
            <xsl:text>      dc:creator </xsl:text>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>PB</xsl:text>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <!-- Reference(s) to person(s) in fragment (authors are excluded) -->
            <xsl:call-template name="fragment_refers_to_person"/>
            <xsl:text>;&#xa;</xsl:text>
            <xsl:call-template name="fragment_is_fragment_of_notebook"/>
            <!-- Physical representation of fragment (relationship between fragment and physical page of ms ) -->
            <xsl:call-template name="fragment_has_physical_representation"/>
            <xsl:text>.&#xa;&#xa;</xsl:text>
        </xsl:for-each>
        <!-- Description of person -->
        <xsl:for-each select="//tei:persName/@key[not(. = preceding::*/@key)]">
            <xsl:variable name="name">
                <xsl:value-of select="."/>
            </xsl:variable>
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:text>person/</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text><![CDATA[>]]> </xsl:text>
            <xsl:text>a ecrm:E21_Person </xsl:text>
            <xsl:for-each
                select="//tei:persName[not(parent::tei:bibl)][not(. = preceding::tei:persName[not(parent::tei:bibl)])][@key = $name]">
                <xsl:text>;&#xa;</xsl:text>
                <xsl:text>      ecrm:P131_is_identified_by </xsl:text>
                <xsl:text>"</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>" </xsl:text>
            </xsl:for-each>
            <xsl:text>.&#xa;&#xa;</xsl:text>
        </xsl:for-each>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:text>F4-notebook-manifestation</xsl:text>
        <xsl:text><![CDATA[>]]> </xsl:text>
        <xsl:text>a </xsl:text>
        <xsl:text>efrbroo:F4_Manifestation_Singleton </xsl:text>
        <xsl:text>.&#xa;&#xa;</xsl:text>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:text>F22-notebook-expression</xsl:text>
        <xsl:text><![CDATA[>]]> </xsl:text>
        <xsl:text>a </xsl:text>
        <xsl:text>efrbroo:F22_Self-Contained_Expression </xsl:text>
        <xsl:text>.&#xa;&#xa;</xsl:text>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:text>person/FG</xsl:text>
        <xsl:text><![CDATA[>]]> </xsl:text>
        <xsl:text>a </xsl:text>
        <xsl:text>ecrm:E21_Person </xsl:text>
        <xsl:text>;&#xa;</xsl:text>
        <xsl:text>      ecrm:P84_has_preferred_identifier </xsl:text>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:text>persname/giovannetti-francesca-1991-</xsl:text>
        <xsl:text><![CDATA[>]]> </xsl:text>
        <xsl:text>.&#xa;&#xa;</xsl:text>
        <xsl:text><![CDATA[<]]></xsl:text>
        <xsl:text>persname/giovannetti-francesca-1991-</xsl:text>
        <xsl:text><![CDATA[>]]> </xsl:text>
        <xsl:text>rdfs:label </xsl:text>
        <xsl:text>"Giovannetti, Francesca (1991-)" </xsl:text>
        <xsl:text>.&#xa;&#xa;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
