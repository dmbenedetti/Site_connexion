<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResultadoExame.aspx.cs" Inherits="ResultadoExame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv='Content-Type' content='text/html; charset=windows-1252'>
    <meta http-equiv='Content-Language' content='pt-br'>
    <meta http-equiv='Pragma' content='no-cache'>
    <meta http-equiv='Expires' content='-1'>
    <meta name='KEYWORDS' content='products; mobile; celular; saúde; ' />
    <meta name='DESCRIPTION' content='The main site of VEUS Technology. Find solutions for Mobilie' />
    <meta name='MBA.LOCALE' content='BR-RJ' />
    <meta name='CATEGORY' content='Home Page' />
    <link href='../estilos/style_veus_laudo.css' rel='stylesheet' type='text/css'>
    <style>
    html {
    overflow: -moz-scrollbars-vertical;
    }
    </style>
    <title>:: Hospital e Maternidade Brasil ::</title>

    <script language='JavaScript' type='text/javascript'>
        function isNum(value) {
            return !isNaN(new Number(value));
        }

        function arrumanum(texto) {
            texto = texto.replace('.', '');
            texto = texto.replace(',', '.');
            texto = texto.replace('Ausente', '9');
            texto = texto.replace('Presente', '15');
            texto = texto.replace('Nï¿½o Reagente', '9');
            texto = texto.replace('Reagente', '15');
            texto = texto.replace('Negativo', '9');
            texto = texto.replace('Positivo+++++', '17');
            texto = texto.replace('Positivo++++', '16');
            texto = texto.replace('Positivo+++', '15');
            texto = texto.replace('Positivo++', '14');
            texto = texto.replace('Positivo+', '13');
            texto = texto.replace('Positivo', '15');

            texto = texto.replace('+++++', '17');
            texto = texto.replace('++++', '16');
            texto = texto.replace('+++', '15');
            texto = texto.replace('++', '14');
            texto = texto.replace('+', '13');
            if (isNum(texto)) {
                return eval(texto);
            }
            else {
                var novotexto
                novotexto = ''
                for (i = 0; i < texto.length; i++) {
                    if ((isNum(texto.charAt(i))) || (texto.charAt(i) == '.') || (texto.charAt(i) == '-')) {
                        novotexto = novotexto + texto.charAt(i);
                    }
                }
                if (novotexto == '') {
                    novotexto = '0';
                }
                return eval(novotexto);
            }
        }
        function pintar(valor, min, max, ganho) {
            passo = (max - min) / 10;
            numpassos = parseInt((valor - min) / passo);
            if (numpassos == 0) {
                numpassos = 1;
            }
            return numpassos + ganho;
        }
        function achalocal(valor, minabsurdo, minnormal, maxnormal, maxabsurdo) {
            if ((valor > minnormal) && (valor < maxnormal)) {
                return pintar(valor, minnormal, maxnormal, 10);
            }
            else if (valor == minnormal) {
                return 10;
            }
            else if (valor == maxnormal) {
                return 20;
            }
            else if (valor <= minabsurdo) {
                return 0;
            }
            else if (valor >= maxabsurdo) {
                return 30;
            }
            else if ((valor > minabsurdo) && (valor < minnormal)) {
                return pintar(valor, minabsurdo, minnormal, 0);
            }
            else if ((valor > maxnormal) && (valor < maxabsurdo)) {
                return pintar(valor, maxnormal, maxabsurdo, 20);
            }
        }
        function montatabela(pintar, img) {
            monta_tabela(pintar, img);
        }
        function monta_tabela(pintar, img) {
            if (img == '') {
                img = '/ev_doc/meu_lab/laudos/images/barra.gif';
            }
            document.write('<table border="0" cellpadding="0" cellspacing="0" background="' + img + '" width="150" height="11"><tr>');
            for (i = 0; i <= 30; i++) {
                if (i == pintar) {
                    document.write('<td width="5" bgcolor="#000000"></td>')
                }
                else {
                    document.write('<td width="5"></td>')
                }
            }
            document.write('</tr></table>');
        }

        function Print(e) {
            e.style.display = "none";
            window.print();
            e.style.display = "block";
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <img src='images/header_LABS_HMB.jpg' border="0"><pre><!--b>NIC: </b>5501/33  (643883)-->
<b>DATA: </b><asp:Literal ID="ltlData" runat="server"></asp:Literal>
<b>NOME: </b><asp:Literal ID="Cliente" runat="server"></asp:Literal>
<b>TEL: </b><asp:Literal ID="ltlTel" runat="server"></asp:Literal>
<b>END.: </b><asp:Literal ID="ltlEndereco" runat="server"></asp:Literal>
<b>NASC.: </b><asp:Literal ID="ltlNascimento" runat="server"></asp:Literal>
<b>MÉDICO: </b><asp:Literal ID="ltlMedico" runat="server"></asp:Literal>
        <asp:Literal ID="ltlResultado" runat="server"></asp:Literal>
        </pre>
        <div style="position:relative;">
        <div style="position:absolute; top:0; left:0;">
        <img alt="" src="images/impressora.jpg" border="0" style="cursor:pointer;" onclick="Print(this)"/>
        </div>
        <img alt="" src='images/footer_LABS_HMB.jpg' border="0">
        </div>
    </div>
    </form>
</body>
</html>
