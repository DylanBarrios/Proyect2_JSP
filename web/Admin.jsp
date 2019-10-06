<%-- 
   Document   : Admin
   Created on : 9/09/2019, 03:24:21 AM
   Author     : jara
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Revista" %>
<%@page import="Clases.ControladorRRevista" %>
<%@page import="Clases.Pdf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/flexslider.css" rel="stylesheet" type="text/css" />
        <link href="css/prettyPhoto.css" rel="stylesheet" type="text/css" />
        <link href="css/animate.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/owl.carousel.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>
        <script src="js/jquery.nicescroll.min.js" type="text/javascript"></script>
        <script src="js/superfish.min.js" type="text/javascript"></script>
        <script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
        <script src="js/owl.carousel.js" type="text/javascript"></script>
        <script src="js/animate.js" type="text/javascript"></script>
        <script src="js/jquery.BlackAndWhite.js"></script>
        <script src="js/myscript.js" type="text/javascript"></script>
        <link href="css/styless.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <%
            session.setAttribute("usuario", request.getParameter("nombreL"));
        %>
    </head>
    <body id="fondo">
        <!-- PRELOADER -->
        <img id="preloader" src="images/preloader.gif" alt="" /> 
        <!-- //PRELOADER -->
        <div class="preloader_hide">
            <header>
                <div id="page">
                    <div class="menu_block">
                        <!-- MENU -->
                        <div class="pull-right">
                            <nav class="navmenu center">
                                <ul>
                                    <li class="first active scroll_btn"><a href="#home" >Home</a></li>
                                    <li class="scroll_btn"><a href="#fijarCuota" >Fijar Costo por Dia</a></li>
                                    <li class="scroll_btn"><a href="" >Informacion</a></li>
                                    <li class="sub-menu">
                                        <a href="javascript:void(0);" >Reportes</a>
                                        <ul>
                                            <li><a href="blog.html" >Ganancias</a></li>
                                            <li><a href="blog-post.html" >Top 5 Popularidad</a></li>
                                            <li><a href="portfolio-post.html" >Top 5 Comentadas</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div><!-- //MENU -->
                    </div><!-- //MENU BLOCK -->
                </div>

            </header>
            <div>
                <center id="home" class="padbot0">
                    <h1>Administrador en uso: <%out.print(session.getAttribute("usuario"));%></h1>
                    <img src="ShowImage?name='nombre'" height="150px" width="150px">
                    <p>Fecha de Login <%=LocalDate.now()%></p>
                </center>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <div id="fijarCuota">
                <div class="container">
                    <div class="datagrid">
                        <div class="datagrid">
                            <%  Pdf p = new Pdf();
                                Revista re = new Revista();
                                ArrayList<Revista> listaAd = p.ListaAdmin_Pdf();
                            %> 
                            <table>
                                <thead>
                                    <tr>
                                        <th>Nombre de la Revista</th>
                                        <th>Autor</th>
                                        <th>Fecha Creacion</th>
                                        <th>PDF</th>
                                        <th>Fijar Cuota</th>  
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <td colspan="5">
                                            <div id="paging">
                                                <ul><li><a href="#"><span>Previous</span></a></li><li><a href="#" class="active"><span>1</span></a></li><li><a href="#"><span>2</span></a></li><li><a href="#"><span>3</span></a></li><li><a href="#"><span>4</span></a></li><li><a href="#"><span>5</span></a></li><li><a href="#"><span>Next</span></a></li></ul>
                                            </div>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <%if (listaAd.size() > 0) {
                                            for (Revista listar2 : listaAd) {
                                                re = listar2;
                                    %>
                                    <tr>
                                        <td><%=re.getNombre()%></td>
                                        <td><%=re.getAutor()%></td>
                                        <td><%=re.getFechaCreacion()%></td>
                                        <td>
                                            <%
                                                if (re.getPdf() != null) {
                                            %>
                                            <a href="ShowPdf?autor='<%=re.getAutor()%>'" target="_blank" ><img src="images/1.png" height="50px" width="50px"  title="pdf" /></a>
                                                <%
                                                    } else {
                                                        out.print("Vacio");
                                                    }
                                                %>
                                        </td>
                                        <td><a href="fijarCuota.jsp" target="_blank"><img src="images/editar.png" height="50px" width="50px"  title="Suscribete" /></a>
                                        </td>

                                    </tr>
                                    <%}
                                        }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <div id="informacion">
                    <div class="container"></div>
                </div>
            </div>
    </body>
</html>
