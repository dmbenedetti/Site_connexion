<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="styles_home.css" rel="stylesheet" media="screen" />
    <title>Rede D'Or São Luiz</title>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="responsiveslides.css">
    <link rel="stylesheet" href="css/menu.css">

    <link rel="stylesheet" href="themes.css">
    <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
    <script src="responsiveslides.min.js"></script>
    <link rel="stylesheet" href="css/common.css">
    <script type='text/javascript' src='Scripts/menu_jquery.js'></script>
    <script type='text/javascript' src='Scripts/Common.js'></script>
    <script>


        var timeout = 1000;
        var closetimer = 0;
        var ddmenuitem = 0;

        function jsddm_timer(timer) {
            //if (ddmenuitem == 1) {
            ddmenuitem = 0;
            closetimer = window.setTimeout(f_sem_cor, timer);
            //}
        }

        function jsddm_canceltimer() {
            ddmenuitem = 2;
            if (closetimer) {
                window.clearTimeout(closetimer);
                closetimer = null;
            }
        }

        function f_sem_cor() {
            if (ddmenuitem == 2)
                return;

            document.getElementById("sub_menu").style.background = '#3596DA';
            document.getElementById("menu_ogrupo").style.background = "rgb(248, 248, 248)"
            document.getElementById("agrupo").style.color = "#006CB7";
            document.getElementById("menu_ogrupo").style.color = "#006CB7";
            document.getElementById("Grupo").style.display = "none";
            document.getElementById("menu_unidades").style.background = "rgb(248, 248, 248)"
            document.getElementById("aunidade").style.color = "#006CB7";
            document.getElementById("menu_unidades").style.color = "#006CB7";
            document.getElementById("Unidades").style.display = "none";
            document.getElementById("menu_publicacoes_campanhas").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_publicacoes_campanhas").style.color = "#006CB7";
            document.getElementById("asaude").style.color = "#006CB7";
            document.getElementById("Saude").style.display = "none";
            document.getElementById("menu_iep").style.background = "rgb(248, 248, 248)"
            document.getElementById("aiep").style.color = "#006CB7";
            document.getElementById("menu_iep").style.color = "#006CB7";
            document.getElementById("IEP").style.display = "none";
            document.getElementById("menu_imprensa").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_imprensa").style.color = "#006CB7";
            document.getElementById("aimprensa").style.color = "#006CB7";
            document.getElementById("Imprensa").style.display = "none";
            document.getElementById("menu_area_medica").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_area_medica").style.color = "#006CB7";
            document.getElementById("amedica").style.color = "#006CB7";
            document.getElementById("AreaMedica").style.display = "none";
            ddmenuitem = 0;
        }
        function f_grupo() {
            jsddm_canceltimer();
            document.getElementById("sub_menu").style.background = '#006CB7';
            document.getElementById("menu_ogrupo").style.background = "#006CB7"
            document.getElementById("menu_ogrupo").style.color = "#FFF";
            document.getElementById("agrupo").style.color = "#FFF";
            document.getElementById("Grupo").style.display = "block";
            document.getElementById("menu_unidades").style.background = "rgb(248, 248, 248)"
            document.getElementById("aunidade").style.color = "#006CB7";
            document.getElementById("menu_unidades").style.color = "#006CB7";
            document.getElementById("Unidades").style.display = "none";
            document.getElementById("menu_publicacoes_campanhas").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_publicacoes_campanhas").style.color = "#006CB7";
            document.getElementById("Saude").style.display = "none";
            document.getElementById("asaude").style.color = "#006CB7";
            document.getElementById("menu_iep").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_iep").style.color = "#006CB7";
            document.getElementById("IEP").style.display = "none";
            document.getElementById("aiep").style.color = "#006CB7";
            document.getElementById("menu_imprensa").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_imprensa").style.color = "#006CB7";
            document.getElementById("Imprensa").style.display = "none";
            document.getElementById("aimprensa").style.color = "#006CB7";
            document.getElementById("menu_area_medica").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_area_medica").style.color = "#006CB7";
            document.getElementById("amedica").style.color = "#006CB7";
            document.getElementById("AreaMedica").style.display = "none";
        }
        function f_unidades() {
            jsddm_canceltimer();
            document.getElementById("sub_menu").style.background = '#006CB7';
            document.getElementById("menu_ogrupo").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_ogrupo").style.color = "#006CB7";
            document.getElementById("agrupo").style.color = "#006CB7";
            document.getElementById("Grupo").style.display = "none";
            document.getElementById("menu_unidades").style.background = "#006CB7"
            document.getElementById("aunidade").style.color = "#FFF";
            document.getElementById("menu_unidades").style.color = "#FFF";
            document.getElementById("Unidades").style.display = "block";
            document.getElementById("menu_publicacoes_campanhas").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_publicacoes_campanhas").style.color = "#006CB7";
            document.getElementById("asaude").style.color = "#006CB7";
            document.getElementById("Saude").style.display = "none";
            document.getElementById("menu_iep").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_iep").style.color = "#006CB7";
            document.getElementById("IEP").style.display = "none";
            document.getElementById("aiep").style.color = "#006CB7";
            document.getElementById("menu_imprensa").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_imprensa").style.color = "#006CB7";
            document.getElementById("aimprensa").style.color = "#006CB7";
            document.getElementById("Imprensa").style.display = "none";
            document.getElementById("menu_area_medica").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_area_medica").style.color = "#006CB7";
            document.getElementById("AreaMedica").style.display = "none";
            document.getElementById("amedica").style.color = "#006CB7";
        }
        function f_publicacoes() {
            jsddm_canceltimer();
            document.getElementById("sub_menu").style.background = '#41A618';
            document.getElementById("menu_ogrupo").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_ogrupo").style.color = "#006CB7";
            document.getElementById("agrupo").style.color = "#006CB7";
            document.getElementById("Grupo").style.display = "none";
            document.getElementById("aunidade").style.color = "#006CB7";
            document.getElementById("menu_unidades").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_unidades").style.color = "#006CB7";
            document.getElementById("Unidades").style.display = "none";
            document.getElementById("menu_publicacoes_campanhas").style.background = "#41A618"
            document.getElementById("menu_publicacoes_campanhas").style.color = "#FFF";
            document.getElementById("asaude").style.color = "#FFF";
            document.getElementById("Saude").style.display = "block";
            document.getElementById("menu_iep").style.background = "rgb(248, 248, 248)"
            document.getElementById("aiep").style.color = "#006CB7";
            document.getElementById("menu_iep").style.color = "#006CB7";
            document.getElementById("IEP").style.display = "none";
            document.getElementById("menu_imprensa").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_imprensa").style.color = "#006CB7";
            document.getElementById("Imprensa").style.display = "none";
            document.getElementById("aimprensa").style.color = "#006CB7";
            document.getElementById("menu_area_medica").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_area_medica").style.color = "#006CB7";
            document.getElementById("AreaMedica").style.display = "none";
            document.getElementById("amedica").style.color = "#006CB7";
        }
        function f_iep() {
            jsddm_canceltimer();
            document.getElementById("sub_menu").style.background = '#B89112';
            document.getElementById("menu_ogrupo").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_ogrupo").style.color = "#006CB7";
            document.getElementById("agrupo").style.color = "#006CB7";
            document.getElementById("Grupo").style.display = "none";
            document.getElementById("menu_unidades").style.background = "rgb(248, 248, 248)"
            document.getElementById("aunidade").style.color = "#006CB7";
            document.getElementById("menu_unidades").style.color = "#006CB7";
            document.getElementById("Unidades").style.display = "none";
            document.getElementById("menu_publicacoes_campanhas").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_publicacoes_campanhas").style.color = "#006CB7";
            document.getElementById("asaude").style.color = "#006CB7";
            document.getElementById("Saude").style.display = "none";
            document.getElementById("menu_iep").style.background = "#B89112"
            document.getElementById("aiep").style.color = "#FFF";
            document.getElementById("menu_iep").style.color = "#FFF";
            document.getElementById("IEP").style.display = "block";
            document.getElementById("menu_imprensa").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_imprensa").style.color = "#006CB7";
            document.getElementById("aimprensa").style.color = "#006CB7";
            document.getElementById("Imprensa").style.display = "none";
            document.getElementById("menu_area_medica").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_area_medica").style.color = "#006CB7";
            document.getElementById("AreaMedica").style.display = "none";
            document.getElementById("amedica").style.color = "#006CB7";
        }
        function f_imprensa() {
            jsddm_canceltimer();
            document.getElementById("sub_menu").style.background = '#8C53A0';
            document.getElementById("menu_ogrupo").style.background = "rgb(248, 248, 248)"
            document.getElementById("agrupo").style.color = "#006CB7";
            document.getElementById("menu_ogrupo").style.color = "#006CB7";
            document.getElementById("Grupo").style.display = "none";
            document.getElementById("menu_unidades").style.background = "rgb(248, 248, 248)"
            document.getElementById("aunidade").style.color = "#006CB7";
            document.getElementById("menu_unidades").style.color = "#006CB7";
            document.getElementById("Unidades").style.display = "none";
            document.getElementById("menu_publicacoes_campanhas").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_publicacoes_campanhas").style.color = "#006CB7";
            document.getElementById("asaude").style.color = "#006CB7";
            document.getElementById("Saude").style.display = "none";
            document.getElementById("menu_iep").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_iep").style.color = "#006CB7";
            document.getElementById("aiep").style.color = "#006CB7";
            document.getElementById("IEP").style.display = "none";
            document.getElementById("menu_imprensa").style.background = "#8C53A0"
            document.getElementById("menu_imprensa").style.color = "#FFF";
            document.getElementById("aimprensa").style.color = "#FFF";
            document.getElementById("Imprensa").style.display = "block";
            document.getElementById("menu_area_medica").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_area_medica").style.color = "#006CB7";
            document.getElementById("AreaMedica").style.display = "none";
            document.getElementById("amedica").style.color = "#006CB7";
        }
        function f_areaMedica() {
            jsddm_canceltimer();
            document.getElementById("sub_menu").style.background = '#3596DA';
            document.getElementById("menu_ogrupo").style.background = "rgb(248, 248, 248)"
            document.getElementById("agrupo").style.color = "#006CB7";
            document.getElementById("menu_ogrupo").style.color = "#006CB7";
            document.getElementById("Grupo").style.display = "none";
            document.getElementById("menu_unidades").style.background = "rgb(248, 248, 248)"
            document.getElementById("aunidade").style.color = "#006CB7";
            document.getElementById("menu_unidades").style.color = "#006CB7";
            document.getElementById("Unidades").style.display = "none";
            document.getElementById("menu_publicacoes_campanhas").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_publicacoes_campanhas").style.color = "#006CB7";
            document.getElementById("asaude").style.color = "#006CB7";
            document.getElementById("Saude").style.display = "none";
            document.getElementById("menu_iep").style.background = "rgb(248, 248, 248)"
            document.getElementById("aiep").style.color = "#006CB7";
            document.getElementById("menu_iep").style.color = "#006CB7";
            document.getElementById("IEP").style.display = "none";
            document.getElementById("menu_imprensa").style.background = "rgb(248, 248, 248)"
            document.getElementById("menu_imprensa").style.color = "#006CB7";
            document.getElementById("aimprensa").style.color = "#006CB7";
            document.getElementById("Imprensa").style.display = "none";
            document.getElementById("menu_area_medica").style.background = "#3596DA"
            document.getElementById("menu_area_medica").style.color = "#FFF";
            document.getElementById("amedica").style.color = "#FFF";
            document.getElementById("AreaMedica").style.display = "block";
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
                speed: 1500,
                maxwidth: 940,
                namespace: "centered-btns"
            });

        });
    </script>
</head>
<body>
    <script type="text/javascript">
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/all.js#xfbml=1&appId=119878354782536";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        function Busca_text() {
            if (document.getElementById("TextBox1").value == "") {
                document.getElementById("TextBox1").value = "O que você procura";
            }
            //
        }
        function Busca_text2() {
            if (document.getElementById("TextBox1").value == "O que você procura") {
                document.getElementById("TextBox1").value = "";
            }

        }

        function SendFaceBook() {
            window.open("https://www.facebook.com/rededor", "facebook");
        }

        function SendGoogle() {
            window.open("https://www.youtube.com/rededorsaoluiz");
        }
        function SendTwitter() {
            window.open("https://twitter.com/rededor", "twitter");
        }
        function Sendblog() {
            window.open("http://espacosaudedamulher.blogspot.com.br/");

        }
        function SendLinkin() {
            window.open("https://www.linkedin.com/company/rededor-saoluiz");

        }
    </script>
    <form id="form1" runat="server">
        <div>
            <div id="geral">
                <div id="saudacao">
                    <div id="saudacao_cont">
                        <p id="welcome">
                            BEM VINDO À <strong>REDE D'OR SÃO LUIZ</strong>
                        </p>
                        <!--<p id="language">
                        <a href="english.aspx">english</a>
                    </p>-->
                        <p id="contact">
                            <a href="faleconosco.aspx">Fale Conosco</a>
                        </p>
                    </div>
                </div>
                <div id="btnbuscarmoblie" onclick="ShowBusca()">
                    <div style="float: left; padding-top: 13px; `padding-left: 16px;">O que você procura </div>
                    <div style="padding-top: 6px; float: left; padding-left: 9px;">
                        <img src="images/lupa_mobile.jpg" />
                    </div>
                </div>

                <!-- Fim da div saudacao-->
                <div id="topo">
                    <h1><a href="Default.aspx">
                        <img src="images/logo_rede_Dor_Sao_Luiz.jpg" /></a></h1>
                    <div id="menuApoio">
                        <div id="search">
                            <asp:TextBox ID="TextBox1" CssClass="inputSearch" onfocus="Busca_text2('')" onblur="Busca_text('')" runat="server" Text="O que você procura" />
                        </div>
                        <div id="btnSearch">
                            <asp:ImageButton ID="ImageButton2" CssClass="btn_search" runat="server" ImageUrl="~/images/search-icon.png" OnClick="ImageButton2_Click" />
                        </div>
                        <div id="socialIcons">
                            <img src="images/ico_twitter.jpg" onclick="SendTwitter()" style="cursor: pointer;" />
                            <img src="images/ico_facebook.jpg" onclick="SendFaceBook()" style="cursor: pointer;" />
                            <img src="images/ico_youtube.jpg" onclick="SendGoogle()" style="cursor: pointer;" />&nbsp;
                         <img src="images/ico.blog.png" onclick="Sendblog()" style="cursor: pointer;" />
                            <img src="images/linkedin.png" onclick="SendLinkin()" style="cursor: pointer;" />
                        </div>
                    </div>
                    <!-- Fim da div search-->
                </div>
                <!-- Fim da div topo-->

                <!-- menu celular -->

                <div id='cssmenu'>
                    <ul>
                        <!--li class='active'><a href='index.html'><span>o hospital</span></a></li-->
                        <li class='has-sub'><a href='ogrupo.aspx'><span>O GRUPO</span></a>
                            <ul>

                                <asp:Literal ID="ltl_grupo2" runat="server"></asp:Literal>

                            </ul>
                        </li>
                        <li class='has-sub'><a href="unidades.aspx"><span>NOSSAS UNIDADES</span></a></li>
                        <li><a href="espaco_saude.aspx"><span>ESPAÇO SAÚDE</span></a>
                            <ul>

                                <asp:Literal ID="ltl_es2" runat="server"></asp:Literal>

                            </ul>
                        </li>
                        <li class='has-sub'><a href="imprensa.aspx"><span>IMPRENSA</span></a>
                            <ul>

                                <asp:Literal ID="ltl_imprensa2" runat="server"></asp:Literal>

                            </ul>
                        </li>
                        <li class='has-sub'><a href="area_medica.aspx"><span>INSTITUTOS, ESTUDOS E PESQUISAS</span></a>
                            <ul>

                                <asp:Literal ID="ltl_iep2" runat="server"></asp:Literal>

                            </ul>
                        </li>
                        <li class='has-sub'><a href="area_medica.aspx"><span>PROFISSIONAIS DE SAÚDE</span></a>
                            <ul>

                                <asp:Literal ID="ltl_ps2" runat="server"></asp:Literal>

                            </ul>
                        </li>
                        <li class='last'><a href="faleconosco.aspx"><span>Ouvidoria</span></a></li>
                    </ul>
                </div>

                <!-- fim do menu celular -->


                <div id="geral_menu">
                    <div id="menu" style="width: auto;">
                        <ul style="width: 100%;">
                            <li onmouseout="jsddm_timer(timeout)">
                                <ul>
                                    <li id="menu_ogrupo" onmouseover="f_grupo();jsddm_canceltimer();"><a id="agrupo"
                                        href="ogrupo.aspx">O GRUPO<br />
                                        <div class="line_menu">
                                        </div>
                                    </a></li>
                                    <li id="menu_unidades" onmouseover="f_unidades()"><a href="unidades.aspx" id="aunidade">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOSSAS<br />
                                        &nbsp;&nbsp;&nbsp;&nbsp; UNIDADES<div class="line_menu">
                                        </div>
                                    </a></li>
                                    <li id="menu_publicacoes_campanhas" onmouseover="f_publicacoes()"><a id="asaude"
                                        href="espaco_saude.aspx">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ESPAÇO<br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SAÚDE<div class="line_menu">
                                        </div>
                                    </a></li>
                                    <li id="menu_iep" onmouseover="f_iep()"><a href="iep.aspx" id="aiep">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INSTITUTOS,<br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ESTUDOS E PESQUISAS<div class="line_menu">
                                        </div>
                                    </a></li>
                                    <li id="menu_imprensa" onmouseover="f_imprensa()"><a id="aimprensa" href="imprensa.aspx">
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IMPRENSA<div class="line_menu">
                                        </div>
                                    </a></li>
                                    <li id="menu_area_medica" onmouseover="f_areaMedica()"><a id="amedica" href="area_medica.aspx">PROFISSIONAIS DE SAÚDE<div class="line_menu">
                                    </div>
                                    </a></li>
                                </ul>
                            </li>
                            <li style="width: 100%;" onmouseover="jsddm_canceltimer()" onmouseout="jsddm_timer(timeout)">
                                <div id="sub_menu">
                                    <div id="Grupo" style="display: none; width: 940px; margin: 0px auto;">
                                        <ul class="ul_sub_menu">
                                            <!--<li><a href="demonstrativo_financeiro.aspx">DEMONSTRATIVO FINANCEIRO</a></li>
                                        <li><a href="campanhas.aspx">CAMPANHAS E PATROCÍNIOS</a></li>-->
                                            <asp:Literal ID="ltr_grupo" runat="server"></asp:Literal>
                                        </ul>
                                    </div>
                                    <div id="Unidades" style="display: none; width: 940px; margin: 0px auto;">
                                    </div>
                                    <div id="Saude" style="display: none; width: 940px; margin: 0px auto;">
                                        <ul class="ul_sub_menu">
                                            <!--<li><a href="sua_saude.aspx">SUA SAÚDE</a></li>
                                        <li><a href="saude_com_hospitais_rede_dor_sao_Luiz.aspx">SAÚDE COM OS HOSPITAIS REDE
                                            D'OR SÃO LUIZ</a></li>
                                        <li><a href="programetes_discovery.aspx">PROGRAMETES DA DISCOVERY</a></li>
                                        li><a href="espaco_saude_page.aspx?id=318">SAÚDE DA MULHER</a></li-->
                                            <asp:Literal ID="ltr_es" runat="server"></asp:Literal>
                                        </ul>
                                    </div>
                                    <div id="IEP" style="display: none; width: 940px; margin: 0px auto;">
                                        <ul class="ul_sub_menu">
                                            <!--<li><a href="iep_dor.aspx">Instituto D'Or de Pesquisa e Ensino</a></li>
                                        <li><a href="iep_iep.aspx">Instituto IEP</a></li>
                                        <li><a href="iep_saude_publica.aspx">Instituto D'Or de Gestão de Saúde Pública</a></li>
                                        <li><a href="iep_sluiz.aspx">Centro de Estudos São Luiz</a></li>-->
                                            <asp:Literal ID="ltr_iep" runat="server"></asp:Literal>
                                        </ul>
                                    </div>
                                    <div id="Imprensa" style="display: none; width: 940px; margin: 0px auto;">
                                        <ul class="ul_sub_menu" id="Ul1">
                                            <!--   Publicações e Campanhas                          <li><a href="noticias.aspx">NOTÍCIAS</a></li>
                                        <li><a href="releases.aspx">RELEASES</a></li>-->
                                            <asp:Literal ID="ltr_ep" runat="server"></asp:Literal>
                                        </ul>
                                    </div>
                                    <div id="AreaMedica" style="display: none; width: 940px; margin: 0px auto;">
                                        <ul class="ul_sub_menu" id="Ul2">
                                            <!--<li><a href="am_cursos.aspx">CURSOS E PALESTRAS</a></li>
                                        <li><a href="am_docs.aspx">DOCUMENTOS PARA DOWNLOAD</a></li>
                                        <li><a href="am_revistas.aspx">ARTIGOS CIENTÍFICOS</a></li>-->

                                            <!--<li><a href="educacao_continua.aspx">Educação Continuada</a></li>-->
                                            <asp:Literal ID="ltr_am" runat="server"></asp:Literal>
                                        </ul>
                                    </div>
                                </div>
                                <!-- Fim da div sub_menu-->
                            </li>
                        </ul>
                    </div>
                    <!-- Fim da div menu-->
                </div>
                <!-- Fim da div geral_menu-->
                <div id="conteudo">
                 <div id="conteudo_padding">
                    <div id="slider">
                        <!--<img src="images/slider.jpg" />-->
                        <!-- Slideshow 1 -->
                        <div class="rslides_container">
                            <ul class="rslides" id="slider1">
                                <asp:Literal ID="ltl_slider" runat="server"></asp:Literal>
                            </ul>
                        </div>
                    </div>
                    <!-- Fim da div slider-->
                    <div id="banners">
                        <div id="banner1">
                            <asp:Label ID="lbl_banner1" runat="server" Text=""></asp:Label>
                        </div>
                        <!-- Fim da div banner1-->
                        <div id="banner2">
                            <asp:Label ID="lbl_banner2" runat="server" Text=""></asp:Label>
                        </div>
                        <!-- Fim da div banner2-->
                        <div id="banner3">
                            <asp:Label ID="lbl_banner3" runat="server" Text=""></asp:Label>
                        </div>
                        <!-- Fim da div banner3-->
                        <div id="banner4">
                            <asp:Label ID="lbl_banner4" runat="server" Text=""></asp:Label>
                        </div>
                        <div id="banner21">
                            <asp:Label ID="lbl_banner21" runat="server" Text=""></asp:Label>
                        </div>
                        <div id="banner22">
                            <asp:Label ID="lbl_banner22" runat="server" Text=""></asp:Label>
                        </div>
                        <div id="banner31">
                            <asp:Label ID="lbl_banner31" runat="server" Text=""></asp:Label>
                        </div>
                        <div id="banner32">
                            <asp:Label ID="lbl_banner32" runat="server" Text=""></asp:Label>
                        </div>
                        <!-- Fim da div banner4-->
                    </div>
                    <!-- Fim da div banners-->
                    <div id="news">
                        <div id="noticias">
                            <p id="top_noticias_home">
                                ÚLTIMAS <span>NOTÍCIAS</span>
                            </p>
                            <div class="leia_mais">
                                <a href="noticias.aspx">LEIA + <span>NOTÍCIAS</span></a>
                            </div>
                            <div id="barra_noticias_home">
                                <p>
                                </p>
                            </div>
                            <!-- Fim da div barra_noticias_home-->
                            <asp:DataList ID="dtl_noticias" runat="server" DataKeyField="id_conteudo" DataSourceID="ds_noticias">
                                <ItemStyle CssClass="item_mobile" />
                                <ItemTemplate>
                                    <!-- -->
                                    <div class="noticias_home">
                                        <div style="float: left;max-width: 80px;">
                                        <a href='noticias_detail.aspx?id=<%# Eval("id_conteudo") %>' class="link_noticias_home">
                                            <img src='images/noticias/<%# Eval("imagem") %>' width="70" height="70" /></a>
                                            </div>
                                        <div id="NoticiaMobile">
                                        <p class="link_noticias_home_titulo">
                                            <a href='noticias_detail.aspx?id=<%# Eval("id_conteudo") %>'><strong>
                                                <%# Eval("nm_titulo") %></strong></a> <span class="data_noticias_home">
                                                    <%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo")) %></span>
                                        </p>
                                        <p class="link_noticias_home_resumo">
                                            <a href='noticias_detail.aspx?id=<%# Eval("id_conteudo") %>'>
                                                <%# Eval("ds_resumo") %></a>
                                        </p>
                                            </div>
                                        <div style="clear: both">
                                        </div>
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
                        </div>
                        <!-- Fim da div noticias-->
                        <div id="releases">
                            <p id="top_releases_home">
                                RELEASES
                            </p>
                            <div class="leia_mais">
                                <a href="releases.aspx"><span>LEIA +</span> MATÉRIAS NA MÍDIA</a>
                            </div>
                            <div id="barra_releases_home">
                                <p>
                                </p>
                            </div>
                            <!-- Fim da div barra_releases_home-->
                            <asp:DataList ID="dtl_releases" runat="server" DataKeyField="id_conteudo" DataSourceID="ds_release">
                                <ItemStyle CssClass="item_mobile" />
                                <ItemTemplate>
                                    <!-- -->
                                    <div class="releases_home">
                                        <p class="link_releases_home_titulo">
                                            <a href='releases_detail.aspx?id=<%# Eval("id_conteudo") %>'><strong>
                                                <%# Eval("nm_titulo") %></strong></a> <span class="data_releases_home">
                                                    <%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo")) %></span>
                                        </p>
                                        <p class="link_releases_home_resumo">
                                            <a href='releases_detail.aspx?id=<%# Eval("id_conteudo") %>'>
                                                <%# Eval("ds_resumo") %></a>
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
                        </div>
                        <!-- Fim da div releases-->
                        <div id="newsletter">
                            <div id="icone_newsletter">
                                <img src="images/ico_mail.jpg" />
                            </div>
                            <div id="titulo_newsletter">
                                <p>
                                    RECEBA NOSSA <span>NEWSLETTER</span>
                                </p>
                                <table>
                                    <tr>
                                        <td width="215">
                                            <asp:TextBox ID="txt_newsletter" value="Digite seu e-mail" runat="server" onfocus="this.value = ''"></asp:TextBox>
                                        </td>
                                        <td width="88" height="29">
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/btn_cadastrar.jpg"
                                                OnClick="ImageButton1_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- Fim da div newsletter-->
                    </div>
                    <!-- Fim da div news-->
                    <div id="redes_sociais">
                        <div id="youtube">
                            <img src="images/youtube.png" onclick="SendGoogle()" style="cursor: pointer;" />
                            <asp:Literal ID="ltlYouTube" runat="server"></asp:Literal>
                        </div>
                        <div id="twitter">
                            <a class="twitter-timeline" data-dnt="true" href="https://twitter.com/rededor" data-widget-id="469591837192114176">Tweets by @rededor</a>
                            <script>                            !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");</script>
                        </div>
                        <div id="facebook">
                            <!--   <div class="fb-like-box" data-href="https://www.facebook.com/rededor" data-width="290"
                            data-height="485" data-show-faces="true" data-border-color="#d0d0d0" data-stream="false"
                            data-header="false">
                            -->

                            <div class="fb-like-box" id="fb" style="display: inline-block; position: relative; clear: left; width: 290px;" data-href="https://www.facebook.com/rededor" data-width="290" data-height="600" data-show-faces="true" data-border-color="#d0d0d0" data-stream="false" data-header="false"></div>
                        </div>
                    </div>
                </div>
                    </div>
                <!-- Fim da div redes_sociais-->
            </div>
            <!-- Fim da div conteudo-->
            <div id="rodape">

                <div id="footer_menu_mobile">
                <div style="padding:0px 20px;">
                <h2 class="accordion">O GRUPO<span style="float: right;">+</span></h2>
                <div class="accordion">
                    <ul>
                        <asp:Literal ID="ltl_grupo3" runat="server"></asp:Literal>
                    </ul>
                </div>
                <h2 class="accordion"><a href="unidades.aspx"> NOSSAS UNIDADES</a></h2>
                <h2 class="accordion">ESPAÇO SAÚDE<span style="float: right;">+</span></h2>
                <div class="accordion">
                    <ul>
                        <asp:Literal ID="ltl_es3" runat="server"></asp:Literal>
                    </ul>
                </div>
                <h2 class="accordion">INSTITUTOS, ESTUDOS E PESQUISAS<span style="float: right; ">+</span></h2>
                <div class="accordion">
                    <ul>
                        <asp:Literal ID="ltl_iep3" runat="server"></asp:Literal>
                    </ul>
                </div>
                <h2 class="accordion">IMPRENSA<span style="float: right; ">+</span></h2>
                <div class="accordion">
                    <ul>
                        <asp:Literal ID="ltl_imprensa3" runat="server"></asp:Literal>
                    </ul>
                </div>
                <h2 class="accordion">PROFISSIONAIS DE SAÚDE<span style="float: right; ">+</span></h2>
                <div class="accordion">
                    <ul>
                        <asp:Literal ID="ltl_ps3" runat="server"></asp:Literal>
                    </ul>
                </div>
                <h2 class="accordion"><a href="faleconosco.aspx"" style="padding:initial;">OUVIDORIA</a></h2>
                    </div>
            </div>

            <div id="footer_mobile">
                <div style="float:left; padding-left: 10px; margin-top: 26px;">
                    <asp:HyperLink ID="hpkFaceBook2" style="padding:initial; cursor:pointer" Target="_blank" runat="server" onclick="SendFaceBook()"><img src="images/ico_facebook.jpg" class="facebook" /></asp:HyperLink>
                    <asp:HyperLink ID="hpkTwitter2" style="padding:initial; cursor:pointer" Target="_blank" runat="server" onclick="SendTwitter()"><img src="images/ico_twitter.jpg" class="twitter" /></asp:HyperLink>
                    <asp:HyperLink ID="hpkYouTube2" style="padding:initial; cursor:pointer" Target="_blank" runat="server" onclick="SendGoogle()"><img src="images/ico_youtube.jpg" class="youtube" /></asp:HyperLink>
                    <asp:HyperLink ID="hpkBlog2" style="padding:initial; cursor:pointer" Target="_blank" runat="server" onclick="Sendblog()"><img src="images/ico.blog.png" class="blog" /></asp:HyperLink>
                    <asp:HyperLink ID="hpkLinkedin2" Visible="false" style="padding:initial; cursor:pointer" Target="_blank" runat="server" onclick="SendLinkin()"><img src="images/linkedin.png" class="linkedin" /></asp:HyperLink>
                </div>
                <div style="float:right; margin-top: -5px;"><a href="http://www.rededor.com.br" target="_blank">
                    <img src="images/logoRedeDorSaoLuiz.png" style="margin: 20px 0; margin-right: 20px;" /></div>
            </div>

                <div id="menu_footer">
                    <ul>
                        <li><a href="ogrupo.aspx">O Grupo</a></li>
                        <li>|</li>
                        <li><a href="unidades.aspx">Nossas Unidades</a></li>
                        <li>|</li>
                        <li><a href="sua_saude.aspx">Espaço Saúde</a></li>
                        <li>|</li>
                        <li><a href="iep.aspx">Institutos, Estudos e Pesquisas</a></li>
                        <li>|</li>
                        <li><a href="imprensa.aspx">Imprensa</a></li>
                    </ul>
                </div>
                <!-- Fim da div menu_footer-->
                <div id="copyright">
                    <p>
                        &copy;2012 Rede D'Or São Luiz - Todos os direitos reservados
                    </p>
                </div>
                <!-- Fim da div copyright-->
                <div id="logo_footer">
                    <img src="images/logo_rede_Dor_Sao_Luiz_footer.jpg" />
                </div>
            </div>
            <!-- Fim da div rodape-->
        </div>
        <!-- Fim da div Geral-->
        </div>
    </form>
    <asp:SqlDataSource ID="ds_noticias" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>"
        SelectCommand="SELECT top 3 a.[id_conteudo], [nm_titulo], [dt_conteudo], [id_noticia], (CASE WHEN [ds_imgDestaque] is null THEN 'destaque_default.jpg' ELSE [ds_imgDestaque] END)as imagem , [ds_resumo] FROM [TB_PORTAL_CONTEUDO] a INNER JOIN [TB_PORTAL_CONTEUDO_HOSPITAL] b ON a.id_conteudo = b.id_conteudo WHERE (([id_tipo] = @id_tipo) AND ([id_sessao] = @id_sessao) AND ([id_status] = @id_status) AND ([id_idioma] = @id_idioma) AND b.id_hospital = @idHosp) order by dt_conteudo desc">
        <SelectParameters>
            <asp:Parameter DefaultValue="5" Name="id_sessao" Type="Int32" />
            <asp:Parameter DefaultValue="5" Name="id_tipo" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
            <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_release" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>"
        SelectCommand="SELECT top 3 a.[id_conteudo], [nm_titulo], [dt_conteudo], [id_noticia], (CASE WHEN [ds_imgDestaque] is null THEN 'destaque_default.jpg' ELSE [ds_imgDestaque] END)as imagem , [ds_resumo] FROM [TB_PORTAL_CONTEUDO] a INNER JOIN [TB_PORTAL_CONTEUDO_HOSPITAL] b ON a.id_conteudo = b.id_conteudo WHERE (([id_tipo] = @id_tipo) AND ([id_sessao] = @id_sessao) AND ([id_status] = @id_status) AND ([id_idioma] = @id_idioma) AND b.id_hospital = @idHosp) order by dt_conteudo desc">
        <SelectParameters>
            <asp:Parameter DefaultValue="5" Name="id_sessao" Type="Int32" />
            <asp:Parameter DefaultValue="6" Name="id_tipo" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
            <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-17119718-1', 'auto');
        ga('send', 'pageview');

    </script>





</body>
</html>
