<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
  
  <xsl:output method="html" indent="yes" media-type="text/html" />
  
  <xsl:template match="/">
    
    
    <html lang="es">
      
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta charset="UTF-8"/>
        <title>Listado de Pokémon</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous"/>
        <link rel="stylesheet" href="pokemon-a.css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
                crossorigin="anonymous"></script>
      </head>
      <body>
        <header class="p-3 text-bg-dark">
          <div class="container">
            <div class="d-flex align-items-center justify-content-between">
              <h1><a href="javascript://"
                       class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                  Pokémon database
                </a></h1>
              <div class="text-end">
                <a class="btn btn-outline-light me-2" href="javascript://">Login</a><a class="btn btn-warning"
                                                                                       href="javascript://">Registrarse</a>
              </div>
            </div>
          </div>
        </header>
        <main>
          <div class="container py-3">
            <section class="initial">
              <h2 class="text-center">Pokémon iniciales</h2>
              <div class="d-flex flex-wrap justify-content-evenly">
                
                <xsl:for-each select="pokemons/pokemon[@class='initial']">
                  <xsl:sort select="name"/>
                  
                  
                  <article class="card m-3 pokemon-card">
                    <div class="card-img-top mb-0 pt-0">
                      
                      <xsl:if test="sprites/front_default">
                        <img alt="Imagen frontal de {name}" src="{sprites/front_default}"/>
                      </xsl:if>
                      <xsl:if test="not(sprites/front_default)">
                        <img alt="Imagen frontal de {name}" src="https://dummyimage.com/96x96/fff/000.png&amp;text=NO+DISPONIBLE"/>
                      </xsl:if>           
                      
                      <xsl:choose>
                        <xsl:when test="sprites/back_default">
                          <img
                            alt="Imagen trasera de {name}">
                            <xsl:attribute name="src">
                              <xsl:value-of select="sprites/back_default"/>
                            </xsl:attribute>  
                          </img>
                        </xsl:when>
                        
                        <xsl:otherwise>
                          <img alt="Imagen trasera de {name}" src="https://dummyimage.com/96x96/fff/000.png&amp;text=NO+DISPONIBLE"/>

                        </xsl:otherwise>
                        
                      </xsl:choose>

                     
                    </div>
                    <div class="card-body mt-0 pt-0">
                      <h3 class="card-title"><xsl:value-of select="name"/></h3>
                      <div class="card-text">
                        <p class="btn btn-outline-dark">
                          Experiencia base:
                          <span class="badge text-bg-danger">
                            <xsl:attribute name="class">
                              <xsl:choose>
                                <xsl:when test="base_experience >= 200">
                                  badge text-bg-success
                                </xsl:when>
                                <xsl:when test="base_experience &lt; 200 and base_experience >= 100">
                                  badge text-bg-warning
                                </xsl:when>
                                <xsl:otherwise>
                                  badge text-bg-danger
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:attribute>                            
                            <xsl:value-of select="base_experience"/>
                          </span>
                        </p>
                        <p class="btn btn-outline-dark">Estatura: <span class="badge text-bg-secondary"><xsl:value-of select="height"/></span>
                        </p>
                        <p class="btn btn-outline-dark">Peso: <span class="badge text-bg-secondary"><xsl:value-of select="weight"/></span>
                        </p>
                      </div>
                      <a href="{url}" target="_blank" class="btn btn-primary">Ver
                        datos completos de <xsl:value-of select="name"/></a>
                    </div>
                  </article>
                  
                </xsl:for-each>
                
                
                
              </div>
            </section>
            <section class="legendary">
              <h2 class="text-center">Pokémon legendarios</h2>
              <div class="d-flex flex-wrap justify-content-evenly">
                
                <xsl:for-each select="pokemons/pokemon[@class='legendary']">
                  <xsl:sort select="weight" order="descending" data-type="number"/>
                  
                  <article class="card m-3 pokemon-card">
                    <div class="card-img-top mb-0 pt-0">
                      
                      <xsl:if test="sprites/front_default">
                        <img alt="Imagen frontal de {name}" src="{sprites/front_default}"/>
                      </xsl:if>
                      <xsl:if test="not(sprites/front_default)">
                        <img alt="Imagen frontal de {name}" src="https://dummyimage.com/96x96/fff/000.png&amp;text=NO+DISPONIBLE"/>
                      </xsl:if>           
                      
                      <xsl:choose>
                        <xsl:when test="sprites/back_default">
                          <img
                            alt="Imagen trasera de {name}">
                            <xsl:attribute name="src">
                              <xsl:value-of select="sprites/back_default"/>
                            </xsl:attribute>  
                          </img>
                        </xsl:when>
                        
                        <xsl:otherwise>
                          <img alt="Imagen trasera de {name}" src="https://dummyimage.com/96x96/fff/000.png&amp;text=NO+DISPONIBLE"/>
                          
                        </xsl:otherwise>
                        
                      </xsl:choose>
                      
                      
                    </div>
                    <div class="card-body mt-0 pt-0">
                      <h3 class="card-title"><xsl:value-of select="name"/></h3>
                      <div class="card-text">
                        <p class="btn btn-outline-dark">
                          Experiencia base:
                          <span class="badge text-bg-danger">
                            <xsl:attribute name="class">
                              <xsl:choose>
                                <xsl:when test="base_experience >= 200">
                                  badge text-bg-success
                                </xsl:when>
                                <xsl:when test="base_experience &lt; 200 and base_experience >= 100">
                                  badge text-bg-warning
                                </xsl:when>
                                <xsl:otherwise>
                                  badge text-bg-danger
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:attribute>                            
                            <xsl:value-of select="base_experience"/>
                          </span>
                        </p>
                        <p class="btn btn-outline-dark">Estatura: <span class="badge text-bg-secondary"><xsl:value-of select="height"/></span>
                        </p>
                        <p class="btn btn-outline-dark">Peso: <span class="badge text-bg-secondary"><xsl:value-of select="weight"/></span>
                        </p>
                      </div>
                      <a href="{url}" target="_blank" class="btn btn-primary">Ver
                        datos completos de <xsl:value-of select="name"/></a>
                    </div>
                  </article>
                  
                </xsl:for-each>
                
                
                
              </div>
            </section>
          </div>
        </main>
        <footer>
          <div class="container">
            <div class="d-flex align-items-center justify-content-center py-3"><a href="https://iesclaradelrey.es"
                                                                                    target="_blank" class="mb-3 text-decoration-none">IES Clara del Rey</a></div>
          </div>
        </footer>
        
      </body>
      
    </html>
    
    
    
  </xsl:template>
  
  
  
</xsl:stylesheet>