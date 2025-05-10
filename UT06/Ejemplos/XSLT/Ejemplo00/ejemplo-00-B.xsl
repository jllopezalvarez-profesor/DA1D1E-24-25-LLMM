<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"            version="1.0">
    <xsl:output method="html" indent="yes" media-type="text/html"/>
    <!-- <xsl:mode on-no-match="shallow-copy"/> -->
    
    <xsl:template match="/facturacion/tickets">
        <html lang="en">
            
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Document</title>
            </head>
            
            <body>
                <h1>Listado de códigos de tickets</h1>
                <p>Iterando los tickets y accediendo al atributo:</p>
                <ul>
                    <xsl:for-each select="/facturacion/tickets/ticket">
                        <li><xsl:value-of select="@codigo"/> - <xsl:value-of select="importe-iva-incluido"/></li>
                    </xsl:for-each>
                </ul>
                <p>Iterando los directamente los atributos:</p>
                <ul>
                    <xsl:for-each select="/facturacion/tickets/ticket/@codigo">
                        <li><xsl:value-of select="."/> - <xsl:value-of select="../importe-iva-incluido"/></li>
                    </xsl:for-each>
                </ul>
            </body>
            
        </html>
        
    </xsl:template>
    
    <xsl:template match="/facturacion/comercio | /facturacion/periodo">
        
    </xsl:template>
    
    
    
</xsl:stylesheet>