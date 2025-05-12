<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" omit-xml-declaration="yes" media-type="text/html" />
    
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <link rel="stylesheet" href="Ejercicio02.css" type="text/css" />
                <title>Extensión de barrios de casco urbano</title>
            </head>
            <body>
                
                
                <h1>Extensión de barrios de casco urbano</h1>
                
                <h2>Ordenado por barrio</h2>
                <ul>
                    <xsl:for-each select="/barrios-extension/barrio">
                        <xsl:sort select="nombre_barrio" />
                        <li>
                            <xsl:value-of select="nombre_barrio" />
                            -
                            <xsl:value-of select="km2" />
                        </li>
                    </xsl:for-each>
                </ul>
                
                
                <h2>Ordenado por barrio (descendente)</h2>
                <ul>
                    <xsl:for-each select="/barrios-extension/barrio">
                        <xsl:sort select="nombre_barrio" order="descending" />
                        <li>
                            <xsl:value-of select="nombre_barrio" />
                            -
                            <xsl:value-of select="km2" />
                        </li>
                    </xsl:for-each>
                </ul>
                
                <h2>Ordenado por superficie</h2>
                <ul>
                    <xsl:for-each select="/barrios-extension/barrio">
                        <xsl:sort select="km2" data-type="number" />
                        <li>
                            <xsl:value-of select="nombre_barrio" />
                            -
                            <xsl:value-of select="km2" />
                        </li>
                    </xsl:for-each>
                </ul>
                <h2>Ordenado por superficie (descendente)</h2>
                <ul>
                    <xsl:for-each select="/barrios-extension/barrio">
                        <xsl:sort select="km2" order="descending" data-type="number" />
                        <li>
                            <xsl:value-of select="nombre_barrio" />
                            -
                            <xsl:value-of select="km2" />
                        </li>
                    </xsl:for-each>
                </ul>
                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>               