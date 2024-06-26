<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/ies">
        <html>
           
            <table border="1">
                <xsl:apply-templates select="ciclos/ciclo"/>
            </table>
           
        </html>
    </xsl:template>

    <xsl:template match="ciclo">
        <tr>
            <td>
                <xsl:value-of select="nombre"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
