<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
    <!-- Definir la salida como HTML -->
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" encoding="UTF-8" indent="yes"/>
  
    <!-- Plantilla para el documento entero -->
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Tabla de artistas</title>
            </head>
            <body>
                <table>
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Año de nacimiento</th>
                        <th>Año de fallecimiento</th>
                        <th>País</th>
                        <th>Página web</th>
                    </tr>
                    <!-- Aplicar plantillas para artistas ordenados por nacimiento, excluyendo los nacidos antes de 1500 -->
                    <xsl:apply-templates select="artistas/artista[nacimiento > 1500]">
                        <xsl:sort select="nacimiento" data-type="number" order="ascending"/>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <!-- Plantilla para cada artista -->
    <xsl:template match="artista">
        <tr>
            <td><xsl:value-of select="@cod"/></td>
            <td><xsl:value-of select="nombreCompleto"/></td>
            <td><xsl:value-of select="nacimiento"/></td>
            <td>
                <xsl:choose>
                    <!-- Si fallecimiento no existe, mostrar 'Desconocido' -->
                    <xsl:when test="not(fallecimiento)">
                        Desconocido
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="fallecimiento"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td><xsl:value-of select="pais"/></td>
            <td>
                <a target="_blank" href="{fichaCompleta}">Saber más</a>
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>
