<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:template match="/">
 <html>
  <head>
    <title>GK Resources</title>
    <style type="text/css">
      th {background-color:silver;}
      td {border-style:solid; border-width:1px;}
    </style>
    <script src="js/include.js"></script>
    <meta charset="UTF-8"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"></link>
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css"></link>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto"></link>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></link>
    <style>
    html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
    .w3-sidebar {
      z-index: 3;
      width: 250px;
      top: 43px;
      bottom: 0;
      height: inherit;
    }
    </style>
  </head>
  <body>
      <div class="w3-main" style="margin-left:250px">
        <br></br>
        <br></br>
        <xsl:apply-templates/>
    </div>
   </body>
</html>
</xsl:template>

<!-- Generate bebete list  -->
<xsl:template match="GkBeast">
 <div class="w3-container">
  <H2>Bestiaire</H2>
  <xsl:variable name="nbOfItem"><xsl:value-of select="itemsInfo/itemsList/@nb"/></xsl:variable>
  <xsl:variable name="nbOfItemPlus"><xsl:value-of select="$nbOfItem+1"/></xsl:variable>
  <table class="w3-table-all w3-hoverable">
    <thead>
		<tr> 
			<th rowspan="2">Nom</th>
			<th rowspan="2">Informations générales</th>
			<th rowspan="2">Information combat</th>
			<th colspan="{$nbOfItemPlus}"><xsl:value-of select="itemsInfo/Nom"/></th>
			<th rowspan="2"><xsl:value-of select="Beasts/Beast/items/@name"/></th>
		</tr>
		<tr>
		<xsl:for-each select="itemsInfo/itemsList/item">	
			<th width="30"><xsl:value-of select="."/></th>
		</xsl:for-each>
			<th width="30">Distance</th>
		</tr>
	</thead>
	<tbody>
		<xsl:for-each select="Beasts/Beast">
			<xsl:sort select="@id"/>
			<xsl:call-template name="Object">
				<xsl:with-param name="image">melee</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
	</tbody>
  </table>
 </div>
</xsl:template>

<!-- Template -->
<xsl:template name="Object">  
	<xsl:param name = "image"/>
	<tr> 
		<th><xsl:value-of select="Nom"/></th>	
		<xsl:for-each select="Description">
			<td><xsl:call-template name="BigText"/></td>
		</xsl:for-each>
		<xsl:for-each select="Information">
			<td><xsl:call-template name="BigText"/></td>
		</xsl:for-each>
		<xsl:if test="itemsID">
			<xsl:call-template name="itemsID">				
				<xsl:with-param name="image" select="$image"/>
			</xsl:call-template>
			<td align="center">
                <xsl:choose>
                    <xsl:when test="$sum = 'taille'">
                        <xsl:param name = "value"><xsl:value-of select="itemsID/item/@taille"/></xsl:param>
                        <xsl:choose>
                            <xsl:when test="$value = 'XS'"><xsl:param name = "modif">-4</xsl:param></xsl:when>
                            <xsl:when test="$value = 'S'"> <xsl:param name = "modif">-2</xsl:param></xsl:when>
                            <xsl:when test="$value = 'M'"> <xsl:param name = "modif"> 0</xsl:param></xsl:when>
                            <xsl:when test="$value = 'L'"> <xsl:param name = "modif"> 2</xsl:param></xsl:when>
                            <xsl:when test="$value = 'XL'"><xsl:param name = "modif"> 4</xsl:param></xsl:when>
                            <xsl:otherwise><xsl:param name = "modif">x</xsl:param></xsl:otherwise>
                        </xsl:choose>
                            <xsl:value-of select="$modif"/>
                            <!--xsl:choose>
                                <xsl:when test="$modif = 'x'">
                                    -</td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="itemsID/item/@dex + $modif"/>
                                </xsl:otherwise>
                            </xsl:choose-->
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="sum(itemsID/item)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>	
		</xsl:if> 
		<xsl:for-each select="items">		
			<td><xsl:call-template name="items"/></td>
		</xsl:for-each> 
	</tr>
</xsl:template>

<xsl:template name="itemsID">
	<xsl:param name = "image"/>
    <xsl:for-each select="itemsID/item">	
		<td align="center">
        <xsl:value-of select="."/><br></br>
        </td>
    </xsl:for-each>
</xsl:template>

<xsl:template name="items">
	<xsl:for-each select="item">	
		<xsl:value-of select="."/><br></br>
	</xsl:for-each>
</xsl:template>

<xsl:template name="Link">
	<tr>
	<th><xsl:value-of select="Nom"/></th>
    <xsl:for-each select="Link">	
		<td><xsl:value-of select="."/></td>
    </xsl:for-each>
	<xsl:for-each select="items">		
		<td><xsl:call-template name="items"/></td>
    </xsl:for-each>
    </tr>
</xsl:template>

<xsl:template name="Attribut">
	<xsl:for-each select="Attributs/Attribut">
		<xsl:variable name="typeImg"><xsl:value-of select="type"/></xsl:variable>
		<tr>
			<td><xsl:value-of select="Nom"/></td>
			<td><img src="image/{$typeImg}.svg" alt="{$typeImg}"/></td>
			<td><xsl:value-of select="group"/></td>
			<td><xsl:value-of select="caracAlt"/></td>
			<xsl:for-each select="Description">
				<td><xsl:call-template name="BigText"/></td>
			</xsl:for-each>
			<td>
			<xsl:for-each select="items">		
				<xsl:call-template name="items"/>
			</xsl:for-each>
			</td>			
		</tr>
	</xsl:for-each>
</xsl:template>

<xsl:template name="BigText">
	<xsl:for-each select="line">
			<xsl:value-of select="."/><br></br>
	</xsl:for-each>
</xsl:template>			

</xsl:stylesheet>
