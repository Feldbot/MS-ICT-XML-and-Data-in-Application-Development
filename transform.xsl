<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Name: Daniel Feldman
Date: 11/10/16
File: transform.xsl
-->

<xsl:stylesheet
version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/> 
	<xsl:template match="/">
		<html>
			<head>
				<title>ICT 4540 Final Project</title>
				<link rel="stylesheet" type="text/css" href="styles.css"/>
			</head>
			<body>
				<section id="container">
					<section id="header">
						<h1>ICT 4540 Final Project:<br/> 
						Journal Article Metadata Extraction with XML</h1>
						<h2>Daniel Feldman</h2>
					</section>
					
					<section id="leftnav">		
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="Deshommes.xml">Article 1</a></li>
							<li><a href="Cornwell.xml">Article 2</a></li>
							<li><a target="_blank" href="transform.xsl">XSL</a></li>
							<li><a target="_blank" href="http://jats.nlm.nih.gov/publishing/1.1/JATS-journalpublishing1.dtd">DTD</a></li>
							<li><a target="_blank" href="styles.css">CSS</a></li>
						</ul>
					</section>
					
					<section id="metadata">
						<ul>
							<li>
							<strong>Title: </strong> 
								<xsl:value-of select="article/front/article-meta//article-title"/>
							</li>
							<li>
							<strong>Author(s): </strong>
								<xsl:apply-templates select="//article-meta//name"/>
							</li>
							<li>
							<strong>Journal Name: </strong> 
								<xsl:value-of select="article/front/journal-meta/journal-id"/>
							</li>
							<li>
							<strong>Publisher: </strong> 
								<xsl:value-of select="article/front/journal-meta/publisher/publisher-name"/>
							</li>
							<li>
							<strong>ISSN: </strong> 
								<xsl:value-of select="article/front/journal-meta/issn"/>
							</li>
							<li>
							<strong>Publication Date: </strong> 
								<xsl:value-of select="article/front/article-meta/pub-date/day"/>/<xsl:value-of select="article/front/article-meta/pub-date/month"/>/<xsl:value-of select="article/front/article-meta/pub-date/year"/>
							</li>
							<li>
							<strong>Volume: </strong> 
								<xsl:value-of select="article/front/article-meta/volume"/>
							</li>
							<li>
							<strong>Issue: </strong> 
								<xsl:value-of select="article/front/article-meta/issue"/>
							</li>
							<li>
							<strong>Pages: </strong> 
								<xsl:value-of select="article/front/article-meta/fpage"/>
								<xsl:value-of select="article/front/article-meta/lpage"/>
							</li>
							<li>
							<strong>Figures: </strong>
								<xsl:value-of select="count(//fig)"/>
							</li>
							<li>
							<strong>Tables: </strong>
								<xsl:value-of select="count(//table-wrap)"/>
							</li>
							<li>
							<strong>DOI: </strong> 
								<xsl:value-of select="article/front/article-meta/article-id"/>
							</li>
							<li>
							<strong>Keywords: </strong> 
								<xsl:apply-templates select="//subject"/>
							</li>
							<li>
							<strong>Abstract: </strong>
								<xsl:value-of select="article/front/article-meta/abstract"/>
							</li>
						</ul>
						<br/>
						<p style="text-align:center"><em>View the page source code to see the XML file with JATS markup</em></p>
					</section>

				</section>
			</body>
		</html>
	</xsl:template>
	 
	<xsl:template match="given-names">
		<xsl:value-of select="."/>;
	</xsl:template>
	
	<xsl:template match="surname">
		<xsl:value-of select="."/>,
	</xsl:template>	
	
	<xsl:template match="subject">
		<xsl:value-of select="."/>, 
	</xsl:template>
	
</xsl:stylesheet>
