<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:template match="/html/body">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simple" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
          <fo:region-body margin-top="3cm" />
          <fo:region-before extent="3cm" />
          <fo:region-after extent="1.5cm" />
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="simple">
        <fo:flow flow-name="xsl-region-body">
          <!-- Procesar todos los elementos en su orden de aparición -->
          <xsl:apply-templates select="*"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

  <!-- Plantillas para manejar cada tipo de elemento específicamente -->
  <xsl:template match="h1">
    <fo:block overflow="scroll" font-size="22pt" font-family="sans-serif" line-height="24pt" space-after.optimum="15pt" text-align="center" padding-top="3pt">
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>

  <xsl:template match="h2">
    <fo:block overflow="scroll" font-size="16pt" font-family="sans-serif" line-height="24pt" space-after.optimum="15pt" text-align="left" padding-top="3pt">
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>

  <xsl:template match="h3">
    <fo:block font-size="14pt" font-weight="bold" space-after.optimum="12pt" 
            text-align="left" padding-top="6pt">
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>


  <xsl:template match="p">
    <fo:block overflow="scroll" font-size="10pt" font-family="sans-serif" line-height="18pt" space-after.optimum="15pt" text-align="left" padding-top="3pt">
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>
   <!-- estilos para los xml-->
    <xsl:template match="pre[@class='sourceCode xml']">
      <fo:block font-family="'Courier New', monospace" font-size="10pt" 
      color="#000000" background-color="#f0f0f0" line-height="14pt" 
      space-after="10pt" space-before="10pt" text-align="left" 
      padding="4pt" border="solid 1px #888888" wrap-option="wrap"
      white-space-collapse="false" white-space-treatment="preserve" 
      linefeed-treatment="preserve">
      <xsl:for-each select="node()">
        <xsl:choose>
          <!-- estilos a los elementos span con la clase 'kw' para las etiquetas XML -->
          <xsl:when test="self::span[@class='kw']">
            <fo:inline color="blue">
              <xsl:value-of select="."/>
            </fo:inline>
          </xsl:when>
          <!-- estilos a los elementos span con la clase 'st' para los valores de atributo -->
          <xsl:when test="self::span[@class='st']">
            <fo:inline color="green">
              <xsl:value-of select="."/>
            </fo:inline>
          </xsl:when>
          <!-- El contenido predeterminado simplemente se muestra sin cambios -->
          <xsl:otherwise>
            <xsl:value-of select="."/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </fo:block>
  </xsl:template>

  <xsl:template match="pre[@class='xpath']">
  <fo:block overflow="scroll" font-family="monospace" white-space-collapse="false" wrap-option="wrap"
            border="solid 0.5px black" padding="2mm" background-color="#f0f0f0"
            linefeed-treatment="preserve" white-space-treatment="preserve">
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="code[@class='xpath']">
  <fo:inline font-family="monospace">
    <xsl:apply-templates/>
  </fo:inline>
</xsl:template>


<xsl:template match="ul">
    <fo:list-block provisional-distance-between-starts="1cm" start-indent="0cm" 
                   space-before="6pt" space-after="6pt">
      <xsl:apply-templates select="li"/>
    </fo:list-block>
  </xsl:template>

<xsl:template match="li">
  <fo:list-item>
    <fo:list-item-label end-indent="label-end()">
      <fo:block text-align="left">• </fo:block> 
    </fo:list-item-label>
    <fo:list-item-body start-indent="body-start()">
      <fo:block text-align="left">
        <xsl:apply-templates/>
      </fo:block>
    </fo:list-item-body>
  </fo:list-item>
</xsl:template>




</xsl:stylesheet>
