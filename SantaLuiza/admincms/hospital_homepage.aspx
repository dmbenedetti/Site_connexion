<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="hospital_homepage.aspx.cs" Inherits="admincms_portal_homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>Portal Rede D'or > Gerenciar Home Page</p>
 <br />
  <br />
<h2>Gerenciar Home Page</h2>
   
    <br />
    <br />
<img src="images/print_home_portal_hosp.jpg" border="0" usemap="#Map" />
<map name="Map" id="Map">
  <area shape="rect" coords="5,90,632,290" href="portal_home_slider.aspx" alt="slider" />
  <area shape="rect" coords="5,306,152,452" href="portal_home_banner.aspx?id=<% =banner1 %>&idPosicao=1" alt="banner1" />
  <area shape="rect" coords="165,306,312,452" href="portal_home_banner.aspx?id=<% =banner2 %>&idPosicao=2" alt="banner2" />
  <area shape="rect" coords="325,306,472,452" href="portal_home_banner.aspx?id=<% =banner3 %>&idPosicao=3" alt="banner3" />
  <area shape="rect" coords="485,306,637,452" href="portal_home_banner.aspx?id=<% =banner4 %>&idPosicao=4" alt="banner4" />
  <area shape="rect" coords="5,466,152,611" href="portal_home_banner.aspx?id=<% =banner5 %>&idPosicao=5" alt="banner5" />
  <area shape="rect" coords="165,466,312,611" href="portal_home_banner.aspx?id=<% =banner6 %>&idPosicao=6" alt="banner6" />
  <area shape="rect" coords="325,466,472,611" href="portal_home_banner.aspx?id=<% =banner7 %>&idPosicao=7" alt="banner7" />
  <area shape="rect" coords="485,466,637,611" href="portal_home_banner.aspx?id=<% =banner8 %>&idPosicao=8" alt="banner8" />
</map>
    <br />
    <br />
</asp:Content>

