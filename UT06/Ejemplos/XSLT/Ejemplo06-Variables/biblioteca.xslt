<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="1.0" 
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    
    <xsl:output method="html" omit-xml-declaration="yes" media-type="text/html" />

    <!-- Variable global -->

    <xsl:variable name="variableGlobal2" select="count(/biblioteca/libro)"/>

    <xsl:variable name="variableGlobal1">Número de libros: </xsl:variable>

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
                    <p><xsl:value-of select="$variableGlobal1"/><xsl:value-of select="$variableGlobal2"/></p>
                </header>
                <main>
                    <xsl:for-each select="biblioteca/libro">
                        <xsl:sort select="anio" order="ascending" />
                        <xsl:variable name="numSubGeneros" select="count(subgeneros/subgenero)"/>
                        <xsl:variable name="subGen" select="subgeneros/subgenero"/>



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




                            <xsl:if test="$numSubGeneros &gt; 0">
                                <p><xsl:value-of select="$numSubGeneros"/> subgéneros:</p>

                                <ul>
                                    <xsl:for-each select="$subGen">
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