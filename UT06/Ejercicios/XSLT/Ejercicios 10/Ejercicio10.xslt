<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="html" indent="yes" />
    
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" href="estilos.css"/>
                <title>Pedidos</title>
            </head>
            <body>
                <header>
                    <h1>Pedidos</h1>
                </header>
                <main>
                    <xsl:for-each select="Orders/Order">
                        <article>
                            <header>
                                <h2>Pedido nº <xsl:value-of select="@OrderNumber"/></h2>
                            </header>
                            <div class="datos-gen-pedido">
                                <h3>Datos generales</h3>
                                <p>Fecha: <xsl:value-of select="OrderDate"/></p>
                                <p>Método de envío: <xsl:value-of select="ShipMethod"/></p>
                                <h4>Importes</h4>
                                <ul>
                                    <li>Total (antes de impuesos y envío): <xsl:value-of select="SubTotal"/></li>
                                    <li>Impuestos: <xsl:value-of select="TaxAmt"/></li>
                                    <li>Envío: <xsl:value-of select="Freight"/></li>
                                    <li>Total: <xsl:value-of select="TotalDue"/></li>
                                </ul>                                
                            </div>
                            <div class="lineas-pedido">
                                <h3>Productos</h3>
                                <table class="productosPedido">
                                    <tr>
                                        <th>Id</th>
                                        <th>Producto</th>
                                        <th>Cantidad</th>
                                        <th>Precio unitario</th>
                                        <th>Subtotal</th>
                                    </tr>
                                    <xsl:for-each select="OrderDetails/OrderDetail">
                                        <tr>
                                            <td><xsl:value-of select="@ProductID"/></td>
                                            <td><xsl:value-of select="ProductName"/></td>
                                            <td><xsl:value-of select="OrderQty"/></td>
                                            <td><xsl:value-of select="UnitPrice"/></td>
                                            <td><xsl:value-of select="LineTotal"/></td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                            </div>
                            <div class="datos-envio-pedido">
                                <h3>Dirección de envío</h3>
                                <p>Dirección: <xsl:value-of select="BillToAddress/Address/AddressLine1"/> - <xsl:value-of select="BillToAddress/Address/City"/></p>
                                <p>Estado/provincia: <xsl:value-of select="BillToAddress/Address/StateProvince"/></p>
                                <p>País: <xsl:value-of select="BillToAddress/Address/CountryRegion"/></p>
                                <p>Código postal: <xsl:value-of select="BillToAddress/Address/PostalCode"/></p>
                            </div>
                            <div class="datos-fact-pedido">
                                <h3>Dirección de facturación</h3>
                                <p>Dirección: <xsl:value-of select="ShipToAddress/Address/AddressLine1"/> - <xsl:value-of select="ShipToAddress/Address/City"/></p>
                                <p>Estado/provincia: <xsl:value-of select="ShipToAddress/Address/StateProvince"/></p>
                                <p>País: <xsl:value-of select="ShipToAddress/Address/CountryRegion"/></p>
                                <p>Código postal: <xsl:value-of select="ShipToAddress/Address/PostalCode"/></p>
                            </div>
                        </article>
                    </xsl:for-each>
                </main>
                <footer>
                    <address>Adeventure Works Inc. MS SQL Server Example Database</address>
                </footer>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

<!--
     Dado el fichero pedidos.xml, que tiene un volcado en XML de los pedidos de la base de datos del distribuidor “Adventure Works”, crear una plantilla XSLT para conseguir una página HTML con la información del pedido. Debe contener:
     
     •	Una zona para la información de envío:
     o	
     o	
     o	
     o	
     •	Una zona para la información de facturación:
     o	Dirección
     o	Estado/provincia
     o	País
     o	Código postal
     
-->