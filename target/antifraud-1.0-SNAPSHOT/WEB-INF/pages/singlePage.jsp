<%--
  Created by IntelliJ IDEA.
  User: Mr. Dobrik
  Date: 04.02.2018
  Time: 09:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>jQuery Spapp.js Plugin Demo</title>
    <meta charset="utf-8">

    <link rel="stylesheet" href="/resources/singlePage/assets/css/spapp.css" />
    <link rel="stylesheet" href="/resources/singlePage/assets/css/custom.css" />

    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
    </script>
    <![endif]-->
</head>

<body>

<nav role="navigation">
    <ul>
        <li><a href="#view_1">go to view 1</a></li>
        <li><a href="#view_2">go to view 2</a></li>
        <li><a href="#view_3">go to view 3</a></li>
    </ul>
</nav>

<main id="spapp" role="main">
    <section id="view_2"></section>
    <section id="view_3"><h1>view 3</h1></section>
    <section id="error_404"><h1>Page not found</h1></section>
    <section id="view_1" data-load="view_1" ></section>
</main>

<script src="resources/jquery/jquery.min.js"></script>
<script src="resources/project/js/jquery-ui.min.js"></script>
<script src="/resources/singlePage/assets/js/jquery.spapp.js"></script>
<script src="/resources/singlePage/assets/js/custom.js"></script>
<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
</script>
</body>

</html>
