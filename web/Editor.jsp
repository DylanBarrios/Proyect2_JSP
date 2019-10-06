<%-- 
    Document   : Editor
    Created on : 9/09/2019, 03:25:02 AM
    Author     : jara
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Clases.Revista" %>
<%@page import="Clases.ControladorRRevista" %>
<%@page import="Clases.Pdf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
    <body>
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
                                    <li class="scroll_btn"><a href="CreateRevista.jsp" >Crear Revista</a></li>
                                    <li class="scroll_btn"><a href="#Aprobadas" >Revistas Aprobadas</a></li>                                   
                                    <li class="scroll_btn"><a href="#projects" >Informacion</a></li>
                                    <li class="sub-menu">
                                        <a href="javascript:void(0);" >Reportes</a>
                                        <ul>
                                            <li><a href="blog.html" >Comentarios</a></li>
                                            <li><a href="blog-post.html" >Suscripciones</a></li>
                                            <li><a href="portfolio-post.html" >Las más gustadas</a></li>
                                            <li><a href="blog-post.html" >Ganancias</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                </ul>
                            </nav>
                        </div><!-- //MENU -->
                    </div><!-- //MENU BLOCK -->
                </div>

            </header>
            <div>
                <center id="home" class="padbot0">
                    <h1>Editor EN USO: <%out.print(session.getAttribute("usuario"));%></h1>
                    <img src="ShowImage?name='nombre'" height="150px" width="150px">
                    <p>Fecha de Login <%=LocalDate.now()%></p>
                </center>
            </div>
            <div>
                <center >
                    <p>Revistas Pendientes de Aprobacion:</p>
                </center>
            </div>
            <div class="datagrid">
                <%  Pdf p = new Pdf();
                    Revista re = new Revista();
                    ArrayList<Revista> listar = p.Listar_Pdf();
                %> 
                <table>
                    <thead>
                        <tr>
                            <th>Nombre de la Revista</th>
                            <th>Autor</th>
                            <th>Fecha Creacion</th>
                            <th>PDF</th>
                            <th>Me Gustas</th>  
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
                        <%if (listar.size() > 0) {
                                for (Revista listar2 : listar) {
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
                            <td><a>Hola</a></td>

                        </tr>
                        <%}
                            }%>
                    </tbody>
                </table>
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
            <div id="Aprobadas">
                <center >
                    <p>Revistas Aprobadas:</p>
                </center>

                <div class="datagrid">
                    <%Pdf pdf = new Pdf();
                        Revista res = new Revista();
                        ArrayList<Revista> listarA = pdf.ListaAprobada_Pdf();
                    %> 
                    <table>
                        <thead>
                            <tr>
                                <th>Nombre de la Revista</th>
                                <th>Autor</th>
                                <th>Fecha Creacion</th>
                                <th>PDF</th>
                                <th>Me Gustas</th>  
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
                            <%if (listarA.size() > 0) {
                                    for (Revista listar3 : listarA) {
                                        res = listar3;
                            %>
                            <tr>
                                <td><%=res.getNombre()%></td>
                                <td><%=res.getAutor()%></td>
                                <td><%=res.getFechaCreacion()%></td>
                                <td>
                                    <%
                                        if (res.getPdf() != null) {
                                    %>
                                    <a href="ShowPdf?autor='<%=res.getAutor()%>'" target="_blank" ><img src="images/1.png" height="50px" width="50px"  title="pdf" /></a>
                                        <%
                                            } else {
                                                out.print("Vacio");
                                            }
                                        %>
                                </td>
                                <td><a>Hola</a></td>

                            </tr>
                            <%}
                                }%>
                        </tbody>
                    </table>
                </div>
            </div> 
        </div>
    </body>
</html>
