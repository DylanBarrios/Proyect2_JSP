<%-- 
    Document   : Editor
    Created on : 9/09/2019, 03:25:02 AM
    Author     : jara
--%>
<%@page import="Clases.ConectorBD" %>
<%@page import="Clases.ControladorPopularidad" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page session="true" %>
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
                                            <li><a href="ShowComentarios.jsp" >Comentarios</a></li>
                                            <li><a href="ShowSuscripcion.jsp" >Suscripciones</a></li>
                                            <li><a href="Popularidad.jsp" >Las más gustadas</a></li>
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
                    <h1>Editor EN USO: <%out.print(session.getAttribute("SesionU"));%></h1>
                    <img src="ShowImage?name='nombre'" height="150px" width="150px">
                    <p>Fecha de Login <%=LocalDate.now()%></p>
                    <a href="ControladorCerrarSesion">Cerrar Sesion</a>
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
                            <th>Codigo Revista</th>
                            <th>Nombre de la Revista</th>
                            <th>Autor</th>
                            <th>Fecha Creacion</th>
                            <th>PDF</th>
                            <th>Ver Reacciones</th>  
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td colspan="6">
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
                            <td><%=re.getCodigoR()%></td>
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
                            <td>
                                <a href="" target="_blank"><img src="images/rea.png" height="50px" width="50px"  title="Reacciones" /></a>
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
                                <th>Codigo Revista</th>
                                <th>Nombre de la Revista</th>
                                <th>Autor</th>
                                <th>Fecha Creacion</th>
                                <th>PDF</th>
                                <th>Reacciones</th>  
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="6">
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
                                <td><%=res.getCodigoR()%></td>
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
                                <td>
                                    <a href="" target="_blank"><img src="images/rea.png" height="50px" width="50px"  title="Reacciones" /></a>
                                </td>
                            </tr>
                            <%}
                                }%>
                        </tbody>
                    </table>
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
            <div class="datagrid"> 
                <%

                    Connection cn = ConectorBD.conexion();
                    String fechai = request.getParameter("fechai");
                    String fechao = request.getParameter("fechao");

                    PreparedStatement ps1;
                    ResultSet rs1;
                    ps1 = cn.prepareStatement("SELECT COUNT(meGusta) AS cant, revista, fechaReaccion FROM Reacciones WHERE  meGusta='1' AND fechaReaccion BETWEEN '" + fechai + "' AND '" + fechao + "' GROUP BY revista desc");
                    rs1 = ps1.executeQuery();
                %>
                <table>
                    <tr>
                        <th>Cantidad de Likes</th>
                        <th>Nombre de la Revista</th>
                        <th>Fecha de Reaccion</th>
                    </tr>
                    <%                while (rs1.next()) {

                    %>
                    <tr>
                        <td><%=rs1.getInt("cant")%></td>
                        <td><%=rs1.getString("revista")%></td>
                        <td><%=rs1.getString("fechaReaccion")%></td>             
                    </tr>
                    <%
                        }%>
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
            <div class="datagrid"> 
                <%

                    String fechaCi = request.getParameter("fechaCI");
                    String fechaCo = request.getParameter("fechaCF");

                    PreparedStatement ps2;
                    ResultSet rs2;
                    ps2 = cn.prepareStatement("SELECT usuario, revista, comentarios, fechaReaccion FROM Reacciones WHERE comentarios!='' AND fechaReaccion BETWEEN '" + fechaCi + "' AND '" + fechaCo + "'");
                    rs2 = ps2.executeQuery();
                %>
                <table>
                    <tr>
                        <th>Usuario</th>
                        <th>Nombre de la Revista</th>
                        <th>Comentarios</th>
                        <th>Fecha de Reaccion</th>
                    </tr>
                    <%                while (rs2.next()) {

                    %>
                    <tr>
                        <td><%=rs2.getString("usuario")%></td>
                        <td><%=rs2.getString("revista")%></td>
                        <td><%=rs2.getString("comentarios")%></td>
                        <td><%=rs2.getString("fechaReaccion")%></td>
                    </tr>
                    <%
                        }%>
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
            <div class="datagrid"> 
                <%
                    String fechaSI = request.getParameter("fechaSI");
                    String fechaSF = request.getParameter("fechaSF");
                    PreparedStatement ps3;
                    ResultSet rs3;
                    ps3 = cn.prepareStatement("SELECT DISTINCT User.name, Revistas.nombreR, Suscripcion.fecha_suscripcion FROM Suscripcion JOIN Revistas ON(Suscripcion.id_revista=Revistas.id_revista) JOIN User ON(Suscripcion.id_user=User.id_user) WHERE Suscripcion.fecha_suscripcion BETWEEN '" + fechaSI + "' AND '" + fechaSF + "'");
                    rs3 = ps3.executeQuery();
                %>
                <table>
                    <tr>
                        <th>Usuario</th>
                        <th>Nombre de la Revista</th>
                        <th>Fecha de Reaccion</th>
                    </tr>
                    <%                while (rs3.next()) {

                    %>
                    <tr>
                        <td><%=rs3.getString("User.name")%></td>
                        <td><%=rs3.getString("Revistas.nombreR")%></td>
                        <td><%=rs3.getString("Suscripcion.fecha_suscripcion")%></td>
                    </tr>
                    <%
                        }%>
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
            <div class="datagrid"> 
                <%
                    String fechaGI = request.getParameter("fechaGI");
                    String fechaGF = request.getParameter("fechaGF");
                    PreparedStatement ps4;
                    ResultSet rs4;
                    double ganancias, precioS, costoDia, costoMante, costoSuscripcion;
                    String fechaC, fechaDSus, fechaTo;
                    
                    ps4 = cn.prepareStatement("SELECT DISTINCT Revistas.cuotaS, Revistas.cuotaD, Revista.fechaC, Suscripcion.fecha_suscripcion,Pago.fecha_vencimiento , Pago.costo_suscripcion FROM Suscripcion JOIN Revistas ON(Suscripcion.id_revista=Revistas.id_revista) JOIN User ON(Suscripcion.id_user=User.id_user) WHERE Suscripcion.fecha_suscripcion BETWEEN '" + fechaSI + "' AND '" + fechaSF + "'");
                    rs4 = ps4.executeQuery();
                %>
                <table>
                    <tr>
                        <th>Ganancias</th>
                        <th>Nombre de la Revista</th>
                        <th>Total</th>
                    </tr>
                    <%                while (rs4.next()) {
                        precioS = rs4.getDouble("Revistas.cuotaS");
                        costoDia = rs4.getDouble("Revistas.cuotaD");
                        fechaC = rs4.getString("Revista.fechaC");
                        fechaDSus = rs4.getString("Suscripcion.fecha_suscripcion");
                        fechaTo = rs4.getString("Pago.fecha_vencimiento");
                        costoSuscripcion = rs4.getDouble("Pago.costo_suscripcion");

                    %>
                    <tr>
                        <td><%=rs4.getString("User.name")%></td>
                        <td><%=rs4.getString("Revistas.nombreR")%></td>
                        <td><%=rs4.getString("Suscripcion.fecha_suscripcion")%></td>
                    </tr>
                    <%
                        }%>
                </table>    
            </div>
        </div>
    </body>
</html>
