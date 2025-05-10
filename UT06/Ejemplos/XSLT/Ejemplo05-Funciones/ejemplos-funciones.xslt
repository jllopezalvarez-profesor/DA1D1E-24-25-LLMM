<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" omit-xml-declaration="yes" media-type="text/html" />

	<xsl:template match="/">
		<html lang="es">
			<head>
				<meta charset="UTF-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<title>Ejemplos de funciones XSLT</title>
				<link rel="stylesheet" type="text/css" href="estilos.css" />
			</head>

			<body>
				<header>
					<h1>Ejemplos de funciones XSLT</h1>
				</header>
				<main>
					<article>
						<h2>
							Funciones de cadenas (String)
						</h2>
						<xsl:call-template name="ejemploSubstringA"></xsl:call-template>
						<xsl:call-template name="ejemploSubstringB"></xsl:call-template>
						<xsl:call-template name="ejemploLengthA"></xsl:call-template>
						<xsl:call-template name="ejemploLengthB"></xsl:call-template>
						<!-- <xsl:call-template name="ejemploStringJoin"></xsl:call-template> -->
						<!-- Translate solo cambia los caracteres que encuentra. Lo que no encuentra en la primera palabra, lo elimina. -->
						<p>
							<xsl:value-of select="translate('now brown', 'brown', 'red')" />
						</p>

						<xsl:for-each select="//libro">
							<p>
								<xsl:if test="position() = last()">
									<xsl:attribute name="class">ultimo</xsl:attribute>
								</xsl:if>
								<xsl:value-of select="titulo" /> / 
								Nombre del nodo: <xsl:value-of select="name()" /> /
								Posicion del nodo: <xsl:value-of select="position()" /> /
								Posicion del último nodo: <xsl:value-of select="last()" /> 
								<xsl:if test="position() = last()">
									ultimo
							</xsl:if>
								
							</p>

						</xsl:for-each>


					</article>
				</main>
				<footer>
					<p>
						IES Clara del Rey
					</p>
				</footer>
			</body>

		</html>
	</xsl:template>
	<xsl:template name="ejemploSubstringA">
		<h3>Substring (de posición 10 al final)</h3>
		<ul>
			<xsl:for-each select="/biblioteca/libro">
				<li>
					<xsl:value-of select="substring(titulo, 10)"></xsl:value-of>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template name="ejemploSubstringB">
		<h3>Substring (primeros 4 caracteres, desde la posición 1, longitud 4)</h3>
		<ul>
			<xsl:for-each select="/biblioteca/libro">
				<li>
					<xsl:value-of select="substring(titulo, 1, 4)"></xsl:value-of>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template name="ejemploLengthA">
		<h3>Longitud de todos los títulos (función string-length)</h3>
		<ul>
			<xsl:for-each select="/biblioteca/libro">
				<li>
					<xsl:value-of select="titulo"></xsl:value-of>
					- Longitud:
					<xsl:value-of select="string-length(titulo)"></xsl:value-of>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template name="ejemploLengthB">
		<h3>Longitud de todos los títulos (función string-length) - Versión 2</h3>
		<ul>
			<xsl:for-each select="/biblioteca/libro/titulo">
				<li>
					<xsl:value-of select="."></xsl:value-of>
					- Longitud:
					<xsl:value-of select="string-length()"></xsl:value-of>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template name="ejemploStringJoin">
		<h3>Años de todos los libros, separados por comas</h3>
		<ul>
			<xsl:value-of select="string-join(/biblioteca/libro/titulo , ', ')"></xsl:value-of>
		</ul>
	</xsl:template>
</xsl:transform>