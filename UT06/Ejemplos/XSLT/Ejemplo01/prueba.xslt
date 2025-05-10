<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    
    <xsl:output method="html" indent="yes" media-type="text/html"/>
    
    <xsl:template match="/">
        <html lang="es">
            
            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Biblioteca</title>
            </head>
            
            <body>
                <header>
                    <h1>Biblioteca</h1>
                </header>
                <main>
                    <ul>
                        <xsl:for-each select="//autor[../anio &gt; 2000]">
                            <li><xsl:value-of select="."/> - <xsl:value-of select="../titulo"/></li>
                        </xsl:for-each>
                    </ul>
                    <ul>
                        <xsl:for-each select="biblioteca/libro">
                            <xsl:sort select="titulo"/>
                            <li><xsl:value-of select="autor"/> - <xsl:value-of select="titulo"/></li>
                        </xsl:for-each>
                    </ul>
                </main>
                <footer>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>