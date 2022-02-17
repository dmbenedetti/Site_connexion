<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="fotosbb_ver.aspx.cs" Inherits="fotosbb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<meta charset="UTF-8">
	<title>Rede D'Or</title>

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900" rel="stylesheet">

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />
	<link rel="stylesheet" href="css/rededor_nasceu.css" type="text/css" media="screen and (min-width: 1024px)" />
	<link rel="stylesheet" href="css/rededor_nasceu_1024.css" type="text/css" media="screen and (max-width: 1023px)" />

	<script src="js/jquery3_1_1.min.js?nocache=3"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <main>
					
		<section class="hero">
			<div class="wrapper-hero">
				<div class="breadcrumb">
					<a href="index.htm" class="home" title="Home">Home</a> > <span>Nasceu no Hospital</span>
				</div>
				<!-- Fim do breadcrumb -->
				<h1><asp:Label ID="lbl_nomebb" runat="server"></asp:Label></h1>

				<div class="dados">
					Peso: <asp:Label ID="lbl_peso" runat="server"></asp:Label> kg<br />
					Altura: <asp:Label ID="lbl_altura" runat="server"></asp:Label> cm<br />
					Mãe: <asp:Label ID="lbl_nomemae" runat="server"></asp:Label><br />
					Pai: <asp:Label ID="lbl_nome_pai" runat="server"></asp:Label><br />
				</div>

				<ul class="lista-fotos">
                    
                    
					<li><asp:Label ID="lbl_fotos" runat="server"></asp:Label></li>
					<li><asp:Label ID="lbl_fotos0" runat="server"></asp:Label></li>
				</ul>
				
		</section>

	</main>
	
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text="Nasceu no Hospital Brasil"></asp:Label></h2>
            </div>
    <!-- <p>
        Nome do bebê:
        <asp:Label ID="lbl_bb" runat="server"></asp:Label>
    </p>-->
    <!--<p>Nome dos pais:
        <asp:Label ID="lbl_pais" runat="server"></asp:Label>
    </p>-->
    <p>Clique na foto para exibir em tamanho grande:</p>
    <p>
        <table class="style1">
            <tr>
                <td class="style2">
                    
                </td>
                <td>
                    
                </td>
            </tr>
        </table>
    </p>
                        <p>
                            
    </p>
                        <p>
                            
    </p>
                        <p>
                            
    </p>
                        <p>
                            
    </p>
                        <p>
                            
    </p>
    <p><br /><br />
    <strong>Importante:</strong><br />

As fotos serão publicadas no site em até 72 horas após o parto e ficarão
disponíveis por 30 dias. A senha é fornecida apenas pelos pais do bebê a
amigos e familiares. 



    </p>
    <p>&nbsp;
        </p>
</asp:Content>

