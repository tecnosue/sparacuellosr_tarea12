<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="museos">
        <ciudades>
            <xsl:apply-templates select ="museo"/> 
        </ciudades>

    </xsl:template>

    <xsl:template match="museo">
        <ciudad nombre="{ciudad}" pais="{pais}">

            <museo>
                <xsl:value-of select="nombre"/>
            </museo>

        </ciudad>
        
    </xsl:template >
</xsl:stylesheet>
