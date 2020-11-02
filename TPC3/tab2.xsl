<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Tabela Periodica dos Elementos</title>
            </head>
            <body>
                <table width="100%">
                    <tr>
                        <td width="30%">
                            <a name="indice"/>
                            <h3>Índice</h3>
                            <ul>
                                <xsl:apply-templates mode="indice" select="//ATOM">
                                    <xsl:sort select="SYMBOL"/>
                                </xsl:apply-templates> 
                            </ul>
                            
                        </td>
                        <td>
                            <xsl:apply-templates select="ATOM">
                                <xsl:sort data-type="number" select="ATOMIC_NUMBER"/>
                            </xsl:apply-templates>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <!-- Templates para o índice -->
    <xsl:template match="ATOM">
        <li>
            <a name="i{generate-id()}"/>
            <a href="#{generate-id()}"/>
            <xsl:value-of select="SYMBOL"/>
            -
            <xsl:value-of select="NAME"/>
        </li>
    </xsl:template>
    
    <!-- Templates para o conteúdo -->
    
    <xsl:template match="ATOM">
        <a name="{generate-id()}"/>
        <p><b>Nome</b>: <xsl:value-of select="NAME"/></p> 
        <p><b>Peso atómico</b>: <xsl:value-of select="ATOMIC_WEIGHT"/></p>
        <p><b>Número atómico</b>: <xsl:value-of select="ATOMIC_NUMBER"/></p>
        <xsl:if test="HEAT_OF_FUSION">
            <p><b>Ponto de fusão</b>
                <xsl:value-of select="HEAT_OF_FUSION"/>
                <xsl:value-of select="HEAT_OF_FUSION/@UNITS"/>
            </p>
        </xsl:if>
        <address>[<a href="i{generate-id()}">Voltar ao indice]</a></address>
        <center>
            <hr width="80%"/>
        </center>
        
    </xsl:template>
    
</xsl:stylesheet>