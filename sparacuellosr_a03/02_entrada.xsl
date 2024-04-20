<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output metod="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/ies">
        <html>
            <h1><xsl:value-of select="nombre"/></h1>
            <ul>
                <xsl:apply-templates select="ciclos/ciclo"/>

            </ul> 
           
        </html>
    </xsl:template>


    <xsl:template match="ciclo">
       
        <li><xsl:value-of select="@id"/><br/>
            <xsl:value-of select="nombre"/>
            <xsl:text>, Ciclo Formativo de Grado </xsl:text>
            <xsl:value-of select="grado"/><xsl:text> creado en </xsl:text>
            <xsl:value-of select="decretoTitulo/@año"/>
        </li>        
        
   
    </xsl:template>

</xsl:stylesheet>
