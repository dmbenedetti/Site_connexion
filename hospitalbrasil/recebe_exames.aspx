<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="recebe_exames.aspx.cs" Inherits="quem_somos" Title="Hospital e Maternidade Brasil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.list_revista
{
    width:100px;
    height:230px;
    text-align:center;
    padding:6px 25px;
    
    }
    .list_revista img
    {
        border: solid 2px #999;
        }
    .list_revista a
    {
        font:Tahoma, Arial, Helvetica, sans-serif;
        color:#999999;
        text-decoration:none;
        
        }
        .list_revista a:hover
        {
            text-decoration:underline;
         }
#ctl00_ContentPlaceHolder1_DataPager1 input
{
    font: bold 12px Tahoma, Arial, Helvetica, sans-serif;
    color:#fff;
    background: #57abcd;
    padding:6px 10px;
    }
    #ctl00_ContentPlaceHolder1_DataPager1 span
    {
        width:15px;
        padding:6px 5px;
        color:#57abcd;
        font: bold 12px Tahoma, Arial, Helvetica, sans-serif;
        margin:0 3px;
        }
        #ctl00_ContentPlaceHolder1_DataPager1 a
        {
        width:15px;
        padding:5px 5px;
        color:#fff;
        text-decoration:none;
        background:#57abcd;
        margin:0 3px;
        font: bold 12px Tahoma, Arial, Helvetica, sans-serif;
        border:solid 1px #57abcd;
        }
        #ctl00_ContentPlaceHolder1_DataPager1 a:hover
        {
        
        color:#57abcd;
        background:#fff;
        border:solid 1px #57abcd;
        
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
    <br />
    <br /><br />
    <asp:Label ID="lblresposta" runat="server" Text=""></asp:Label>
    <br />
                    <br />
                    <br />
                    </asp:Content>

