 <%-- 
    Document   : Admin
    Created on : 9/09/2019, 03:24:21 AM
    Author     : jara
--%>

<%@page import="java.time.LocalDate"%>
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
                                    <li class="scroll_btn"><a href="" >Crear Revista</a></li>
                                    <li class="scroll_btn"><a href="" >Informacion</a></li>
                                    <li class="scroll_btn last"><a href="" >Contacts</a></li>
                                    <li class="sub-menu">
                                        <a href="javascript:void(0);" >Pages</a>
                                        <ul>
                                            <li><a href="blog.html" >Blog</a></li>
                                            <li><a href="blog-post.html" >Blog Post</a></li>
                                            <li><a href="portfolio-post.html" >Portfolio Single Work</a></li>
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
        </div>
    </body>
</html>
