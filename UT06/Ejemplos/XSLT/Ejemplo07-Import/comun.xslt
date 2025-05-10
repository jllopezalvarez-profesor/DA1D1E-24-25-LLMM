<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="cabecera">
        <xsl:param name="titulo" />
        <header>
            <h1>
                <xsl:value-of select="$titulo" />
            </h1>
        </header>
    </xsl:template>
    <xsl:template name="pie">
        <xsl:param name="textoPie" />
        <footer>
            <xsl:value-of select="$textoPie" />
        </footer>
    </xsl:template>
</xsl:transform>