<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="includes/menu_topo.ascx" tagname="menu_topo" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hospital e Maternidade Brasil</title>
    <link href="styles/default.css" rel="stylesheet" media="screen" />
    <style>
    .txt
    {
        border solid 1px #436DA2;
        font:12px "Frutiger LT 57 Cn", Arial, Helvetica, sans-serif;
        color:#436DA2;
        }
        /* Daniel
        Css para o drop de hospitais - Inicio*/
        #hosp_list {
    height: 74px;
    width: 222px;
    -moz-border-bottom-colors: none;
    -moz-border-image: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-bottom-color: red;
    border-bottom-style: solid;
    border-bottom-width: 0;
    border-left-color-ltr-source: physical;
    border-left-color-rtl-source: physical;
    border-left-color-value: red;
    border-left-style-ltr-source: physical;
    border-left-style-rtl-source: physical;
    border-left-style-value: solid;
    border-left-width-ltr-source: physical;
    border-left-width-rtl-source: physical;
    border-left-width-value: 0;
    border-right-color-ltr-source: physical;
    border-right-color-rtl-source: physical;
    border-right-color-value: red;
    border-right-style-ltr-source: physical;
    border-right-style-rtl-source: physical;
    border-right-style-value: solid;
    border-right-width-ltr-source: physical;
    border-right-width-rtl-source: physical;
    border-right-width-value: 0;
    border-top-color: red;
    border-top-style: solid;
    border-top-width: 0;
    display: block;
    list-style-type: none;
    margin-bottom: 0;
    margin-left: 0;
    margin-right: 0;
    margin-top: 0;
    max-height: 250px;
    overflow-y: auto;
    padding-bottom: 0;
    padding-left: 0;
    padding-right: 0;
    padding-top: 0;
}
       #hosp_list li
        {
            padding-bottom: 6px;
            padding-left: 5px;
            padding-right: 8px;
            padding-top: 6px;
            -moz-font-feature-settings: normal;
            -moz-font-language-override: normal;
            background-color: #FFFFFF;
            border-bottom-color: #EDEDED;
            border-bottom-style: solid;
            border-bottom-width: 1px;
            color: #585858;
            cursor: pointer;
            font-family: Tahoma,Arial,Helvetica,sans-serif;
            font-size: 10px;
            font-size-adjust: none;
            font-stretch: normal;
            font-style: normal;
            font-variant: normal;
            font-weight: normal;
            line-height: normal;
            margin-bottom: 0;
            margin-left: 0;
            margin-right: 0;
            margin-top: 0;
        }
       #hosp_list li a {
    padding-bottom: 0;
    padding-left: 5px;
    padding-right: 0;
    padding-top: 0;
    color: #999999;
    cursor: pointer;
    font-family: Tahoma,Geneva,sans-serif;
    font-size: 11px;
    text-decoration: none;
    
}
#hosp_list li a:hover 
{
    text-decoration: underline;
    }
        /* Css para o drop de hospitais - FIM*/
        
.popup
{
    width:580px;
    height:430px;
    background:url(images/bck_popup.png) repeat;
    border:4px solid #5282b3;
    padding:0px 0px 12px 12px;
    font:13px/18px arial, verdana, sans-serif;
    color:#023882;
    text-align:justify;
    position:absolute;
    margin-top:150px;
    margin-left:10%;
    
    }
.popup p
{
    clear:both;
    margin:10px 0;
    padding-right:12px;
    }     
.popup img
{
    float:left;
    margin-bottom:10px;
    margin-left:45px;
    }   
.popup h2
{
    float:left;
    margin-top:75px;
    font-size:25px;
    }   
.popup #fechar_popup
{
    width:40px;
    float:right;
    height:15px;
    background:#5282b3;
    padding:5px;
    }
.popup #fechar_popup a
{
    color:#fff;
    font:13px arial, verdana, sans-serif;
    }
    </style>
    <script language="javascript">
        function myChangeHandler() {
            var url = document.getElementById('ddlOutrasUnidades').value;
            if (url != '' && url != '#') {
                window.open(this.options[this.selectedIndex].value, 'janela');
                this.form.submit();
            }
        }

        //Daniel
        //Função Java Script que aparece e some o drop de Hospitais
        function ShowDiv() {
            if (document.getElementById("DivHospitais").style.display == "none") {
                document.getElementById("DivHospitais").style.display = "block";
            }
            else {
                document.getElementById("DivHospitais").style.display = "none";
            }
        }

        function limpar(objeto, msg) {
            if (objeto.value == msg) objeto.value = '';
        }

        function mostrar(objeto, msg) {
            if (objeto.value == '') objeto.value = msg;
        }
    </script>
</head>
<body>
     <div id="fb-root"></div>
            <script type="text/javascript">
                (function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) return;
                    js = d.createElement(s); js.id = id;
                    js.src = "https://connect.facebook.net/en_US/all.js#xfbml=1&appId=119878354782536";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));
    </script>
       <form id="form1" runat="server" >
        <!-- Div Geral-->
        <div id="geral">
           

	        <!-- Div Topo-->
	        <div id="topo">
		        <h1><a href="default.aspx" title="Hospital Assunção" name="Hospital Assunção"> <img src="images/logo.jpg" alt="Hospital Assunção" /></a></h1>
					        <p><!--<span><a href="noticias.aspx">Ver +</a></span>--></p>					
		        <!-- Div search_topo-->
		        <div id="search_topo">
		        <table cellpadding=0 cellspacing=0>
		            <tr>
		                
		                <td><asp:TextBox ID="TextBox1" runat="server" Height="20px" 
                                ontextchanged="TextBox1_TextChanged" Width="170px"  onfocus="limpar (this,'Buscar');" onblur="mostrar (this, 'Buscar');"  value="Buscar"></asp:TextBox></td>
		                <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                ImageUrl="~/images/btn_ok.jpg" onclick="ImageButton1_Click" />
                      </td>
		            </tr>
		        </table>
			        
		        </div>
		        <!-- fim Div search_topo-->
		        <!-- Div menu_topo-->
		        <uc1:menu_topo ID="menu_topo1" runat="server" />
		        <!-- Fim Div menu_topo-->
	        </div>
	        <!-- Fim Div Topo-->
	        <!-- Div conteudo-->
	        <div id="conteudo">
		        <!-- Div destaque_home-->
		        <div id="destaque_home">
			        <% =imagem_destaque_home%>
		        </div>
		        <!-- Fim Div destaque_home-->
		        <!-- Div chamadas_home -->
		        <div id="chamadas_home">
			        
		          <% =chamadas1_home %>
		        </div>
		        <!-- Fim Div chamadas_home -->
		        <!-- Div chamadas_home2 -->
		        <div id="chamadas_home2">
			        <!-- Div msg_paciente-->
			        <div class="banner_home">
			            
				        <% =imagem_banner1%>
			        </div>
			        <!-- Fim Div msg_paciente-->
			        <div id="noticias_home">
				        <div id="titulo_div_noticias">
				        <p>/Destaques<!--<span><a href="noticias.aspx">Ver +</a></span>--></p>
				        </div>
				        <div class="div_noticias">
					        <!-- <img src="images/noticias/noticia1.jpg" />
					        <p><a href="#">HMA Comemora 38 anos</a></p>
					        <p>No último dia 10 de janeiro, o Hospital e Maternidade Assunção completou 38 anos</p>-->
					        <% =noticia1 %>
				        </div>
				        <div class="div_noticias">
					        <!-- <div>
					        <a href="#">Depois das férias como voltar a uma rotina alimentar saudável. </a>
					        <p>Durante o período de férias é comum, para algumas pessoas, deixar os hábitos alimentares saudáveis de lado.</p>
					        </div>
					        <div>
					        <a href="#">Depois das férias como voltar a uma rotina alimentar saudável. </a>
					        <p>Durante o período de férias é comum...</p>
					        </div>--><% =noticia2 %>
				        </div>
				        
			        </div>
			        
			        <!-- Fim Div noticias_home -->
			        <div class="banner_home2">
			            <div class="fb-like-box" id="fb" style="display: inline-block; position: relative; clear: left; width: 210px; height: 200px;" data-href="https://www.facebook.com/hospitalbrasil" data-width="210" data-height="220" data-show-faces="true" data-border-color="#d0d0d0" data-stream="false" data-header="false"></div>
				        <%// =imagem_banner2%>
			        </div>
		        <!-- Fim Div chamadas_home2 -->
			        <!-- Div noticias_home -->
			        
	        </div>
	        <!-- Fim Div conteudo-->
	         
                
	        <div id="outros_hosp" style="clear:both; ">   
	        <div style="background:url(images/bck_outros_hosps.gif) top center no-repeat; width:960px; margin:15px auto; height:25px; padding:0 0 10px 0; text-align:center;">
	                 <table width="0" cellpadding="0" cellspacing="3" border="0" width="960" align=center>
                        <tr>
                            <td valign="top" style=" width: 50%; text-align: right; ">
                            <div style="padding-top:8px;">
                                Conheça os outros hospitais da <strong>Rede D'Or São Luiz: </strong>
                              </div>
                            </td>
                            <td valign="top" style="text-align: left;">       
                <div style="z-index: 90;width: 225px; clear: both;">
                            <div style="-moz-font-feature-settings: normal; -moz-font-language-override: normal;
                                -x-system-font: none; background-attachment: scroll; background-clip: border-box;
                                background-color: transparent; background-image: url('images/rcbInput_azul.gif');
                                background-origin: padding-box; background-position: 0 0; background-repeat: no-repeat;
                                background-size: auto auto; color: #57ABCD; float: left; font-family: Tahoma,Arial,Helvetica,sans-serif;
                                font-size: 10px; font-size-adjust: none; font-stretch: normal; font-style: normal;
                                font-variant: normal; font-weight: bold; height: 11px; left: 0; line-height: 11px;
                                margin-bottom: 3px; margin-left: 0; margin-right: 0; margin-top: 3px; overflow-x: hidden;
                                overflow-y: hidden; padding-bottom: 5px; padding-left: 5px; padding-right: 5px;
                                padding-top: 5px; top: 0; cursor: pointer; vertical-align: middle; width: 195px !important;z-index: 99; position:relative;" onclick="ShowDiv();">
                                Selecione</div>
                            <div style="background-attachment: scroll; background-clip: border-box; background-color: transparent;
                                background-image: url('images/rcbArrowCell_azul.gif');
                                background-origin: padding-box; background-position: 0 0; background-repeat: no-repeat;
                                background-size: auto auto; cursor: pointer; float: left; height: 21px; margin-top: 3px;
                                padding-bottom: 0; padding-left: 0; padding-right: 0; padding-top: 0; top: 0;
                                width: 20px;z-index: 99; position:relative;" onclick="ShowDiv();">
                            </div>
                            <div id="DivHospitais" style="z-index: 91; -moz-border-bottom-colors: none; -moz-border-image: none;
                                -moz-border-left-colors: none; -moz-border-right-colors: none; -moz-border-top-colors: none;
                                background-color: #FFFFFF; border-bottom-color: #CBE3ED; border-bottom-style: solid;
                                border-bottom-width: 1px; border-left-color-ltr-source: physical; border-left-color-rtl-source: physical;
                                border-left-color-value: #CBE3ED; border-left-style-ltr-source: physical; border-left-style-rtl-source: physical;
                                border-left-style-value: solid; border-left-width-ltr-source: physical; border-left-width-rtl-source: physical;
                                border-left-width-value: 1px; border-right-color-ltr-source: physical; border-right-color-rtl-source: physical;
                                border-right-color-value: #CBE3ED; border-right-style-ltr-source: physical; border-right-style-rtl-source: physical;
                                border-right-style-value: solid; border-right-width-ltr-source: physical; border-right-width-rtl-source: physical;
                                border-right-width-value: 1px; border-top-color: #CBE3ED; border-top-style: solid;
                                border-top-width: 1px; bottom: auto; left: 1px; margin-bottom: 0; margin-left: 0;
                                margin-right: 0; margin-top: 0; padding-bottom: 0; padding-left: 0; padding-right: 0;
                                padding-top: 0; position: relative; top: 3px; width: 89%; display: none;"><ul id="hosp_list">
                                
                                
                                      <li style="cursor: default;"><span>Hospitais em São Paulo</span> </li>
                                    <li class=""><a href="http://www.hospitalassuncao.com.br/" target="_blank">- Hospital Assunção</a> </li>
									<li class=""><a href="http://www.hospitalbartira.com.br/" target="_blank">- Hospital Bartira</a> </li>
                                    <li class=""><a href="http://www.ifor.com.br/" target="_blank">- Hospital Ifor</a> </li>
                                    <li class=""><a href="http://www.saoluiz.com.br/" target="_blank">- Hospital São Luiz</a> </li>
                                    <li class=""><a href="http://www.hospitalcrianca.com.br/" target="_blank">- Hospital da Criança</a> </li>
                                    <li class=""><a href="http://www.sinobrasileiro.com.br/" target="_blank">- Hospital SinoBrasileiro </a> </li>
                                       <li class=""><a href="http://www.hospitalvillalobos.com.br/" target="_blank">- Hospital Villa-Lobos  </a> </li>
                                    <li class=""><a href="http://www.vivalle.com.br/" target="_blank">- Hospital viValle</a> </li>
                                    
                                          <li style="cursor: default;"><span>Hospitais no Rio de Janeiro</span> </li>
                                    <li class=""><a href="http://www.barrador.com.br/" target="_blank">- Hospital Barra D'Or</a> </li>
                                     <li class=""><a href="http://www.caxiasdor.com.br/" target="_blank">- Hospital Caxias D’Or </a> </li>
                                    <li class=""><a href="http://www.copador.com.br/" target="_blank">- Hospital Copa D'Or</a> </li>
                                    <li class=""><a href="http://www.nortedor.com.br/" target="_blank">- Hospital Norte D'Or</a> </li>
                                    <li class=""><a href="http://www.niteroidor.com.br/" target="_blank">- Hospital Niterói D'Or</a> </li>
                                    <li class=""><a href="http://www.quintador.com.br/" target="_blank">- Hospital Quinta D'Or</a> </li>
                                    <li class=""><a href="http://www.riosdor.com.br/" target="_blank">- Hospital Rios D'Or</a> </li>
                                    <li class=""><a href="http://www.oestedor.com.br/" target="_blank">- Hospital Oeste D’Or </a> </li>
                                    <li class=""><a href="http://www.hias.com.br/" target="_blank">- Hospital Albert Sabin</a> </li>
                                    <li class=""><a href="http://www.badim.com.br/" target="_blank">- Hospital Badim</a> </li>
                                    <li class=""><a href="http://www.hospitalbangu.com.br" target="_blank">- Hospital Bangu</a> </li>                         
                                   
                                                <li style="cursor: default;"><span>Hospitais em Pernambuco</span> </li>
                                    <li class=""><a href="http://www.esperancarecife.com.br/" target="_blank">- Hospital Esperança Recife</a> </li>
                                    <li class=""><a href="http://www.esperancaolinda.com.br/" target="_blank">- Hospital Esperança Olinda</a> </li>
                                    <li class=""><a href="http://www.hospitalsaomarcos.com.br/" target="_blank">- Hospital São Marcos</a> </li>
                                    
                                    <li style="cursor: default;"><span>Hospitais no Distrito Federal</span> </li>
                                    <li class=""><a href="http://www.hsl.com.br/" target="_blank">- Hospital Santa Luzia</a> </li>
                                    <li class=""><a href="http://www.hcbr.com.br/" target="_blank">- Hospital do Coração do Brasil</a> </li>
                                    
                                      <li style="cursor: default;"><span>Pesquisa e Ensino</span> </li>
                                    <li class=""><a href="http://www.idor.org/" target="_blank">- Instituto D’Or de Pesquisa e Ensino </a> </li>
                                    
                                    <li style="cursor: default;"><span>Oncologia</span> </li>
                                     <li class=""><a href="http://www.oncologiador.com.br/" target="_blank">- Oncologia D’Or</a> </li>
                            </div>
                        </div>
                        </td>
                        </tr>
                        </table>
              </div>
    <%--                     <div id="facebook">
                        <div class="fb-like-box" data-href="https://www.facebook.com/rededor" data-width="290"
                            data-height="485" data-show-faces="true" data-border-color="#d0d0d0" data-stream="false"
                            data-header="false">
                        </div>
                    </div>
    --%>                    
	          </div>
        </div>
        </div>
        <!-- Fim Div Geral-->
        
			       
        <!-- Div Rodape-->
        <div id="content_rodape" style="background:url(images/bck_rodape.gif) top center repeat-x; height:80px;">
	        <div id="rodape" style="width:1000px; margin:0 auto;">
		        <div id="logo_rodape">
		            <img src="images/logo_sl_dor_footer.jpg" />
		        </div>
		        <div id="copy">
			        <p><strong>© Hospital e Maternidade Brasil</strong></p>
			        
		        </div>
		        <div id="endereco">
			        <p>Rua Cel. Fernando Prestes, 1.177 - Santo André - SP - Tel: (11)2127 6666<br />
			        <strong>Marcação de Exames: (11) 3040-1200<br />
Marcação de Consultas: (11) 3040-9260</strong> 
		        </div>
	        </div>
      </div>
	        <!-- Fim Div Rodape-->
	        <div style="width:960px; margin: 15px auto; text-align:right;font:10px Arial, Helvetica, sans-serif;
color: #666666;">
    <p>Produzido por <a href="http://www.connexion.net.br/" target="_blank" style="font:bold 10px Arial, Helvetica, sans-serif;color: #666666;">CONNEXION NET</a></p>
    </div>
    
    <script type="text/javascript">

              var _gaq = _gaq || [];
              _gaq.push(['_setAccount', 'UA-1730884-9']);
              _gaq.push(['_setDomainName', 'hospitalbrasil.com.br']);
              _gaq.push(['_trackPageview']);

              (function() {
                  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
              })();

</script>
   </form>
</body>
</html>
