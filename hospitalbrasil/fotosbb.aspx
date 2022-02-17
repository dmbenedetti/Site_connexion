<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="fotosbb.aspx.cs" Inherits="fotosbb" %>

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
					
		<section class="hero nasceu">
			<div class="wrapper-hero">
				<div class="breadcrumb">
					<a href="index.htm" class="home" title="Home">Home</a> > <span>Nasceu no Hospital</span>
				</div>
				<!-- Fim do breadcrumb -->
				<h1>Nasceu no Hospital</h1>
				<p>Para ver as fotos, você precisa de uma senha. Caso não possua, peça ao papai ou à mamãe, os únicos autorizados a fornecê-la.</p>
                <asp:TextBox ID="txt_codigo"  placeholder="Senha" TextMode="Password" runat="server" CssClass="text_field" 
                        ontextchanged="txt_codigo_TextChanged"></asp:TextBox>
                <asp:Button ID="btn1" runat="server" Text="Entrar" OnClick="btn1_Click" CssClass="button" style="color: #FFF" />
                 
				<p>Importante: As fotos serão publicadas no site em até 72 horas após o parto e ficarão disponíveis por 15 dias.</p>
			</div>
		</section>
    <p align="left">
        <asp:Label ID="lbl_msg" runat="server"></asp:Label>
    </p>

	</main>
</asp:Content>

