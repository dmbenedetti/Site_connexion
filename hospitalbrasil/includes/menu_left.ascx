<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu_left.ascx.cs" Inherits="includes_menu_left" %>
<style>

#accordion li a{
display:block;
text-decoration:none;
font:13px "Frutiger LT 57 Cn",Arial, Verdana;
color:#436DA2;
padding:3px 0;
}


#accordion ul {
	margin:0 2px 0 0px;
	padding: 0;
	list-style: none;
	width: 145px; /* Width of Menu Items */
	}
	
#accordion ul li {
	position: relative;
	list-style:none;
    border-bottom:dotted 1px #CCDAEA;
    margin:5px 0 0 0;
    background:#fff;	
	}
	#accordion li a{
display:block;
text-decoration:none;
font:13px "Frutiger LT 57 Cn",Arial, Verdana;
color:#436DA2;
padding:3px 0;
}

	#accordion a:hover{
background:#666666;
color:#FFFFFF;}
#accordion li ul {
	position: absolute;
	left: 145px; /* Set 1px less than menu width */
	top: 0;
	display: none;
	}
	#accordion li a:hover ul
	{
	    display:block;
	    
	    }
 #accordion li ul li
 {
     margin:0 0 0 15px;
     border-top:dotted 1px #CCDAEA;
     width:200px;
     }
     #accordion li ul li a
 {
     margin:0 0 0 5px;
     padding:5px;
     font-size:12px;
     }
     /* Holly Hack. IE Requirement \*/
* html #menu_left ul li { float: left; height: 1%; }
* html #menu_left ul li a { height: 1%; }
/* End */
 
#menu_left li:hover ul, li.over ul { display: block; } /* The magic */
     </style>
<div id="menu_left">
        <img src="images/top_menu_left.jpg" width="166" />
        	<!-- Accordion -->
            <div id="accordion">
                <!-- <div>
                    <h3><a href="internas.aspx?id=1">Quem Somos</a></h3>
                    <div><a href="internas.aspx?id=1">Resultado de exames</a>
                         <a href="#">Exames disponíveis</a>
                         <a href="#">Serviços que prestamos</a>
                    </div>
                </div>
                
                
                
                <div>
                    <h3><a href="internas.aspx?id=1">Quem Somos</a></h3>
                    <div><a href="internas.aspx?id=1">Resultado de exames</a>
                         <a href="#">Exames disponíveis</a>
                         <a href="#">Serviços que prestamos</a>
                    </div>
                </div>
                <div>
                    <h3><a href="internas.aspx?id=1">Exames e Serviços</a></h3>
                    <div><a href="internas.aspx?id=1">Resultado de exames</a>
                         <a href="#">Exames disponíveis</a>
                         <a href="#">Serviços que prestamos</a>
                    </div>
                </div>
                <div>
                    <h3><a href="#">Espaço Médico</a></h3>
                    <div>
                          <a href="#">Agendamento de cirurgia</a>
                          <a href="#">Agendamento de consultas</a>
                    </div>
                </div>
                <div>
                    <h3><a href="#">Especialidades</a></h3>
                </div>
                <div>
                    <h3><a href="#">Convênios</a></h3>
                </div>
                <div>
                    <h3><a href="#">Fale Conosco</a></h3>
                </div>-->
                <ul>
                <% =paginas_menu_left%>
                </ul>
            </div>
            <!-- Fim Accordion -->
            <img src="images/bottom_menu_left.jpg" width="166" />
        </div>
        