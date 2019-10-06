<%-- 
    Document   : Subscriber
    Created on : 9/09/2019, 03:25:21 AM
    Author     : jara
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Clases.Revista" %>
<%@page import="Clases.ControladorRRevista" %>
<%@page import="Clases.Pdf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                                    <li class="scroll_btn"><a href="#Suscritas" >Mis Revistas</a></li>
                                    <li class="scroll_btn"><a href="#projects" >Informacion</a></li>
                                    <li class="scroll_btn last"><a href="#contacts" >Contacts</a></li>                                   
                                    <li>
                                        <!-- SEARCH FORM -->
                                        <div id="search-form" class="pull-right">
                                            <form method="get" action="#">
                                                <input type="text" name="Search" value="Search" onFocus="if (this.value == 'Search')
                                                            this.value = '';" onBlur="if (this.value == '')
                                                                        this.value = 'Search';" />
                                            </form>
                                        </div><!-- SEARCH FORM --></li>
                                </ul>
                            </nav>
                        </div><!-- //MENU -->
                    </div><!-- //MENU BLOCK -->
                </div>

            </header>
            <div>
                <center id="home" class="padbot0">
                    <h1>Suscriptor EN USO: <%out.print(session.getAttribute("SesionU"));%></h1>
                    <img src="ShowImage?name='nombre'" height="150px" width="150px">
                    <p>Fecha de Login <%=LocalDate.now()%></p>
                    <a href="ControladorCerrarSesion">Cerrar Sesion</a>
                    <h1>Previsualizacion de Revistas:</h1>
                </center>
            </div>
            <div class="datagrid">
                <%  Pdf p = new Pdf();
                    Revista re = new Revista();
                    ArrayList<Revista> listLector = p.Lector_Pdf();
                %> 
                <table>
                    <thead>
                        <tr>
                            <th>Codigo Revista</th>
                            <th>Nombre de la Revista</th>
                            <th>Autor</th>
                            <th>Etiqueta</th>
                            <th>Descripcion</th>
                            <th>Categoria</th>
                            <th>Precio x Suscripcion</th>
                            <th>Fecha Creacion</th>
                            <th>Suscribirse</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td colspan="9">
                                <div id="paging">
                                    <ul><li><a href="#"><span>Previous</span></a></li><li><a href="#" class="active"><span>1</span></a></li><li><a href="#"><span>2</span></a></li><li><a href="#"><span>3</span></a></li><li><a href="#"><span>4</span></a></li><li><a href="#"><span>5</span></a></li><li><a href="#"><span>Next</span></a></li></ul>
                                </div>
                        </tr>
                    </tfoot>
                    <tbody>
                        <%if (listLector.size() > 0) {
                                for (Revista listar2 : listLector) {
                                    re = listar2;
                        %>
                        <tr>
                            <td><%=re.getCodigoR()%></td>
                            <td><%=re.getNombre()%></td>
                            <td><%=re.getAutor()%></td>
                            <td><%=re.getEtiqueta()%></td>
                            <td><%=re.getDescripcionR()%></td>
                            <td><%=re.getCategoria()%></td>
                            <td><%=re.getCuotaS()%></td>
                            <td><%=re.getFechaCreacion()%></td>
                            <td>
                                <a href="PagoSuscripcion.jsp" target="_blank"><img src="images/2.png" height="50px" width="50px"  title="Suscribete" /></a>
                            </td>
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
            <div id="Suscritas">
                <center >
                    <h1>Revistas Disponibles:</h1>
                </center>
            </div>
            <div class="datagrid">
                <%  Pdf pd = new Pdf();
                    Revista res = new Revista();
                    ArrayList<Revista> listarSus = pd.RevistaP_Pdf();
                %> 
                <table>
                    <thead>
                        <tr>
                            <th>Codigo Revista</th>
                            <th>Nombre de la Revista</th>
                            <th>Autor</th>
                            <th>Etiqueta</th>
                            <th>Descripcion</th>
                            <th>Categoria</th>
                            <th>Couta de Suscripcion</th>
                            <th>Fecha Creacion</th>
                            <th>PDF</th>
                            <th>Me Gusta</th>
                            <th>Comentar</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td colspan="11">
                                <div id="paging">
                                    <ul><li><a href="#"><span>Previous</span></a></li><li><a href="#" class="active"><span>1</span></a></li><li><a href="#"><span>2</span></a></li><li><a href="#"><span>3</span></a></li><li><a href="#"><span>4</span></a></li><li><a href="#"><span>5</span></a></li><li><a href="#"><span>Next</span></a></li></ul>
                                </div>
                        </tr>
                    </tfoot>
                    <tbody>
                        <%if (listarSus.size() > 0) {
                                for (Revista listar4 : listarSus) {
                                    res = listar4;
                        %>
                        <tr>
                            <td><%=res.getCodigoR()%></td>
                            <td><%=res.getNombre()%></td>
                            <td><%=res.getAutor()%></td>
                            <td><%=res.getEtiqueta()%></td>
                            <td><%=res.getDescripcionR()%></td>
                            <td><%=res.getCategoria()%></td>
                            <td><%=res.getCuotaS()%></td>
                            <td><%=res.getFechaCreacion()%></td>
                            <td>
                                <%
                                    if (res.getPdf() != null) {
                                %>
                                <a href="ShowPdf?" target="_blank" ><img src="images/1.png" height="50px" width="50px"  title="Like" /></a>
                                    <%
                                        } else {
                                            out.print("Anonymous");
                                        }
                                    %>
                            </td>
                            <td>
                                <a href="ControladorReacciones?action=Like&id=<%=res.getCodigoR()%>&user=<%out.print(session.getAttribute("SesionU"));%>" target="_blank"><img src="images/like.png" height="50px" width="50px"  title="Like" /></a>
                            </td>
                            <td>
                                <a href="ControladorReacciones?action=Comentario&id=<%=res.getCodigoR()%>&user=<%out.print(session.getAttribute("SesionU"));%>" target="_blank"><img src="images/c.jpg" height="50px" width="50px"  title="Comenta" /></a>
                            </td>
                        </tr>
                        <%}
                            }%>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>