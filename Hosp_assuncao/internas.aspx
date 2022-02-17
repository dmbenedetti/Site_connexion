<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="internas.aspx.cs" Inherits="quem_somos" Title="Hospital Assunção" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="scripts/container_core-min.js"></script> 
<script type="text/javascript" src="scripts/carousel.js"></script>
<link href="styles/carousel.css" rel="stylesheet" type="text/css">
<style type="text/css"> 
.carousel-component {
	padding:1px;
}
.carousel-component .carousel-list li { 
	margin:0 8px;
	height:125px;
	width:75px; 
}
.carousel-component .carousel-list li a { 
	display:block;
	outline:none;
	-moz-outline:none; 
}
.carousel-component .carousel-list li strong { 
	display:block; 
}
#prev-arrow { 
	position:absolute;
	top:20px;
	z-index:3;
	cursor:pointer; 
	left:5px; 
}
#next-arrow { 
	position:absolute;
	top:20px;
	z-index:3;
	cursor:pointer; 
	right:5px; 
}
</style>

<script type="text/javascript">

var imageList = ["images/galeria/0.jpg",<% =caminho_fotos %>];
var lastRan = -1;
var fmtItem = function(imgUrl, url, index) {
  	var innerHTML = 
  		'<a id="dhtml-carousel-a-'+index+'" href="' + imgUrl + '"  rel="lightbox_trabalhos"><img id="dhtml-carousel-img-' + index + '" src="' + imgUrl + '" height="' + 70 + '"/>' + '<\/a>';
	return innerHTML;
};
var loadInitialItems = function(type, args) {
	var start = args[0];
	var last = args[1]; 
	load(this, start, last);	
};
 var loadNextItems = function(type, args) {	
	var start = args[0];
	var last = args[1]; 
	var alreadyCached = args[2];
	if(!alreadyCached) {
		load(this, start, last);
	}
};
var loadPrevItems = function(type, args) {
	var start = args[0];
	var last = args[1]; 
	var alreadyCached = args[2];
	if(!alreadyCached) {
		load(this, start, last);
	}
};
var load = function(carousel, start, last) {
	for(var i=start;i<=last;i++) {
		var liItem = carousel.addItem(i, fmtItem(imageList[i], "#", i));
	}
}
var handlePrevButtonState = function(type, args) {
	var enabling = args[0];
	var leftImage = args[1];
	if(enabling) {leftImage.src = "images/prev_arrow.png";} 
	else {leftImage.src = "images/prev_arrow.png";}
};

var carousel; 
var pageLoad = function() 
{
	carousel = new YAHOO.extension.Carousel("dhtml-carousel", 
		{
			numVisible:        6,
			animationSpeed:   1.5,
			scrollInc:         6,
			navMargin:         40,
			prevElement:     "prev-arrow",
			nextElement:     "next-arrow",
			loadInitHandler:   loadInitialItems,
			loadNextHandler:   loadNextItems,
			loadPrevHandler:   loadPrevItems,
			prevButtonStateHandler:   handlePrevButtonState,
			size:<% =size_fotos %>,
			wrap:true
		}
	);
};
var stopAutoPlay = function(e) {
	YAHOO.util.Dom.get("status").innerHTML = "Auto Play Stopped!";
	carousel.stopAutoPlay();
};
var startAutoPlay = function(e) {
	YAHOO.util.Dom.get("status").innerHTML = "Auto Play Started!";
	carousel.startAutoPlay(2000);
};
YAHOO.util.Event.addListener(window, 'load', pageLoad);
YAHOO.util.Event.addListener("stop-button", 'click', stopAutoPlay);
YAHOO.util.Event.addListener("start-button", 'click', startAutoPlay);
</script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <br />
    <!-- Inicio da galeria de fotos-->
<!-- Carousel Structure -->
<div id="dhtml-carousel" class="carousel-component">
	<div><img id="prev-arrow" class="left-button-image" src="images/prev_arrow.png" alt="Previous Button"/>
	</div>
	<div><img id="next-arrow" class="right-button-image" src="images/next_arrow.png" alt="Next Button"/>
	</div>
	<div class="carousel-clip-region">
		<ul class="carousel-list">
			
		</ul>
	</div>
</div>
<!-- Fim Carousel Structure -->	

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-1730884-8']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</asp:Content>

