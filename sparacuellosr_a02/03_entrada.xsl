<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/ies">
        <html>
            <h1>
                <xsl:value-of select="@nombre"/>  
            </h1>
            <p>Página web: <a href="{@web}">
                <xsl:value-of select="@web"/>
            </a></p>
            <table border="1">
                <tr>
                    <th><xsl:text>Nombre del ciclo</xsl:text></th>
                    <th><xsl:text>Grado</xsl:text></th>
                    <th><xsl:text>Año del título</xsl:text></th>
                    
                </tr>
                <xsl:apply-templates select="ciclos/ciclo"/>
            </table>
        </html>
    </xsl:template>


    <xsl:template match="ciclo">
       
     <tr>
        <td><xsl:value-of select="nombre"/></td>        
        <td><xsl:value-of select="grado"/></td>
        <td><xsl:value-of select="decretoTitulo/@año"/></td>

     </tr>
        

   
           
    </xsl:template>

</xsl:stylesheet>
