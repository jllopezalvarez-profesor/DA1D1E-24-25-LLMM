<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="1.0" 
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    
    <xsl:output method="html" omit-xml-declaration="yes" media-type="text/html" />
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Biblioteca - B</title>
            </head>
            
            <body>
                <header>
                    <h1>Biblioteca - B</h1>
                </header>
                <main>
                    <!-- Aplicamos plantillas. -->
                    <xsl:apply-templates select="biblioteca/libro[anio = 1986]" />
                </main>
                
                <footer>
                    Biblioteca del IES Clara del Rey
                </footer>
            </body>
            
        </html>
    </xsl:template>
    
    <xsl:template match="libro" >
        <article>
            <h2>
                <xsl:value-of select="titulo" />
            </h2>
            <p>
                Autor:
                <xsl:value-of select="autor" />
            </p>
            
            <!-- 
                 Para procesar otros sub-elementos dentro de esta plantilla con otras 
                 plantillas hay que volver a aplicar plantillas. Si no se hace el 
                 procesador XSLT da el elemento "libro" como procesado, no llama 
                 por su cuenta a otras plantillas si no se especifica.
            -->
            <xsl:apply-templates />
            
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
            
        </article>
    </xsl:template>
    <xsl:template match="anio" >
        <p>
            Publicado:
            <xsl:value-of select="." />
        </p>
        <xsl:if test=". &lt; 2000">
            <p>Libro del siglo pasado.</p>
        </xsl:if>
        
        <xsl:choose>
            <xsl:when test=". &lt; 1950">
                <p>Primera mitad del sigo XX.</p>
            </xsl:when>
            <xsl:when test=". &gt; 1949 and . &lt; 2000 ">
                <p>Segunda mitad del sigo XX.</p>
            </xsl:when>
            <xsl:otherwise>
                <p>Siglo XXI</p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:transform>