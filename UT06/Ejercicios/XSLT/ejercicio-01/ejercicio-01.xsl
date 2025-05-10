<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    
    <xsl:output method="html" indent="yes" media-type="text/html"/>
    
    <xsl:template match="/" >
        <html lang="en">
            
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Document</title>
            </head>
            
            <body>
                <h1>Datos de tramos de edad en Lorca</h1>
                
                <xsl:for-each select="estadistica-edad-sexo-distrito/item_edad">
                    <h2>Datos para la edad <xsl:value-of select="edad"/></h2>
                    <ul>
                        <li>Mujeres-1: <xsl:value-of select="mujeres_1"/></li>
                        <li>Hombres-1: <xsl:value-of select="hombres_1"/></li>
                        <li>Mujeres-2: <xsl:value-of select="mujeres_2"/></li>
                        <li>Hombres-1: <xsl:value-of select="hombres_2"/></li>
                    </ul>
                </xsl:for-each>
                
            </body>
            
        </html>
        
        
        
    </xsl:template>
    
    
    
</xsl:stylesheet>