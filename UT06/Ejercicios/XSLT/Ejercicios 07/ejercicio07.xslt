<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" media-type="text/html" indent="yes" />
    <xsl:template match="/facturas/factura">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" href="ejercicio07.css"/>
                <title>Factura nº
                    <xsl:value-of select="@numFactura"/> //
                    <xsl:value-of select="@fechaEmision"/>
                </title>
            </head>
            <body>
                <header>
                    <h1>
                        Factura                   
                        <xsl:value-of select="@numFactura"/> 
                        - Fecha de emisión: <xsl:value-of select="@fechaEmision"/>
                    </h1>
                </header>
                <main>
                    <xsl:apply-templates />
                </main>
                <xsl:call-template name="piePagina">
                    
                    
                </xsl:call-template>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template name="piePagina">
        <footer>
            Pie de página
            <xsl:value-of select="@numFactura"/>
        </footer>
    </xsl:template>
    
    <xsl:template match="proveedor">
        <div class="parte vendedor">
            <h2>Vendedor</h2>
            <dl>
                <div>
                    <dt>Identificación (<xsl:value-of select="identificacion/@tipo"/>)</dt>
                    <dd><xsl:value-of select="identificacion"/></dd>
                </div>
                <div>
                    <dt>Nombre</dt>
                    <dd><xsl:value-of select="nombre"/></dd>
                </div>
                <div>
                    <dt>Domicilio</dt>
                    <dd><xsl:value-of select="domicilio"/></dd>
                </div>
                <div>
                    <dt>Teléfono</dt>
                    <dd><xsl:value-of select="telefono"/></dd>
                </div>
                <div>
                    <dt>Contacto</dt>
                    <dd><xsl:value-of select="contacto/nombre"/> / <xsl:value-of select="contacto/email"/></dd>
                </div>
            </dl>
        </div>
    </xsl:template>
    
    <xsl:template match="cliente">
        <div class="parte comprador">
            <h2>Cliente</h2>
            <dl>
                <div>
                    <dt>Identificación (<xsl:value-of select="identificacion/@tipo"/>)</dt>
                    <dd><xsl:value-of select="identificacion"/></dd>
                </div>
                <div>
                    <dt>Nombre</dt>
                    <dd><xsl:value-of select="nombre"/></dd>
                </div>
                <div>
                    <dt>Domicilio</dt>
                    <dd><xsl:value-of select="domicilio"/></dd>
                </div>
                <div>
                    <dt>Teléfono</dt>
                    <dd><xsl:value-of select="telefono"/></dd>
                </div>
                <div>
                    <dt>Correo electrónico</dt>
                    <dd><xsl:value-of select="email"/></dd>
                </div>
            </dl>
        </div>
    </xsl:template>
    
    
    <xsl:template match="articulos">
        <div class="items">
            <h2>Artículos</h2>
            <table>
                <tr>
                    <th>Concepto</th>
                    <th>Cantidad</th>
                    <th>Precio unitario</th>
                    <th>Importe s/IVA</th>
                    <th>Tipo IVA</th>
                    <th>IVA</th>
                    <th>Importe IVA inc.</th>
                </tr>
                <xsl:apply-templates/>
            </table>
        </div>
    </xsl:template>
    
    <xsl:template match="articulo">
        <tr>
            <td><xsl:value-of select="concepto"/></td>
            <td class="dcha"><xsl:value-of select="cantidad"/><xsl:value-of select="unidades"/></td>
            <td class="dcha"><xsl:value-of select="precioUnitario"/></td>
            <td class="dcha"><xsl:value-of select="importeSinIva"/></td>
            <td class="centro"><xsl:value-of select="tipoIva"/></td>
            <td class="dcha"><xsl:value-of select="iva"/></td>
            <td class="dcha">
                <!-- <xsl:value-of select="importeConIva"/> -->
                <xsl:call-template name="addGuiones">
                    <xsl:with-param name="texto" select="importeConIva"/>
                    
                </xsl:call-template>
                
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="importes" >
        <div class="importes">
            <h2>Importes</h2>
            <ul>
                <li>Total sin IVA: <xsl:value-of select="totalSinIva"/></li>
                <li>Total IVA incluido: <xsl:value-of select="totalConIva"/></li>
            </ul>
            <h3>Desglose de IVA:</h3>
            <ul>
                <xsl:for-each select="ivas/iva">
                    <li><xsl:value-of select="@porcentaje"/>%: <xsl:value-of select="importe"/> (base imponible <xsl:value-of select="base"/>)</li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    
    <xsl:template name="addGuiones">
        <xsl:param name="texto"/>
        --<xsl:value-of select="$texto"/>--
    </xsl:template>
    
</xsl:stylesheet>
