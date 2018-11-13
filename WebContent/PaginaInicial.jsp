<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="util.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	<link rel="stylesheet" href="css/style.css">
	<link rel="shortcut icon" type="image/x-png" href="imagens/favicon.png">
	<title>CIF | P�gina Inicial</title>
</head>
<body>
	<%
		Usuario u = (Usuario) session.getAttribute("usuario");
		String coisa = request.getParameter("coisa");
		if((u.getNomeCartoleiro() == null) && (u.getNomeTime() == null)){
			response.sendRedirect("tutorial.jsp");
		}
	%>
	<!--   MENU   -->
  <div class="bg">
    <div class="container-fixed fixed-top cima">
      <nav class="navbar navbar-light" style= "background-color: #006400;">

        <div class="botaoMenu">
          <a href="#" onclick="openSlideMenu()">
            <svg width="30" height="30">
              <path d="M0,5 30,5" stroke=#fff stroke-width="4" />
              <path d="M0,15 30,15" stroke=#fff stroke-width="4" />
              <path d="M0,25 30,25" stroke=#fff stroke-width="4" />
            </svg>
          </a>
        </div>

        <div id="logo">
          <a href="PaginaInicial.jsp"><img src="imagens/icones/Logo_branca.png" height="40" width="55"></div></a>
        </div>

        <div id="side-menu" class="side-nav" style="z-index: 3000;">
          <a href="#" class="fixed-top btn-close" onclick="closeSlideMenu()"> 
            <svg width="30" height="30">
              <path d="M0,5 30,5" stroke=#006400 stroke-width="4" />
              <path d="M0,15 30,15" stroke=#006400 stroke-width="4" />
              <path d="M0,25 30,25" stroke=#006400 stroke-width="4" />
            </a></svg>
            <b><h1>MENU</h1></b>

            <div class="verdeItems">

              <hr style="height:1px; border:none; background-color:#D8D8D8; margin-top: 0px; "/>
              <div class="iconeMenu"><img src="imagens/icones/Home.png" height="30" width="30"><a href="PaginaInicial.jsp">In�cio</a></div>

              <hr style="height:1px; border:none; background-color:#F0F0F0;  margin-right: 10px; margin-left: 10px;"/>
              <div class="iconeMenu"><img src="imagens/icones/Perfil.png" height="30" width="30"><a href="MeuPerfil.jsp">Perfil</a></div>

              <hr style="height:1px; border:none; background-color:#F0F0F0;  margin-right: 10px; margin-left: 10px;"/>
              <div class="iconeMenu"><img src="imagens/icones/Ligas.png" height="30" width="30"><a href="Ligas.jsp">Ligas</a></div>

              <hr style="height:1px; border:none; background-color:#F0F0F0;  margin-right: 10px; margin-left: 10px;"/>
              <div class="iconeMenu"><img src="imagens/icones/Escalar.png" height="30" width="30"><a href="MostrarJogadores.jsp">Escala��o</a></div>

              <hr style="height:1px; border:none; background-color:#F0F0F0;  margin-right: 10px; margin-left: 10px;"/>
              <div class="iconeMenu"><img src="imagens/icones/Guia.png" height="30" width="30"><a href="GuiaJogos.jsp">Guia</a></div>

            </div>

            <div class="cinzaItems">
              <%
        		if((u.getidTipoUsuario() == 1) || (u.getidTipoUsuario() == 2)){
        			out.println("<hr style='height:1px; border:none; background-color:#F0F0F0;  margin-right: 10px; margin-left: 10px;'/>");
        			out.println("<div class='iconeMenu'><img src='imagens/icones/Admin.png' height='30' width='30'><a href='crud.jsp'>Adminstrador</a></div>");
        		}
        	%>
              <hr style="height:1px; border:none; background-color:#F0F0F0;  margin-right: 10px; margin-left: 10px;"/>
              <div class="iconeMenu"><img src="imagens/icones/Sobre.png" height="30" width="30"><a href="#" data-toggle="modal" data-target="#ajudaModal">Ajuda</a></div>

              <hr style="height:1px; border:none; background-color:#F0F0F0;  margin-right: 10px; margin-left: 10px;"/>
              <div class="iconeMenu"><img src="imagens/icones/Logout.png" height="30" width="30"><a href="Sair">Sair</a></div>

            </div>
            <div class="foot">CIF - v3.0
            </div>
          </nav>
        </a>
      </div>
      <!--   BODY   -->
      <div class="modal fade" id="ajudaModal" tabindex="-1" role="dialog" aria-labelledby="ajudaModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <center><h5 class="modal-title" id="ajudaModal"><b>Ajuda</center></b></h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              O <b>Cartola IF</b> � um sistema de apostas, em que os usu�rios criam escala��es de jogadores e acumulam pontos em cada acerto, com base na avalia��o do CIF.<br><br>

              <b style="color: #1a1a1a; font-size: 25px;">Como altero minha senha?</b><br>
              Na aba "Perfil" voc� ter� acesso �s suas ligas, suas escala��es e poder� fazer altera��es em sua conta.<br><br>

              <b style="color: #1a1a1a; font-size: 25px;">Como escalo um time?</b><br>
              Na aba "Escala��o" voc� ter� acesso aos jogadores e suas pontua��es, podendo selecion�-los para sua escala��o, clicando no bot�o "Escalar Time".<br><br>

              <b style="color: #1a1a1a; font-size: 25px;">Como entro/crio uma liga?</b><br>
              Na aba "Ligas" voc� ter� acesso �s suas ligas, ver o nome e pontua��es dos usu�rios da liga, e poder� criar novas ligas.<br><br>

              <b style="color: #1a1a1a; font-size: 25px;">Como acompanho os jogos?</b><br>
              Na aba "Guia" voc� ter� informa��o de todos os jogos que ocorreram ou ainda v�o acontecer, e tamb�m visualizar o placar, local e hor�rio.
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Ok</button>
            </div>
          </div>
        </div>
      </div>
	
	<div class="janelas container">
		<div class= row>
	<%
		/*
		top 3 jogadores mais escalados na rodada,
		top 3 jogadores que mais pontuaram na rodada,
    	top 3 usuarios com a pontua��o mais alta da rodada,       
    	*/
        Util util = new Util();
		CursoDAO cdao = new CursoDAO();
        UsuarioDAO ud = new UsuarioDAO();
        JogadorDAO jd = new JogadorDAO();
        if(!util.terminou()){
            // Top 3 usuarios que mais pontuaram na rodada.
            ArrayList<Top> lista;
            lista = ud.top3Rodada(util.rodadaCorrente() - 1);
            if(lista.isEmpty()){
            	out.println("<div class=' container col-sm-12 col-lg-8 col-xl-8'>");
                out.println("<h2>TOP 3 TIMES DA RODADA</h2>");
                out.println("<div class='janelaVazia'>");
                out.println("<center><img src='imagens/icones/Vazio.png'  height='100px' width='100px' style='margin-top: 30px;'></center>");
                out.println("<center><div class='texto'>Ainda sem dados!</div> </center>");
                out.println("<hr style='height:2px; border:none; background-color:#DCDCDC;  margin-right: 20px; margin-left: 20px; margin-top: 77px; margin-bottom: 0px;'/>");
                out.println("<div class='rodapeJanelaVazia'><a href='MostrarJogadores.jsp'>ESCALE SEU TIME</a></div>");
                out.println("</div>");
                out.println("</div>");
                
            }else{
            	out.println("<div class=' container col-sm-12 col-lg-8 col-xl-8'>");
                out.println("<h2>TOP 3 TIMES DA RODADA</h2>");
                out.println("<div class='janelaTexto'>");
                int c = 0;
                while(c < lista.size()){
                	out.println("<div class='tabelaTexto'>");
                	out.println("<h1>"+(c+1)+"</h1>");
                	out.println("<h3>"+lista.get(c).getNome()+"</h3>");
                	out.println("<h4>"+lista.get(c).getNomeTime()+"</h4>");
                	out.println("<h5>"+util.pontoFlutuante(lista.get(c).getPontuacao(), 2)+" Pontos</h5>");
                    c++;
                    out.println("</div>");
                }
                out.println("<div class='rodapeJanelaTXT'><a href='#'>ESCALE SEUS JOGADORES</a></div>");
                out.println("</div>");
                out.println("</div>");
            }
            //Top 3 Rodada
            lista.clear();
            lista = jd.top3Rodada(util.rodadaCorrente() - 1);
            if(lista.isEmpty()){
            	out.println("<div class=' container col-sm-12 col-lg-8 col-xl-8'>");
                out.println("<h2>TOP 3 PONTUADORES DA RODADA</h2>");
                out.println("<div class='janelaVazia'>");
                out.println("<center><img src='imagens/icones/Vazio.png'  height='100px' width='100px' style='margin-top: 30px;'></center>");
                out.println("<center><div class='texto'>Ainda sem dados!</div> </center>");
                out.println("<hr style='height:2px; border:none; background-color:#DCDCDC;  margin-right: 20px; margin-left: 20px; margin-top: 77px; margin-bottom: 0px;'/>");
                out.println("<div class='rodapeJanelaVazia'><a href='MostrarJogadores.jsp'>ESCALE SEU TIME</a></div>");
                out.println("</div>");
                out.println("</div>");
            }else{
            	out.println("<div class=' container col-sm-12 col-lg-8 col-xl-8'>");
                out.println("<h2>TOP 3 PONTUADORES DA RODADA</h2>");
                out.println("<div class='janelaImagem'>");
                int c = 0;
                while(c < lista.size()){
                	Jogador j = jd.selectAll("WHERE idJogador = '"+lista.get(c).getIdGuambiarra()+"'").get(0);
                	String cursos = util.tratarPasta(cdao.selectAll("WHERE idCurso ='"+j.getCursoJogador()+"'").get(0).getNomeCurso());
                	out.println("<div class='tabelaImagem'>");
                	out.println("<h1>"+(c+1)+"</h1>");
                	out.println("<div class='fotosJog'><img src='imagens/jogadores/"+cursos+"/"+lista.get(c).getNomeTime()+"'></div>");
                	out.println("<h3>"+lista.get(c).getNome()+"</h3>");
                	out.println("<h4>"+util.pontoFlutuante(lista.get(c).getPontuacao(), 2)+" Pontos</h4>");
                    c++;
                    out.println("</div>");
                }
                out.println("<div class='rodapeJanelaIMG'><a href='#'>ESCALE SEUS JOGADORES</a></div>");
                out.println("</div>");
                out.println("</div>");
            }
            // Top 3 jogadores mais escalados na rodada
            lista.clear();
            lista = jd.top3Escalados(util.rodadaCorrente() - 1);
            if(lista.isEmpty()){
            	out.println("<div class=' container col-sm-12 col-lg-8 col-xl-8'>");
                out.println("<h2>TOP 3 JOGADORES MAIS ESCALADOS DA RODADA</h2>");
                out.println("<div class='janelaVazia'>");
                out.println("<center><img src='imagens/icones/Vazio.png'  height='100px' width='100px' style='margin-top: 30px;'></center>");
                out.println("<center><div class='texto'>Ainda sem dados!</div> </center>");
                out.println("<hr style='height:2px; border:none; background-color:#DCDCDC;  margin-right: 20px; margin-left: 20px; margin-top: 77px; margin-bottom: 0px;'/>");
                out.println("<div class='rodapeJanelaVazia'><a href='MostrarJogadores.jsp'>ESCALE SEU TIME</a></div>");
                out.println("</div>");
                out.println("</div>");
            }else{
            	out.println("<div class=' container col-sm-12 col-lg-8 col-xl-8'>");
                out.println("<h2>TOP 3 JOGADORES MAIS ESCALADOS DA RODADA</h2>");
                out.println("<div class='janelaImagem'>");
                int c = 0;
                while(c < lista.size()){
                	Jogador j1 = jd.selectAll("WHERE idJogador = '"+lista.get(c).getIdGuambiarra()+"'").get(0);
                	String cursos = util.tratarPasta(cdao.selectAll("WHERE idCurso ='"+j1.getCursoJogador()+"'").get(0).getNomeCurso());
                	out.println("<div class='tabelaImagem'>");
                	out.println("<h1>"+(c+1)+"</h1>");
                	out.println("<div class='fotosJog'><img src='imagens/jogadores/"+cursos+"/"+lista.get(c).getNomeTime()+"'></div>");
                	out.println("<h3>"+lista.get(c).getNome()+"</h3>");
                	out.println("<h4>"+util.pontoFlutuante(lista.get(c).getPontuacao(), 0)+" Escala��es</h4>");
                    c++;
                    out.println("</div>");
                }
                out.println("<div class='rodapeJanelaIMG'><a href='#'>ESCALE SEUS JOGADORES</a></div>");
                out.println("</div>");
                out.println("</div>");
            }
        }else{
            /*
                Quer dizer que o campeonato acabou e agora tem q mostrar os 
                vencedores das categorias:
                Papa Ponto: Jogador que mais pontou na soma de todas as rodadas em que ele participou.
                Popularidade: Jogador que mais foi escalado no campeonato.
                Mestre do Campeanato: Usu�rio que somou mais pontos em todo o campeonato*/
            
            //Papa ponto
            out.println("<div class='container col-sm-12 col-lg-8 col-xl-6'>");
        	out.println("<h2>PREMIA��ES</h2>");
        	out.println("<div class='janelaT1'>");
        	out.println("<div class='table-responsive'>");
        	out.println("<table  cellpadding='5px' cellspacing='0' ID='alter' style= 'text-align: center; width: 100%;'>");
        	out.println("<tr class='topo'>");
        	out.println("<th>Ganhador</th>");
        	out.println("<th>Nome</th>");
        	out.println("<th>Quantidade</th>");
        	out.println("<th>Trof�u</th>");
        	out.println("</tr>");
            Top t = jd.papaPonto();
            Jogador j1 = jd.selectAll("WHERE idJogador = '"+t.getIdGuambiarra()+"'").get(0);
        	String cursos = util.tratarPasta(cdao.selectAll("WHERE idCurso ='"+j1.getCursoJogador()+"'").get(0).getNomeCurso());
        	out.println("<tr class='dif'>");
        	out.println("<td><img class='fotoTabela img-fluid' alt='Responsive image' src='imagens/jogadores/"+cursos+"/"+t.getNomeTime()+"'></td>");
        	out.println("<td><b>"+t.getNome()+"</b></td>");
        	out.println("<td>"+util.pontoFlutuante(t.getPontuacao(), 2)+" Pontos</td>");
        	out.println("<td>Papa Ponto</td>");
            out.println("</tr>");
            //Popularidade
            t = jd.popularidade();
            //j1 = jd.selectAll("WHERE idJogador = '"+t.getIdGuambiarra()+"'").get(0);
        	cursos = util.tratarPasta(cdao.selectAll("WHERE idCurso ='"+t.getIdGuambiarra()+"'").get(0).getNomeCurso());
            out.println("<tr>");
            out.println("<td><img class='fotoTabela' src='imagens/jogadores/"+cursos+"/"+t.getNomeTime()+"'></td>");
            out.println("<td><b>"+t.getNome()+"</b></td>");
            out.println("<td>"+util.pontoFlutuante(t.getPontuacao(), 0)+" Escala��es</td>");
            out.println("<td>Popularidade</td>");
            out.println("</tr>");
            //Mestre do Campeonato
            t = ud.mestreDoCampeonato();
            out.println("<tr class='dif'>");
            out.println("<td>"+t.getNomeTime()+"</td>");
            out.println("<td><b>"+t.getNome()+"</b></td>");
            out.println("<td>"+util.pontoFlutuante(t.getPontuacao(), 2)+" Pontos</td>");
            out.println("<td>Mestre do Campeoato</td>");
            out.println("</tr>");
            out.println("</table>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
        }
        ud.closeDataBase();
        jd.closeDataBase();
	%>
		</div>
	</div>
	<div class="footer">
		Todos os direitos reservados.| Desenvolvido por <a href="https://www.instagram.com/douglasm.jpg/" target="_blank">Erick Douglas</a> e <a href="https://www.instagram.com/_paulinc3/" target="_blank">Paulo Roberto.</a>
	</div>
	</div>
    <script>
        function openSlideMenu(){
			document.getElementById('side-menu').style.width = '250px';
			document.getElementById('main').style.marginLeft = '250px';
        }
        function closeSlideMenu(){
			document.getElementById('side-menu').style.width = '0px';
			document.getElementById('main').style.marginLeft = '0px';
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	<script>
		$(document).ready(
				function() {

					var docHeight = $(window).height();
					var footerHeight = $('.footer').height();
					var footerTop = $('.footer').position().top + footerHeight;

					if (footerTop < docHeight) {
						$('.footer').css('margin-top',
								-25 + (docHeight - footerTop) + 'px');
					}
				});
	</script>
	<script type="text/javascript">
	    (function($){
	      $.fn.backgroundMove=function(options){
	        var defaults={
	          movementStrength:'10'
	        },
	        options=$.extend(defaults,options);
	
	        var $this = $(this);
	
	        var movementStrength = options.movementStrength;
	        var height = movementStrength / $(window).height();
	        var width = movementStrength / $(window).width();
	        $this.mousemove(function(e){
	          var pageX = e.pageX - ($(window).width() / 2);
	          var pageY = e.pageY - ($(window).height() / 2);
	          var newvalueX = width * pageX * -1 - 25;
	          var newvalueY = height * pageY * -1 - 50;
	          $this.css("background-position", newvalueX+"px "+newvalueY+"px");
	        });
	
	      }
	    })(jQuery);
	
	    $('.bg').backgroundMove({
	      movementStrength:'10'
	    });
	</script>
</body>
</html>