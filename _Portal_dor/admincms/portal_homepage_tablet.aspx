<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_homepage_tablet.aspx.cs" Inherits="admincms_portal_homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>Portal Rede D'or > Gerenciar Home Page</p>
 <br />
  <br />
<h2>Gerenciar Home Page</h2>
   
    <br />
    <br />
<img src="images/print_home_portal_tablet.jpg" width="800" border="0" usemap="#Map" />
<map name="Map" id="Map">
  <area shape="rect" coords="0,158,800,414" href="portal_home_slider.aspx" alt="slider" />
  <area shape="rect" coords="0,457,570,693" href="portal_home_banner.aspx?id=<% =banner1 %>" alt="banner1" />
  <area shape="rect" coords="590,457,800,693" href="portal_home_banner.aspx?id=<% =banner2 %>" alt="banner2" />
</map>
    <br />
    <br />
</asp:Content>

