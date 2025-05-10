<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0">
    
    <xsl:output method="html" indent="yes" media-type="text/html"/>
    
    <xsl:template match="/" >
        
        <html lang="en">
            
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Ejercicio 2</title>
                <link rel="stylesheet" href="ejercicio-02.css"/>
            </head>
            
            <body>
                <h1>
                    Datos de edades por tramos
                </h1>
                <table>
                    <thead>
                        <tr>
                            <th scope="col">Tramo de edad</th>
                            <th scope="col">Mujeres</th>
                            <th scope="col">Hombres</th>
                            <th scope="col">Total del tramo</th>
                        </tr>
                        
                    </thead>
                    <tbody>
                        <xsl:for-each select="/padron-edad-sexo-2018/padron-edad-sexo-2018[Edad!='Total']">
                            <tr>
                                <th scope="row"><xsl:value-of select="Edad"/></th>
                                <td><xsl:value-of select="Mujeres"/></td>
                                <td><xsl:value-of select="Hombres"/></td>
                                <td><xsl:value-of select="Total"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                    
                    <tfoot>
                        <!-- 
                             <xsl:for-each select="/padron-edad-sexo-2018/padron-edad-sexo-2018[Edad='Total']">
                             
                             <tr>
                             <th scope="row">Total general (con for-each)</th>
                             <td><xsl:value-of select="Mujeres"/></td>
                             <td><xsl:value-of select="Hombres"/></td>
                             <td><xsl:value-of select="Total"/></td>
                             </tr>
                             </xsl:for-each> 
                        -->
                        <!-- Segunda forma de obtener totales -->
                        <!--
                             <tr>
                             <th scope="row">Total general (uno a uno)</th>
                             <td><xsl:value-of select="/padron-edad-sexo-2018/padron-edad-sexo-2018[Edad='Total']/Mujeres"/></td>
                             <td><xsl:value-of select="/padron-edad-sexo-2018/padron-edad-sexo-2018[Edad='Total']/Hombres"/></td>
                             <td><xsl:value-of select="/padron-edad-sexo-2018/padron-edad-sexo-2018[Edad='Total']/Total"/></td>
                             </tr>
                        -->
                        <tr>
                            <th scope="row">Total general (con last)</th>
                            <td><xsl:value-of select="/padron-edad-sexo-2018/padron-edad-sexo-2018[last()]/Mujeres"/></td>
                            <td><xsl:value-of select="/padron-edad-sexo-2018/padron-edad-sexo-2018[last()]/Hombres"/></td>
                            <td><xsl:value-of select="/padron-edad-sexo-2018/padron-edad-sexo-2018[last()]/Total"/></td>
                        </tr>
                        
                    </tfoot>
                    
                </table>
                
                
            </body>
            
        </html>
    </xsl:template>
    
    
    
</xsl:stylesheet>