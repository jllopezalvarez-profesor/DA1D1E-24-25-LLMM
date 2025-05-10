<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" omit-xml-declaration="yes" media-type="text/html" />
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Biblioteca</title>
            </head>
            
            <body>
                <header>
                    <h1>Biblioteca</h1>
                </header>
                <main>
                    <xsl:for-each select="biblioteca/libro">
                        <xsl:sort select="anio" data-type="number" order="ascending" />
                        <article>
                            <h2>
                                <xsl:value-of select="titulo" />
                            </h2>
                            <p>
                                Autor:
                                <xsl:value-of select="autor" />
                            </p>
                            <p>
                                Publicado:
                                <xsl:value-of select="anio" />
                            </p>
                            <xsl:if test="anio &lt; 2000">
                                <p>Libro del siglo pasado.</p>
                            </xsl:if>
                            
                            <xsl:choose>
                                <xsl:when test="anio &lt; 1950">
                                    <p>Primera mitad del sigo XX.</p>
                                </xsl:when>
                                <xsl:when test="anio &gt; 1949 and anio &lt; 2000 ">
                                    <p>Segunda mitad del sigo XX.</p>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p>Siglo XXI</p>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                            <p>
                                Género:
                                <xsl:value-of select="genero" />
                            </p>
                            
                            <xsl:if test="count(subgeneros/subgenero) &gt; 0">
                                
                                <p>Subgéneros:</p>
                                <ul>
                                    <xsl:for-each select="subgeneros/subgenero">
                                        <li>
                                            <xsl:value-of select="." />
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </xsl:if>
                            <p>
                                Título original:
                                <xsl:value-of select="tituloOriginal" />
                            </p>
                            <p>
                                <img alt="imagen de {titulo}">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="anio"/>
                                    </xsl:attribute>
                                </img>
                                <img >
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="anio"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt" >Imagen de <xsl:value-of select="titulo"/></xsl:attribute>
                                </img>
                                
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="anio"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt" >Imagen de <xsl:value-of select="titulo"/></xsl:attribute>
                                </xsl:element>
                            </p>
                        </article>
                    </xsl:for-each>
                    
                </main>
                
                <footer>
                    Biblioteca del IES Clara del Rey
                </footer>
            </body>
            
        </html>
    </xsl:template>
</xsl:transform>