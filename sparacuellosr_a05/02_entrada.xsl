<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="museos">
        <museos>
            <xsl:apply-templates select ="museo"/> 
        </museos>

    </xsl:template>

    <xsl:template match="museo">
        <museo ubicacion="{concat(@ciudad, ' (', @pais, ')')}">
            <xsl:value-of select="@nombre"/>
           
        </museo>
        
    </xsl:template >
</xsl:stylesheet>
