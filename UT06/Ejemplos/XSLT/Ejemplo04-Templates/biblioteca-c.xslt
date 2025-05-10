<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" omit-xml-declaration="yes" media-type="text/html" />
    
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Biblioteca - C</title>
            </head>
            <body>
                <header>
                    <h1>Biblioteca - C</h1>
                </header>
                <nav>
                    <ul>
                        <xsl:apply-templates mode="indice" />
                    </ul>
                </nav>
                <main>
                    <xsl:apply-templates />
                </main>
                <footer>
                    Biblioteca del IES Clara del Rey
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="libro">
        <article id="{@id}">
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
            <xsl:apply-templates select="anio" mode="siglo" />
            <xsl:apply-templates select="anio" mode="mitadSiglo" />
            <p>
                Género:
                <xsl:value-of select="genero" />
            </p>
            
            
            <xsl:apply-templates select="subgeneros" />
            
            <p>
                Título original:
                <xsl:value-of select="tituloOriginal" />
            </p>
            
        </article>
        
    </xsl:template>
    
    <xsl:template match="libro" mode="indice">
        <li>
            <a href="#{@id}">
                <xsl:value-of select="titulo" />
            </a>
            <!-- <a>
                 <xsl:attribute name="href">
                 #
                 <xsl:value-of select="@id"></xsl:value-of>
                 </xsl:attribute>
                 <xsl:value-of select="titulo" />
                 </a> -->
         </li>
    </xsl:template>
    
    
    <xsl:template match="anio" mode="siglo">
        <!-- <xsl:if test=". &lt; 2000">
             <p>Libro del siglo pasado.</p>
             </xsl:if> -->
        <xsl:choose>
            <xsl:when test=". &lt; 2000">
                <p>Libro del siglo pasado.</p>
            </xsl:when>
            <xsl:otherwise>
                <p>Libro de este siglo.</p>
            </xsl:otherwise>
        </xsl:choose>
        
        
        
        
    </xsl:template>
    
    <xsl:template match="anio" mode="mitadSiglo">
        <xsl:choose>
            <xsl:when test=". &lt; 1950">
                <p>Primera mitad del sigo XX.</p>
            </xsl:when>
            <xsl:when test=". &gt; 1949 and . &lt;= 2000 ">
                <p>Segunda mitad del sigo XX.</p>
            </xsl:when>
            <xsl:otherwise>
                <p>Siglo XXI</p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="subgeneros">
        <xsl:if test="count(subgenero) &gt; 0">
            
            <p>Subgéneros:</p>
            <ul>
                <xsl:for-each select="subgenero">
                    <li>
                        <xsl:value-of select="." />
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>
        
    </xsl:template>
    
</xsl:transform>