<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output mepod="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/ies">
        <html>
            <h1><xsl:value-of select="nombre"/></h1>
                <xsl:apply-templates select="ciclos/ciclo"/>    
                    
               

           
        </html>
    </xsl:template>


    <xsl:template match="ciclo">
       
        <p><xsl:value-of select="nombre"/></p>        
        
   
    </xsl:template>

</xsl:stylesheet>
