<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
    <title>Simpósio Internacional de Segurança em Terapia Intensiva</title>
    <link href="styles/default.css" rel="stylesheet" media="screen" />
    <link rel="stylesheet" href="styles/colorbox.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="js/jquery.colorbox.js"></script>
		<script>
		    $(document).ready(function () {
		        //Examples of how to assign the Colorbox event to elements
		        $(".group1").colorbox({ rel: 'group1' });
		        $(".group2").colorbox({ rel: 'group2', transition: "fade" });
		        $(".group3").colorbox({ rel: 'group3', transition: "none", width: "900", height: "600" });
		        $(".group4").colorbox({ rel: 'group4', slideshow: true });
		        $(".ajax").colorbox();
		        $(".youtube").colorbox({ iframe: true, innerWidth: 640, innerHeight: 390 });
		        $(".vimeo").colorbox({ iframe: true, innerWidth: 500, innerHeight: 409 });
		        $(".iframe").colorbox({ iframe: true, width: "900", height: "600" });
		        $(".iframe2").colorbox({ iframe: true, width: "830", height: "660" });
		        $(".inline").colorbox({ inline: true, width: "50%" });
		        $(".callbacks").colorbox({
		            onOpen: function () { alert('onOpen: colorbox is about to open'); },
		            onLoad: function () { alert('onLoad: colorbox has started to load the targeted content'); },
		            onComplete: function () { alert('onComplete: colorbox has displayed the loaded content'); },
		            onCleanup: function () { alert('onCleanup: colorbox has begun the close process'); },
		            onClosed: function () { alert('onClosed: colorbox has completely closed'); }
		        });

		        $('.non-retina').colorbox({ rel: 'group5', transition: 'none' })
		        $('.retina').colorbox({ rel: 'group5', transition: 'none', retinaImage: true, retinaUrl: true });

		        //Example of preserving a JavaScript event for inline calls.
		        $("#click").click(function () {
		            $('#click').css({ "background-color": "#f00", "color": "#fff", "cursor": "inherit" }).text("Open this window again and this message will still be here.");
		            return false;
		        });
		    });
		</script>
  
</head>
<body>
    <form id="form1" runat="server">
    <div id="geral">
	<div id="content">
    	<div id="topo">
        	<h1><img src="images/Logo_Simposio.png"  alt="Simposio"/></h1>
        </div><!--Fim divTopo-->
        <div id="inscricao">
        	<p id="titulo">Venha participar do Simpósio Internacional de Segurança em Terapia Intensiva</p>
            <div id="btn_inscricao"><a href="pageModal.aspx?id=4" class="iframe2" ><img src="images/btn_inscricao.png" /></a></div>
            <p id="p_data"><img src="images/Calendar.png" id="ico_calendar" /><span id="data_simposio"><strong>22 e 23</strong> de novembro</span></p>
            <p id="p_local"><img src="images/maps.png" id="ico_maps" /><span id="local_simposio"><strong>Hotel Mercure</strong><br />
            	Av. Industrial 88 - Bairro Jardim - Santo André - SP</span></p>
            <div class="clear"></div>
        </div><!--Fim divInscricao-->
        <div id="material_apoio">
        	<h2>Material de Apoio
            </h2>


            <asp:DataList ID="DataList1" runat="server" DataSourceID="dsPaginas" 
                RepeatDirection="Horizontal" Width="950px" RepeatColumns="3">
                <ItemTemplate>

                <div class="boxMaterial">
            	<img src="images/<%# Eval("ds_arquivo") %>" />
                <h3><%# Eval("nm_pagina") %></h3>
                <p><%# Eval("ds_resumo") %></p>
                <a href="pageModal.aspx?id=<%# Eval("id_pagina") %>" class='iframe'  style="color:<%# Eval("estilo") %>">Leia mais</a>
            </div><!--Fim divBoxMaterial-->

                </ItemTemplate>
                </asp:DataList>
            
            <asp:SqlDataSource ID="dsPaginas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbSimposioConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:dbSimposioConnectionString.ProviderName %>" 
                
                
                SelectCommand="SELECT tb_paginas.id_pagina, tb_paginas.nm_pagina, tb_icones.ds_arquivo, IIF([tb_paginas.id_icone] = 1, '#cc6666', IIF([tb_paginas.id_icone] = 2, '#6699ff', '#fecc66')) AS estilo, tb_paginas.ds_resumo FROM (tb_paginas LEFT OUTER JOIN tb_icones ON tb_icones.id_icone = tb_paginas.id_icone)">
            </asp:SqlDataSource>
            
            <div class="clear"></div>
        </div><!-- fim divMateria_apoio-->
    </div><!--Fim divContent-->
    <div id="footerContent">
    	<div id="patrocionio">
        	<img src="images/patrocinio.jpg" />
            <img src="images/apoio.jpg" />
            <img src="images/organizacao.jpg" />
        </div><!--Fim DivPatrocinio-->
        <div id="textFooter">
        	<p id="presidente"><strong>Presidente</strong><br />João Pantoja</p>
            <p id="comissao"><strong>Comissão Organizadora</strong><br />
            Haggeas Fernandes, Bruno Franco Mazza, Jorge Salluh, Elisabete Cazzolato, Roberto Ramos, Priscila Rosseto,Luiz Antônio Della Negra e Maria Lucia Ferraz</p>
        </div><!--Fim divTextFooter-->
        <div id="copyright">
        	<p>©2013 - Todos os direitos reservados</p>
        </div>
    </div><!--Fim divFooterContent-->
</div><!--fim divGeral-->
    </form>
</body>
</html>
