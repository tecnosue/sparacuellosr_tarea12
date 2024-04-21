<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="museos">
        <paises>
            <xsl:apply-templates select ="museo"/> 
        </paises>

    </xsl:template>

    <xsl:template match="museo">
        <pais nombre="{@pais}">
            <ciudad nombre="{@ciudad}">
                <museo nombre="{@nombre}"/>

            </ciudad>
            
        </pais>
        
        
    </xsl:template >
</xsl:stylesheet>
