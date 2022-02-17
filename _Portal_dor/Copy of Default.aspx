<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Copy of Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="styles_home.css" rel="stylesheet" media="screen" />
<title>Rede D'Or São Luiz</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" href="responsiveslides.css">
    <link rel="stylesheet" href="themes.css">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <script src="responsiveslides.min.js"></script>
<script>
    function f_sem_cor() {
        document.getElementById("sub_menu").style.background = '#1E53A3';
    }
    function f_grupo() {
        document.getElementById("sub_menu").style.background = '#006CB7';
    }
    function f_unidades() {
        document.getElementById("sub_menu").style.background = '#006CB7';
    }
    function f_publicacoes() {
        document.getElementById("sub_menu").style.background = '#41A618';
    }
    function f_iep() {
        document.getElementById("sub_menu").style.background = '#B89112';
    }
    function f_imprensa() {
        document.getElementById("sub_menu").style.background = '#8C53A0';
    }
    function f_areaMedica() {
        document.getElementById("sub_menu").style.background = '#3596DA';
    }
</script>

    <script>
        // You can also use "$(window).load(function() {"
        $(function () {

            // Slideshow 1
            $("#slider1").responsiveSlides({
                auto: true,
                pager: true,
                nav: true,
                speed: 900,
                maxwidth: 940,
                namespace: "centered-btns"
            });

        });
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
      <div id="geral">
	<div id="saudacao">
    		<div id="saudacao_cont">
            	<p id="welcome">BEM VINDO AO <strong>REDE D'OR SÃO LUIZ</strong></p>
                <p id="language">
            	<a href="#">idioma</a>
                </p>
                <p id="contact">
                    <a href="#">Fale Conosco</a>
                </p>
            
            </div>
        	
        </div><!-- Fim da div saudacao-->
	<div id="topo">
        <h1><a href="Default.aspx"><img src="images/logo_rede_Dor_Sao_Luiz.jpg" /></a></h1>
        <div id="search">
        	<img src="images/ico_lupa.jpg" />
            <span>
            	&nbsp;&nbsp;<a href="#"><img src="images/ico_twitter.jpg"/></a>
                &nbsp;&nbsp;<a href="#"><img src="images/ico_facebook.jpg" /></a>
                &nbsp;&nbsp;<a href="#"><img src="images/ico_youtube.jpg"  /></a>
            </span>
        </div><!-- Fim da div search-->
        </div><!-- Fim da div topo-->
        <div id="geral_menu">
        <div id="menu">
        	<ul>
            	<li id="menu_ogrupo"  onmouseover="f_grupo()" onmouseout="f_sem_cor()"><a href="#">O GRUPO<br /><div class="line_menu"></div></a>
                	<div class="div_submenu">
                        <ul class="ul_sub_menu">
                            <asp:Literal ID="ltr_ogrupo" runat="server"></asp:Literal>
                        </ul>
                    </div>
                </li>
                <li id="menu_unidades" onmouseover="f_unidades()" onmouseout="f_sem_cor()"><a href="unidades.aspx">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOSSAS<br />&nbsp;&nbsp;&nbsp;&nbsp; UNIDADES<div class="line_menu"></div></a>
                </li>
                <li id="menu_publicacoes_campanhas" onmouseover="f_publicacoes()" onmouseout="f_sem_cor()"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PUBLICAÇÕES<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E CAMPANHAS<div class="line_menu"></div></a>
                	<div class="div_submenu">
                        <ul class="ul_sub_menu">
                            <li><a href="revista_sua_saude.aspx">REVISTA SUA SAÚDE</a></li>
                            <li><a href="saude_com_hospitais_rede_dor_sao_Luiz.aspx">SAÚDE COM OS HOSPITAIS REDE D'OR SÃO LUIZ</a></li>
                            <li><a href="campanhas_publicitarias.aspx">CAMPANHAS PUBLICITÁRIAS</a></li>
                            <li><a href="patrocinios.aspx">PATROCÍNIOS</a></li>
                            <li><a href="programetes_discovery.aspx">PROGRAMETES DA DISCOVERY</a></li>
                        </ul>
                    </div>
                </li>
                <li id="menu_iep" onmouseover="f_iep()" onmouseout="f_sem_cor()"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INSTITUTOS,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ESTUDOS E PESQUISAS<div class="line_menu"></div></a>
                	<div class="div_submenu">
                        <ul class="ul_sub_menu">
                            <asp:Literal ID="ltr_iep" runat="server"></asp:Literal>
                        </ul>
                    </div>
                </li>
                <li id="menu_imprensa" onmouseover="f_imprensa()" onmouseout="f_sem_cor()"><a href="#"><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IMPRENSA<div class="line_menu"></div></a>
                	<div class="div_submenu">
                        <ul class="ul_sub_menu">
                            <li><a href="nocticias.aspx">NOTÍCIAS</a></li>
                            <li><a href="releases.aspx">RELEASES</a></li>
                            <asp:Literal ID="ltr_imprensa" runat="server"></asp:Literal>
                        </ul>
                    </div>
                </li>
                <li id="menu_area_medica" onmouseover="f_areaMedica()" onmouseout="f_sem_cor()"><a href="#"><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ÁREA MÉDICA<div class="line_menu"></div></a>
                	<div class="div_submenu">
                        <ul class="ul_sub_menu">
                            <li><a href="revista_med_dor.aspx">REVISTA MED D'OR</a></li>
                            <li><a href="educacao_continuada.aspx">EDUCAÇÃO CONTINUADA</a></li>
                            <li><a href="cursos_palestras.aspx">CURSOS E PALESTRAS</a></li>
                        </ul>
                    </div>
                </li>
            </ul>            
        </div><!-- Fim da div menu-->
        <div id="sub_menu">
            	
            </div><!-- Fim da div sub_menu-->
</div><!-- Fim da div geral_menu-->


    <div id="conteudo">
    	<div id="slider">
            <!--<img src="images/slider.jpg" />-->
            <!-- Slideshow 1 -->
            <div class="rslides_container">
                <ul class="rslides" id="slider1">
                    <asp:Literal ID="ltl_slider" runat="server"></asp:Literal>
                </ul>
            </div>

        </div><!-- Fim da div slider-->
        <div id="banners">
            <div id="banner1"><asp:Label ID="lbl_banner1" runat="server" Text=""></asp:Label></div><!-- Fim da div banner1-->
            <div id="banner2"><asp:Label ID="lbl_banner2" runat="server" Text=""></asp:Label></div><!-- Fim da div banner2-->
            <div id="banner3"><asp:Label ID="lbl_banner3" runat="server" Text=""></asp:Label></div><!-- Fim da div banner3-->
            <div id="banner4"><asp:Label ID="lbl_banner4" runat="server" Text=""></asp:Label></div><!-- Fim da div banner4-->
        </div><!-- Fim da div banners-->
        <div id="news">
        	<div id="noticias">
            	<p id="top_noticias_home">ÚLTIMAS <span>NOTÍCIAS</span></p>
                <div class="leia_mais"><a href="#">LEIA + <span>NOTÍCIAS</span></a></div>
                <div id="barra_noticias_home"><p></p></div><!-- Fim da div barra_noticias_home-->
                
                <asp:DataList ID="dtl_noticias" runat="server" DataKeyField="id_conteudo">
                    <ItemTemplate>
                        <!-- -->
                <div class="noticias_home">
                	<a href='noticias.aspx?id=<%# Eval("id_conteudo") %>' class="link_noticias_home"><img src='images/noticias/<%# Eval("ds_imgDestaque") %>' width="70" height="70" /></a>
                    <p class="link_noticias_home_titulo">
                    	<a href='noticias.aspx?id=<%# Eval("id_conteudo") %>' ><strong><%# Eval("nm_titulo") %></strong></a>
                        <span class="data_noticias_home"><%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo")) %></span>
                    </p>
                    <p class="link_noticias_home_resumo">
                    	<a href='noticias.aspx?id=<%# Eval("id_conteudo") %>'><%# Eval("ds_resumo") %></a>
                    </p>
                    <div style="clear:both"></div>
                </div>
                <!-- -->
                    </ItemTemplate>
                </asp:DataList>
                <!-- 
                <div class="noticias_home">
                	<a href="#" class="link_noticias_home"><img src="images/noticias_home.jpg" /></a>
                    <p class="link_noticias_home_titulo">
                    	<a href="#" ><strong>Barra D'Or inaugurada unidade neurointensiva</strong></a>
                        <span class="data_noticias_home">09/07/2012</span>
                    </p>
                    <p class="link_noticias_home_resumo">
                    	<a href="#">Seis leitos com monitores, um boxe individualizado, equipe médica multidisciplinar.</a>
                    </p>
                    <div style="clear:both"></div>
                </div>
                 -->
                
                    
            </div><!-- Fim da div noticias-->
            
            <div id="releases">
	            <p id="top_releases_home">RELEASES</p>
                <div class="leia_mais"><a href="#"><span> LEIA +</span> MATÉRIAS NA MÍDIA</a></div>
                <div id="barra_releases_home"><p></p></div><!-- Fim da div barra_releases_home-->
            	<asp:DataList ID="dtl_releases" runat="server" DataKeyField="id_conteudo">
                    <ItemTemplate>
                        <!-- -->
                <div class="releases_home">
                    <p  class="link_releases_home_titulo">
                    	<a href='releases.aspx?id=<%# Eval("id_conteudo") %>' ><strong><%# Eval("nm_titulo") %></strong></a>
                        <span class="data_releases_home"><%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo")) %></span>
                    </p>
                    <p  class="link_releases_home_resumo">
                    	<a href='releases.aspx?id=<%# Eval("id_conteudo") %>' ><%# Eval("ds_resumo") %></a>
                    </p>
                </div>
                <!-- -->
                    </ItemTemplate>
                </asp:DataList>
                <!-- 
                <div class="releases_home">
                    <p  class="link_releases_home_titulo">
                    	<a href="#" ><strong>Diário de São Paulo</strong></a>
                        <span class="data_releases_home">09/07/2012</span>
                    </p>
                    <p  class="link_releases_home_resumo">
                    	<a href="#" >Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a>
                    </p>
                </div>
                -->
                
            </div><!-- Fim da div releases-->
            
            <div id="newsletter">
            	<div id="icone_newsletter">
                	<img src="images/ico_mail.jpg" />	
                </div>
            	<div id="titulo_newsletter">
                	<p>RECEBA NOSSA <span>NEWSLETTER</span></p>
                    <table>
                    	<tr>
                        	<td width="215"><input type="text" value="Digite seu e-mail" id="txt_newsletter" /></td>
                            <td width="88" height="29"><img src="images/btn_cadastrar.jpg" /></td>
                        </tr>
                    </table>
                     
                </div>
            </div><!-- Fim da div newsletter-->
            
        </div><!-- Fim da div news-->
        <div id="redes_sociais">
        	<div id="youtube">
            	<img src="images/youtube.jpg" />
            </div>
            
            <div id="twitter">
            	<img src="images/twitter.jpg" />
            </div>
            
            <div id="facebook">
            	<img src="images/facebook.jpg" />
            </div>
        </div><!-- Fim da div redes_sociais-->
        
    </div><!-- Fim da div conteudo-->
    <div id="rodape">
    	<div id="menu_footer">
        	<ul>
            	<li><a href="#">O Grupo</a></li>
                <li>|</li>
                <li><a href="#">Nossas Unidades</a></li>
                <li>|</li>
                <li><a href="#">Publicações e Campanhas</a></li>
                <li>|</li>
                <li><a href="#">Institutos, Estudos e Pesquisas</a></li>
                <li>|</li>
                <li><a href="#">Imprensa</a></li>
            </ul>
        </div><!-- Fim da div menu_footer-->
        <div id="copyright">
        	<p>&copy;2012 Rede D'Or São Luiz - Todos os direitos reservados</p>
        </div><!-- Fim da div copyright-->
        <div id="logo_footer">
        	<img src="images/logo_rede_Dor_Sao_Luiz_footer.jpg" />
        </div>
    </div><!-- Fim da div rodape-->
    
    
    
</div><!-- Fim da div Geral--> 
    </div>
    </form>
</body>
</html>
