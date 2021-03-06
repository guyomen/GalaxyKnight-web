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
    .tooltip {
        position: relative;
        display: inline-block;
        border-bottom: 1px dotted black;
    }

    .tooltip .tooltiptext {
        visibility: hidden;
        width: 250px;
        background-color: #555;
        color: #fff;
        text-align: center;
        border-radius: 6px;
        padding: 5px 0;
        position: absolute;
        z-index: 1;
        bottom: 125%;
        left: 50%;
        margin-left: -60px;
        opacity: 0;
        transition: opacity 0.3s;
    }

    .tooltip .tooltiptext::after {
        content: "";
        position: absolute;
        top: 100%;
        left: 50%;
        margin-left: -5px;
        border-width: 5px;
        border-style: solid;
        border-color: #555 transparent transparent transparent;
    }

    .tooltip:hover .tooltiptext {
        visibility: visible;
        opacity: 1;
    }
    </style>
  </head>
  <body>
      <!-- Navbar -->
    <div class="w3-top">
      <div class="w3-bar w3-theme w3-top w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
        <a href="#" class="w3-bar-item w3-button w3-theme-l1">GK</a>
        <a href="GkRace.xml"    class="w3-bar-item w3-button w3-hover-white">Les Races</a>
        <a href="GkCiv.xml"     class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">Les Civilisations</a>
        <a href="GkEthnie.xml"  class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">Les Ethnies</a>
        <a href="GkCore.xml"    class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">Les caracteristiques</a>
        <a href="GkRegle.xml"   class="w3-bar-item w3-button w3-hide-small w3-hover-white">Les Regles</a>
        <a href="GkCombat.xml"  class="w3-bar-item w3-button w3-hide-small w3-hover-white">Les Combats</a>
        <a href="GkBeast.xml"   class="w3-bar-item w3-button w3-hide-small w3-hover-white">Les Bebetes</a>
        <a href="GkWeapon.xml"  class="w3-bar-item w3-button w3-hide-small w3-hover-white">Pan-pan et Coupe-coupe</a>
        <a href="GkFiches.html" class="w3-bar-item w3-button w3-hover-white">Fiches</a>
       </div>
    </div>
  
    <!-- Sidebar -->
    <nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-hide-l w3-theme-l5 w3-animate-left" id="mySidebar">
        <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="Close Menu">
            <i class="fa fa-remove"></i>
        </a>
        <h4 class="w3-bar-item"><b>GK</b></h4>
        <a href="GkRace.xml"   class="w3-bar-item w3-button w3-hover-black">Les Races</a>
        <a href="GkCiv.xml"    class="w3-bar-item w3-button w3-hover-black">Les Civilisations</a>
        <a href="GkEthnie.xml" class="w3-bar-item w3-button w3-hover-black">Les Ethnies</a>
        <a href="GkCore.xml"   class="w3-bar-item w3-button w3-hover-black">Les caracteristiques</a>
        <a href="GkRegle.xml"  class="w3-bar-item w3-button w3-hover-black">Les Regles</a>
        <a href="GkCombat.xml" class="w3-bar-item w3-button w3-hover-black">Les Combats</a>
        <a href="GkBeast.xml"  class="w3-bar-item w3-button w3-hover-black">Les Bebetes</a>
        <a href="GkWeapon.xml" class="w3-bar-item w3-button w3-hover-black">Pan-pan et Coupe-coupe</a>
        <a href="GkFiches.xml" class="w3-bar-item w3-button w3-hover-black">Fiches</a>
    </nav>

    <!-- Overlay effect when opening sidebar on small screens -->
    <div class="w3-overlay" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

    <!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
    <div class="w3-main" style="margin-left:250px">
        <br></br>
        <br></br>
        <xsl:apply-templates/>
    </div>
    <script>
        includeHTML();

        // Get the Sidebar
        var mySidebar = document.getElementById("mySidebar");

        // Get the DIV with overlay effect
        var overlayBg = document.getElementById("myOverlay");

        // Toggle between showing and hiding the sidebar, and add overlay effect
        function w3_open() {
            if (mySidebar.style.display === 'block') {
                mySidebar.style.display = 'none';
                overlayBg.style.display = "none";
            } else {
                mySidebar.style.display = 'block';
                overlayBg.style.display = "block";
            }
        }

        // Close the sidebar with the close button
        function w3_close() {
            mySidebar.style.display = "none";
            overlayBg.style.display = "none";
        }

    </script>
  </body>
</html>
</xsl:template>

<!-- Generate Race list  -->
<xsl:template match="GkRace">
 <div class="w3-container">
  <H2>Races</H2>
  <xsl:variable name="nbOfItem"><xsl:value-of select="itemsInfo/itemsList/@nb"/></xsl:variable>
  <xsl:variable name="nbOfItemPlus"><xsl:value-of select="$nbOfItem+1"/></xsl:variable>
  <table class="w3-table-all w3-hoverable">
    <tr> 
        <th rowspan="2">Race</th>
        <th rowspan="2">Description race</th>
        <th rowspan="2">bonus a la création</th>
        <th colspan="{$nbOfItemPlus}"><xsl:value-of select="itemsInfo/Nom"/></th>
        <th rowspan="2"><xsl:value-of select="Races/Race/items[1]/@name"/></th>
        <th rowspan="2"><xsl:value-of select="Races/Race/items[2]/@name"/></th>
    </tr>
    <tr>
    <xsl:for-each select="itemsInfo/itemsList/item">    
        <th width="30"><xsl:value-of select="@id"/></th>
    </xsl:for-each>
        <th width="30">Total</th>
    </tr>
    <xsl:for-each select="Races/Race">
        <xsl:sort select="@id"/>
        <xsl:call-template name="Object">
            <xsl:with-param name="image">cube</xsl:with-param>
        </xsl:call-template>
    </xsl:for-each>
  </table>
 </div>
</xsl:template>

<!-- Generate Civ list  -->
<xsl:template match="GkCiv">
 <div class="w3-container">
  <H2>Civilisations</H2>
  <xsl:variable name="nbOfItem"><xsl:value-of select="itemsInfo/itemsList/@nb"/></xsl:variable>
  <xsl:variable name="nbOfItemPlus"><xsl:value-of select="$nbOfItem+1"/></xsl:variable>
  <table class="w3-table-all w3-hoverable">
    <tr> 
        <th rowspan="2">Civilisation</th>
        <th rowspan="2">Informations générales</th>
        <th rowspan="2">Information citoyen</th>
        <th colspan="{$nbOfItemPlus}"><xsl:value-of select="itemsInfo/Nom"/></th>
        <th rowspan="2"><xsl:value-of select="Civilisations/Civilisation/items/@name"/></th>
    </tr>
    <tr>
    <xsl:for-each select="itemsInfo/itemsList/item">    
        <th width="30"><xsl:value-of select="@id"/></th>
    </xsl:for-each>
        <th width="30">Total</th>
    </tr>
    <xsl:for-each select="Civilisations/Civilisation">
        <xsl:sort select="@id"/>
        <xsl:call-template name="Object">
            <xsl:with-param name="image">box</xsl:with-param>
        </xsl:call-template>
    </xsl:for-each>
  </table>
 </div>
</xsl:template>

<!-- Generate Ethnie list  -->
<xsl:template match="GkEthnie">
 <div class="w3-container">
  <H2>Ethnies</H2>
  <table class="w3-table-all w3-hoverable">
    <tr> 
        <th>Ethnie</th>
        <th>Race</th>
        <th>Civilisation</th>
        <th>Attribut</th>
    </tr>
    <xsl:for-each select="Ethnies/Ethnie">
        <xsl:sort select="@id"/>
        <xsl:call-template name="Link"/>
    </xsl:for-each>
  </table>
 </div>
</xsl:template>

<!-- Generate Core list  -->
<xsl:template match="GkCore">
 <div class="w3-container">
  <H2>Caracteristiques personnage</H2>
  <xsl:variable name="nbOfItem"><xsl:value-of select="itemsInfo/itemsList/@nb"/></xsl:variable>
  <table class="w3-table-all w3-hoverable">
    <tr> 
        <th rowspan="2">Caractéristiques</th>
        <th rowspan="2">Description</th>
        <th colspan="{$nbOfItem}"><xsl:value-of select="itemsInfo/Nom"/></th>
    </tr>
    <tr>
    <xsl:for-each select="itemsInfo/itemsList/item">    
        <th><xsl:value-of select="@id"/></th>
    </xsl:for-each>    
    </tr>
    <xsl:for-each select="Caracteristiques/Caracteristique">
        <xsl:call-template name="Object"/>
    </xsl:for-each>
  </table>
  <H2>Competences personnage</H2>
  <table class="w3-table-all w3-hoverable">
    <xsl:for-each select="Competences/Competence">    
        <tr>
            <th colspan="4"><xsl:value-of select="Nom"/></th>
        </tr>
        <tr>
            <th>Info</th>
            <td colspan="3"><xsl:value-of select="Description"/></td>
        </tr>
        <tr>
            <th>Attribut</th>
            <th>Type</th>
            <th>Groupe</th>
            <th>Carac Alt</th>
            <th>Info</th>
            <th>Connaissances</th>
        </tr>
        <xsl:call-template name="Attribut"/>
        <tr>
            <br></br>
        </tr>
    </xsl:for-each>
  </table>
 </div>
</xsl:template>

<!-- Generate Core list  -->
<xsl:template match="GkRegle">
 <div class="w3-container">
  <H2>Creation personnage</H2>
  <table class="w3-table-all w3-hoverable">
    <tr> 
        <th rowspan="1">Etape</th>
        <th rowspan="1">Description</th>    
        <th rowspan="1">Explication</th>        
    </tr>
    <xsl:for-each select="Creation/Regle">
        <xsl:call-template name="Object"/>
    </xsl:for-each>
  </table>
    <H2>Experience</H2>
  <table class="w3-table-all w3-hoverable">
    <tr> 
        <th rowspan="1">Etape</th>
        <th rowspan="1">Description</th>    
        <th rowspan="1">Explication</th>        
    </tr>
    <xsl:for-each select="Experience/Regle">
        <xsl:call-template name="Object"/>
    </xsl:for-each>
  </table>
    <H2>Regle de jeu</H2>
  <table class="w3-table-all w3-hoverable">
    <tr> 
        <th rowspan="1">Nom</th>
        <th rowspan="1">Description</th>    
        <th rowspan="1">Explication</th>        
    </tr>
    <xsl:for-each select="Jeu/Regle">
        <xsl:call-template name="Object"/>
    </xsl:for-each>
  </table>
 </div>
</xsl:template>

<!-- Generate combat -->
<xsl:template match="GkCombat">
 <div class="w3-container">
  <H2>Combat</H2>
  <table class="w3-table-all w3-hoverable">
    <tr> 
        <th rowspan="1">Etape</th>
        <th rowspan="1">Description</th>    
        <th rowspan="1">Explication</th>        
    </tr>
    <xsl:for-each select="Combat/Regle">
        <xsl:call-template name="Object"/>
    </xsl:for-each>
  </table>
    <H2>Autre</H2>
  <table class="w3-table-all w3-hoverable">
    <tr> 
        <th rowspan="1">Etape</th>
        <th rowspan="1">Description</th>    
        <th rowspan="1">Explication</th>        
    </tr>
    <xsl:for-each select="Autre/Regle">
        <xsl:call-template name="Object"/>
    </xsl:for-each>
  </table>
 </div>
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
            <th colspan="2">Bonus/Malus</th>
        </tr>
        <tr>
            <xsl:for-each select="itemsInfo/itemsList/item">    
                <th width="30"><xsl:value-of select="."/></th>
            </xsl:for-each>
            <th width="30">Distance</th>
            <th><xsl:value-of select="Beasts/Beast/items[1]/@name"/></th>
            <th><xsl:value-of select="Beasts/Beast/items[2]/@name"/></th>
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

<!-- Generate weapon list  -->
<xsl:template match="GkWeapon">
 <div class="w3-container">
  <H2>Bestiaire</H2>
  <xsl:variable name="nbOfItem"><xsl:value-of select="itemsInfo/itemsList/@nb"/></xsl:variable>
  <table class="w3-table-all w3-hoverable">
    <thead>
        <tr> 
            <th rowspan="2">Nom</th>
            <th rowspan="2">Informations générales</th>
            <th rowspan="2">Information combat</th>
            <th colspan="{$nbOfItem}"><xsl:value-of select="itemsInfo/Nom"/></th>
            <th rowspan="2">effet(s)</th>
            <th rowspan="2"><xsl:value-of select="Weapons/Weapon/items/@name"/></th>
        </tr>
        <tr>
        <xsl:for-each select="itemsInfo/itemsList/item">    
            <th width="30"><xsl:value-of select="."/></th>
        </xsl:for-each>
        </tr>
    </thead>
    <tbody>
        <xsl:for-each select="Weapons/Weapon">
            <xsl:sort select="@id"/>
            <xsl:call-template name="Object">
            </xsl:call-template>
        </xsl:for-each>
    </tbody>
  </table>
 </div>
</xsl:template>

<!-- generate fiche -->
<xsl:template match="GkFiche">
<div w3-include-html="GkFiches.html"></div>
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
                <xsl:value-of select="sum(itemsID/item)"/>
            </td>            
        </xsl:if> 
        <xsl:if test="itemsWeapon">
            <xsl:call-template name="itemsWeapon">                
            </xsl:call-template>            
        </xsl:if> 
        <xsl:if test="itemsEffects">
            <xsl:call-template name="itemsEffects">                
            </xsl:call-template>            
        </xsl:if> 
        <xsl:if test="itemsBattle">
            <xsl:call-template name="itemsBattle">                
                <xsl:with-param name="image" select="$image"/>
            </xsl:call-template>
            <td align="center">
                <xsl:choose>
                    <xsl:when test="itemsBattle/item[5]/. = 'XS'"><xsl:value-of select="itemsBattle/item[2]/. + 4"/></xsl:when>
                    <xsl:when test="itemsBattle/item[5]/. = 'S'"> <xsl:value-of select="itemsBattle/item[2]/. + 2"/></xsl:when>
                    <xsl:when test="itemsBattle/item[5]/. = 'M'"> <xsl:value-of select="itemsBattle/item[2]/. + 0"/></xsl:when>
                    <xsl:when test="itemsBattle/item[5]/. = 'L'"> <xsl:value-of select="itemsBattle/item[2]/. - 2"/></xsl:when>
                    <xsl:when test="itemsBattle/item[5]/. = 'XL'"><xsl:value-of select="itemsBattle/item[2]/. - 4"/></xsl:when>
                    <xsl:otherwise>---</xsl:otherwise>
                </xsl:choose> 
            </td>            
        </xsl:if> 
        <xsl:for-each select="items">        
            <td><xsl:call-template name="items"/></td>
        </xsl:for-each> 
    </tr>
</xsl:template>

<xsl:template name="Cube">
    <xsl:param name = "value"/>
    <xsl:param name = "realValue"/>
    <xsl:value-of select="$realValue"/><br></br>
    <xsl:choose>
        <xsl:when test="$value = -3">
            <img src="image/redCube.svg" width="26" alt="R"/><br></br>
            <img src="image/redCube.svg" width="26" alt="R"/><br></br>
            <img src="image/redCube.svg" width="26" alt="R"/><br></br>
        </xsl:when>    
        <xsl:when test="$value = -2">
            <img src="image/redCube.svg" width="26" alt="R"/><br></br>
            <img src="image/redCube.svg" width="26" alt="R"/><br></br>
        </xsl:when>                        
        <xsl:when test="$value = -1">
            <img src="image/redCube.svg" width="26" alt="R"/><br></br>
            <img src="image/yellowCube.svg" width="26" alt="Y"/><br></br>
        </xsl:when>                        
        <xsl:when test="$value = 0">
            <img src="image/yellowCube.svg" width="26" alt="Y"/><br></br>
            <img src="image/yellowCube.svg" width="26" alt="Y"/><br></br>
        </xsl:when>                    
        <xsl:when test="$value = 1">
            <img src="image/greenCube.svg" width="26" alt="G"/><br></br>
            <img src="image/yellowCube.svg" width="26" alt="Y"/><br></br>
        </xsl:when>                
        <xsl:when test="$value = 2">
            <img src="image/greenCube.svg" width="26" alt="G"/><br></br>
            <img src="image/greenCube.svg" width="26" alt="G"/><br></br>
        </xsl:when>            
        <xsl:when test="$value = 3">
            <img src="image/greenCube.svg" width="26" alt="G"/><br></br>
            <img src="image/greenCube.svg" width="26" alt="G"/><br></br>
            <img src="image/greenCube.svg" width="26" alt="G"/><br></br>
        </xsl:when>
        <xsl:otherwise>  
            <img src="image/greyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/greyCube.svg" width="26" alt=" "/><br></br>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="Box">
    <xsl:param name = "value"/>
    <xsl:value-of select="$value"/><br></br>
    <xsl:choose>
        <xsl:when test="$value = 1">
            <img src="image/greyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/greyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/greyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/greyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/redCube.svg" width="26" alt="B"/><br></br>
        </xsl:when>    
        <xsl:when test="$value = 2">
            <img src="image/greyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/greyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/greyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/redCube.svg" width="26" alt="B"/><br></br>
            <img src="image/redCube.svg" width="26" alt="B"/><br></br>
        </xsl:when>                        
        <xsl:when test="$value = 3">
            <img src="image/greyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/greyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/yellowCube.svg" width="26" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="26" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="26" alt="B"/><br></br>
        </xsl:when>                        
        <xsl:when test="$value = 4">
            <img src="image/greyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/greenCube.svg" width="26" alt="B"/><br></br>
            <img src="image/greenCube.svg" width="26" alt="B"/><br></br>
            <img src="image/greenCube.svg" width="26" alt="B"/><br></br>
            <img src="image/greenCube.svg" width="26" alt="B"/><br></br>
        </xsl:when>                    
        <xsl:when test="$value = 5">
            <img src="image/blueCube.svg" width="26" alt="B"/><br></br>
            <img src="image/blueCube.svg" width="26" alt="B"/><br></br>
            <img src="image/blueCube.svg" width="26" alt="B"/><br></br>
            <img src="image/blueCube.svg" width="26" alt="B"/><br></br>
            <img src="image/blueCube.svg" width="26" alt="B"/><br></br>
        </xsl:when>        
        <xsl:otherwise>        
            <img src="image/emptyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/emptyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/emptyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/emptyCube.svg" width="26" alt=" "/><br></br>
            <img src="image/emptyCube.svg" width="26" alt=" "/><br></br>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="Melee">
    <xsl:param name = "value"/>
    <xsl:value-of select="$value"/><br></br>
    <xsl:choose>
        <xsl:when test="$value = 0">
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
        </xsl:when>
        <xsl:when test="$value = 1">
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>
        <xsl:when test="$value = 2">
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>
        <xsl:when test="$value = 3">
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>
        <xsl:when test="$value = 4">
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>
        <xsl:when test="$value = 5">
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greenCube.svg"  width="13" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>
        <xsl:when test="$value = 6">
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greenCube.svg"  width="13" alt="B"/><br></br>
            <img src="image/greenCube.svg"  width="13" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>
        <xsl:when test="$value = 7">
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/blueCube.svg"   width="13" alt="B"/><br></br>
            <img src="image/greenCube.svg"  width="13" alt="B"/><br></br>
            <img src="image/greenCube.svg"  width="13" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>
        <xsl:when test="$value = 8">
            <img src="image/blueCube.svg"   width="13" alt="B"/><br></br>
            <img src="image/blueCube.svg"   width="13" alt="B"/><br></br>
            <img src="image/greenCube.svg"  width="13" alt="B"/><br></br>
            <img src="image/greenCube.svg"  width="13" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>    
        <xsl:when test="$value = 'XS'">
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>        
        <xsl:when test="$value = 'S'">
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>        
        <xsl:when test="$value = 'M'">
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>        
        <xsl:when test="$value = 'L'">
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greenCube.svg"  width="13" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>        
        <xsl:when test="$value = 'XL'">
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greenCube.svg"  width="13" alt="B"/><br></br>
            <img src="image/greenCube.svg"  width="13" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>    
        <xsl:when test="$value = 'G'">
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/greyCube.svg"   width="13" alt=" "/><br></br>
            <img src="image/blueCube.svg"   width="13" alt="B"/><br></br>
            <img src="image/greenCube.svg"  width="13" alt="B"/><br></br>
            <img src="image/greenCube.svg"  width="13" alt="B"/><br></br>
            <img src="image/yellowCube.svg" width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
            <img src="image/redCube.svg"    width="13" alt="B"/><br></br>
        </xsl:when>
        <xsl:otherwise>        
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
            <img src="image/emptyCube.svg"  width="13" alt=" "/><br></br>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="Info">
    <xsl:param name = "value"/>
    <xsl:value-of select="$value"/><br></br>
    <xsl:choose>
        <xsl:when test="$value = 'Brulure'">
            <div class="tooltip">
                <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/fire_1f525.png" width="26"/>
                <span class="tooltiptext">voir le sort Chaleur pour plus d'info</span>
            </div>
        </xsl:when>
        <xsl:when test="$value = 'Melee'">
            <div class="tooltip">
                <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/crossed-swords_2694.png" width="26"/>
                <span class="tooltiptext">le corps à corps: la sueur et le sang,<br></br>ajoute la force au bonus de degat (sauf cas speciaux)</span>
            </div>
        </xsl:when>
        <xsl:when test="$value = 'Distance'">
            <div class="tooltip">
                <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/bow-and-arrow_1f3f9.png" width="26"/>
                <span class="tooltiptext">le tir: loin à l'abri,<br></br>mais pas de bonus de degat (sauf cas speciaux)</span>
            </div>
        </xsl:when>
        <xsl:when test="$value = 'Tranchant'">
            <div class="tooltip">
                <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/hocho_1f52a.png" width="26"/>
                <span class="tooltiptext">-1 a l'armure</span>
            </div>
        </xsl:when>
        <xsl:when test="$value = 'Vibrant'">
            <div class="tooltip">
                <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/speaker-with-three-sound-waves_1f50a.png" width="26"/>
                <span class="tooltiptext">annule l'armure</span>
            </div>
        </xsl:when>
        <xsl:when test="$value = 'Percant'">
            <div class="tooltip">
                <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/pushpin_1f4cc.png" width="26"/>
                <span class="tooltiptext">-1 a l'armure</span>
            </div>
        </xsl:when>
        <xsl:when test="$value = 'Poison'">
            <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/nauseated-face_1f922.png" width="26"/>
        </xsl:when>        
        <xsl:when test="$value = 'legere'">
            <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/dizzy-face_1f635.png" width="26"/>
        </xsl:when>
        <xsl:when test="$value = 'grave'">
            <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/skull_1f480.png" width="26"/>
        </xsl:when>
        <xsl:when test="$value = 'Zone'">
            <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/cyclone_1f300.png" width="26"/>
        </xsl:when>
        <xsl:when test="$value = 'Rayon'">
            <div class="tooltip">
                <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/electric-torch_1f526.png" width="26"/>
                <span class="tooltiptext">les rayons infligent des degats bonus supplementaire sur une cible unique<br></br>(contrairement au autre armes a distance qui sont a degat fixe)</span>
            </div>
        </xsl:when>
        <xsl:when test="$value = 'Merdique'">
            <div class="tooltip">
                <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/pile-of-poo_1f4a9.png" width="26"/>
                <span class="tooltiptext">les qualités bleu sont consideré comme rouge</span>
            </div>
        </xsl:when>
        <xsl:when test="$value = 'Lourd'">
            <div class="tooltip">
                <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/anchor_2693.png" width="26"/>
                <span class="tooltiptext">+1 energie a l'utilisation<br></br>DEX ne peux etre utilisé</span>
            </div>
        </xsl:when>
        <xsl:when test="$value = 'Bruyant'">
            <div class="tooltip">
                <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/microsoft/209/bell_1f514.png" width="26"/>
                <span class="tooltiptext">-5 en discretion</span>
            </div>
        </xsl:when>        
        <xsl:otherwise>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>



<xsl:template name="itemsID">
    <xsl:param name = "image"/>
    <xsl:for-each select="itemsID/item">    
        <td align="center">
            <xsl:choose>
                <xsl:when test="$image = 'cube'">
                    <xsl:call-template name="Cube">                
                        <xsl:with-param name="value" select=". - 3"/>
                        <xsl:with-param name="realValue" select="."/>
                    </xsl:call-template>                        
                </xsl:when>
                <xsl:when test="$image = 'box'">
                    <xsl:call-template name="Box">                
                        <xsl:with-param name="value" select="."/>
                    </xsl:call-template>                        
                </xsl:when>
                <xsl:otherwise>            
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </td>
    </xsl:for-each>
</xsl:template>

<xsl:template name="itemsWeapon">
    <xsl:for-each select="itemsWeapon/item">    
        <td align="center">
            <xsl:call-template name="Cube">                
                <xsl:with-param name="value" select="."/>
                <xsl:with-param name="realValue" select="."/>
            </xsl:call-template>                            
        </td>
    </xsl:for-each>
    <xsl:for-each select="itemsWeapon/info">    
        <td align="center">
            <xsl:call-template name="Info">                
                <xsl:with-param name="value" select="."/>
            </xsl:call-template>                         
        </td>
    </xsl:for-each>
</xsl:template>

<xsl:template name="itemsEffects">
        <td align="center">
    <xsl:for-each select="itemsEffects/item">   
            <xsl:call-template name="Info">                
                <xsl:with-param name="value" select="."/>
            </xsl:call-template> 
            <br></br>          
    </xsl:for-each>              
        </td>
</xsl:template>

<xsl:template name="itemsBattle">
    <xsl:for-each select="itemsBattle/item">    
        <td align="center">
            <xsl:call-template name="Melee">                
                <xsl:with-param name="value" select="."/>
            </xsl:call-template>                        
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
