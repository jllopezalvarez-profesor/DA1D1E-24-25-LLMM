<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    
    <xsl:output method="html" indent="yes" media-type="text/html"/>
    
    
    <xsl:template match="/">
        <html lang="es">
            
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Biblioteca</title>
                <link rel="stylesheet" href="estilos.css"/>
                
            </head>
            
            <body>
                <header>
                    <h1>Biblioteca</h1>
                </header>
                <main>
                    
                    <xsl:for-each select="biblioteca/libro">
                        <xsl:sort select="titulo"/>
                        <article>
                            <h2><xsl:value-of select="titulo"/></h2>
                            <p>Autor: <xsl:value-of select="autor" /></p>
                            <p>Publicado: <xsl:value-of select="anio" /> </p>
                            <!--
                                 <xsl:choose>
                                 <xsl:when test="anio &lt; 1950">
                                 <p>Primera mitad del sigo XX.</p>
                                 </xsl:when>
                                 <xsl:when test="anio &gt; 1950 and anio &lt; 2000">
                                 <p>Segunda mitad del sigo XX.</p>
                                 
                                 </xsl:when>
                                 <xsl:when test="anio &lt; 2000">
                                 <p>Libro del siglo pasado</p>
                                 </xsl:when>
                                 <xsl:otherwise>
                                 <p>Siglo XXI</p>
                                 </xsl:otherwise>
                                 </xsl:choose>
                            -->
                            <xsl:if test="anio &lt; 1950">
                                <!-- Si el libro es anterior al 1950 -->
                                <p>Primera mitad del sigo XX.</p>
                            </xsl:if>
                            <xsl:if test="anio &gt; 1950 and anio &lt; 2000">
                                <!-- Si el libro es posterior al 1950 y anterior al 2000 -->
                                <p>Segunda mitad del sigo XX.</p>
                                
                            </xsl:if>
                            <xsl:if test="anio &lt; 2000">
                                <!-- Si el libro es anterior al 2000 -->
                                <p>Libro del siglo pasado</p>
                            </xsl:if>
                            <xsl:if test="anio &gt; 2000">
                                <!-- Si el libro es posterior al 2000 -->
                                <p>Siglo XXI</p>
                            </xsl:if>
                            
                            
                            <p>Género: <xsl:value-of select="genero" /></p>
                            
                            <!-- <xsl:if test="count(subgeneros/subgenero) &gt; 0"> -->
                            <xsl:if test="subgeneros/subgenero">
                                
                                <p>Subgéneros:</p>
                                
                                <ul>
                                    <xsl:for-each select="subgeneros/subgenero">
                                        
                                        <!-- <li title="{.}"> -->
                                        <li>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="."/>
                                            </xsl:attribute>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </xsl:if>
                            <p>Título original: <xsl:value-of select="tituloOriginal" /></p>
                        </article>
                    </xsl:for-each>
                </main>
                
                <footer>
                    Biblioteca del IES Clara del Rey
                    <address>
                        Padre Claret 8
                    </address>
                </footer>
            </body>
            
        </html>
    </xsl:template>
    
    
    
</xsl:stylesheet>