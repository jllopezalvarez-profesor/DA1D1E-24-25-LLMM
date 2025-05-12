<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="html" indent="yes" />
    
    <xsl:template match="/Catalog">
        <xsl:variable name="idCategoria">21</xsl:variable>
        <xsl:variable name="nombreCategoria" select="ProductCategories/ProductCategory[@ProductCategoryID = $idCategoria]/Name"/>
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" href="estilos.css"/>
                <title>Listado de productos de la categoría <xsl:value-of select="$nombreCategoria"/> </title>
            </head>
            <body>
                <header>
                    <h1>
                        <!-- <xsl:value-of select="ProductCategories/ProductCategory[@ProductCategoryID = $idCategoria]/Name"/> -->
                        <xsl:value-of select="$nombreCategoria"/>
                    </h1>
                </header>
                <div class="nav-main-container">
                    <nav>
                        <h2>Categorías:</h2>
                        <ul>
                            <xsl:for-each select="ProductCategories/ProductCategory[not(@ParentProductCategoryID)]">
                                <xsl:variable name="idCatPadre" select="@ProductCategoryID"/>
                                <li>
                                    <p><xsl:value-of select="Name"/></p>
                                    <ul>
                                        <xsl:for-each select="/Catalog/ProductCategories/ProductCategory[@ParentProductCategoryID = $idCatPadre ]">
                                            <li>
                                                <a href="categoria.html/{@ProductCategoryID}">
                                                    <xsl:if test="@ProductCategoryID = $idCategoria">
                                                        <xsl:attribute name="class">actual</xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:value-of select="Name"/>
                                                </a>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </nav>
                    <main>
                        <h2>Productos en esta categoría</h2>
                        <xsl:for-each select="Products/Product[@ProductCategoryId = $idCategoria][position() &gt; 10 and position() &lt;= 20 ]">
                            <!-- <xsl:for-each select="Products/Product[@ProductCategoryId = $idCategoria][position() &lt;= 20]"> -->
                            <!-- <xsl:for-each select="Products/Product[(@ProductCategoryId = $idCategoria) and (position() &lt;= 20)]"> -->
                            <article>
                                <h3><xsl:value-of select="Name"/></h3>
                                <p>Categoría: <xsl:value-of select="$nombreCategoria"/></p>
                                <img src='data:image/gif;base64,{ThumbNailPhoto}' alt="Foto de {Name} en la categoría {/Catalog/ProductCategories/ProductCategory[@ProductCategoryID = $idCategoria]/Name}" />
                                <p>
                                    <xsl:attribute name="class">
                                        <xsl:choose>
                                            <xsl:when test="(position() mod 2) = 0">
                                                Clase-a
                                            </xsl:when>
                                            <xsl:otherwise>
                                                clase-b
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        
                                    </xsl:attribute>
                                    Color: <xsl:value-of select="Color"/> 
                                </p>
                                <p>Precio: <xsl:value-of select="ListPrice"/></p>
                                <p><a href="producto.html{@ProductId}">Ver más información de <xsl:value-of select="Name"/></a></p>
                            </article>
                        </xsl:for-each>
                    </main>
                </div>
                <footer>
                    <address>Adeventure Works Inc. MS SQL Server Example Database</address>
                </footer>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>