<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Conferma dell'inserimento di un libro su Online BookStore">
    <meta name="author" content="Fabio Somaglia">
    <title>Conferma inserimento libro - Online BookStore</title>
    <!-- Bootstrap CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- CSS for DataTables -->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <!-- My custom styles for this template -->
    <link href="css/my-css.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<jsp:include page="page-structure/nav.jsp" flush="true"/>
<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="dashboard.jsp">Dashboard</a>
            </li>
            <li class="breadcrumb-item">
                <a href="insert-book.jsp">Inserisci libro</a>
            </li>
            <li class="breadcrumb-item active">Conferma inserimento libro</li>
        </ol>
        <div class="row">
            <div class="col-12">
                <h1>Conferma l'inserimento del libro</h1>
                <hr>
            </div>
            <br>
            <div class="col-12">
                <c:choose>
                    <c:when test="${requestScope.similarBooks != null}">
                        <h5>Sono state trovate delle somiglianze al libro che stai per aggiungere: controlla che il libro non sia già stato inserito a catalogo.</h5>
                        <h6>I dati del libro che vuoi aggiungere:</h6>
                        <p>&nbsp;<i class="fa fa-fw fa-lg fa-book"></i>&nbsp;<span class="font-weight-bold">Titolo del libro: </span><c:out value="${requestScope.title}"/></p>
                        <p>&nbsp;<i class="fa fa-fw fa-lg fa-pencil"></i>&nbsp;<span class="font-weight-bold">Autore/i del libro: </span><c:out value="${requestScope.author}"/></p>
                        <p>&nbsp;<i class="fa fa-fw fa-lg fa-building"></i>&nbsp;<span class="font-weight-bold">Editore del libro: </span><c:out value="${requestScope.publisher}"/></p>
                        <!-- DataTables similar books -->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-fw fa-table"></i>Libri simili</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table similar table-bordered table-hover" id="similarBooks" width="100%" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th>ID Libro</th>
                                            <th>Titolo</th>
                                            <th>Autore/i</th>
                                            <th>Editore</th>
                                        </tr>
                                        </thead>
                                        <tfoot>
                                        <tr>
                                            <th>ID Libro</th>
                                            <th>Titolo</th>
                                            <th>Autore/i</th>
                                            <th>Editore</th>
                                        </tr>
                                        </tfoot>
                                        <c:forEach items="${requestScope.similarBooks}" var="book">
                                            <tr><td><c:out value="${book.bookId}" /></td><td><c:out value="${book.title}" /></td><td><c:out value="${book.author}" /></td><td><c:out value="${book.publisher}" /></td></tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer small text-muted">
                                <c:set var = "now" value = "<%=new java.util.Date()%>" />
                                Ultimo aggiornamento: <fmt:formatDate type = "both" value = "${now}" />
                            </div>
                        </div>
                        <div class="float-right">
                            <form action="Controller" method="post" id="formConfirm">
                                <div class="form-group">
                                    <input type="hidden" id="title" name="title" value="<c:out value="${requestScope.title}"/>"/>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" id="author" name="author" value="<c:out value="${requestScope.author}"/>"/>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" id="publisher" name="publisher" value="<c:out value="${requestScope.publisher}"/>"/>
                                </div>
                                <a role="button" href="insert-book.jsp" class="btn btn-danger">Cancella e ritorna al form di inserimento</a>
                                <button type="submit" class="btn btn-primary" name="action" value="insertion-confirmed">Conferma l'inserimento del libro</button>
                            </form>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <script language="javascript">
                            window.location = "dashboard.jsp";
                        </script>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <jsp:include page="page-structure/footer.jsp" flush="true"/>
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</div>
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- DataTables core JavaScript -->
<script src="vendor/datatables/jquery.dataTables.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
<!-- Custom scripts for all pages -->
<script src="js/sb-admin.min.js"></script>
<!-- Custom scripts for DataTables -->
<script src="js/datatables.js"></script>
</body>

</html>
