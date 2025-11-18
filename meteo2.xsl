<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  version="2.0">
    
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
            <line x1="100" y1="100" x2="100" y2="600" stroke="black" stroke-width="2"></line>
            <line x1="100" y1="600" x2="1000" y2="600" stroke="black" stroke-width="2"></line>
            <xsl:for-each select="meteo/mesure[@date='2025-10-10']/ville">
                <xsl:variable name="posX" select="position()*120"/>
                <xsl:variable name="temp" select="@temperature*10"/>
                <text stroke="blue" x="{$posX}" y="620">
                    <xsl:value-of select="@nom"/>
                </text>
                <rect width="20" height="{$temp}" x="{$posX}" y="{600 - $temp}" stroke="black" fill="orange">
                    <animate attributeName="height" values="0;{$temp};0" repeatCount="indefinite" dur="3s" from="0" ></animate>
                    <animate attributeName="y"  values="600;{600 - $temp};600" repeatCount="indefinite" dur="3s" from="600"></animate>
                </rect>
                <text x="{$posX}" y="{600 - $temp - 10}">
                    <xsl:value-of select="@temperature"/>
                </text>
            </xsl:for-each>
        </svg>

    </xsl:template>
    
</xsl:stylesheet>