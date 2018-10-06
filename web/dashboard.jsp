<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Dashboard di Online BookStore">
    <meta name="author" content="Fabio Somaglia">
    <title>Dashboard - Online BookStore</title>
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
<jsp:include page="Controller">
    <jsp:param name="action" value="dashboard"/>
</jsp:include>
<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="dashboard.jsp">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">La mia Dashboard</li>
        </ol>
        <div class="row">
            <div class="col-12">
                <h1>Benvenuto su Online BookStore!</h1>
                <hr>
            </div>

            <div class="col-xl-3 col-sm-6 mb-3">
                <h4>I tuoi dati:</h4>
                <p>&nbsp;<i class="fa fa-fw fa-lg fa-user"></i>&nbsp;<c:out value="${sessionScope.user.username}"/>
                </p>
                <p>&nbsp;<i class="fa fa-fw fa-lg fa-id-card"></i>&nbsp;<c:out value="${sessionScope.user.name}"/>&nbsp;<c:out
                        value="${sessionScope.user.surname}"/></p>
                <p>&nbsp;<i class="fa fa-fw fa-lg fa-envelope"></i>&nbsp;<c:out value="${sessionScope.user.email}"/>
                </p>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-primary o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fa fa-fw fa-book"></i>
                        </div>
                        <div class="mr-5">
                            <c:choose>
                                <c:when test="${requestScope.nBook == '1'}">
                                    <c:out value="${requestScope.nBook}"/>&nbsp;libro prenotabile!
                                </c:when>
                                <c:otherwise>
                                    <c:out value="${requestScope.nBook}"/>&nbsp;libri prenotabili!
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="booking.jsp">
                        <span class="float-left">Prenota un libro</span>
                        <span class="float-right">
                                <i class="fa fa-angle-right"></i>
                            </span>
                    </a>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-success o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fa fa-fw fa-arrow-up"></i>
                        </div>
                        <div class="mr-5">
                            <c:choose>
                                <c:when test="${requestScope.nActiveBooking == '1'}">
                                    <c:out value="${requestScope.nActiveBooking}"/>&nbsp;libro da restituire!
                                </c:when>
                                <c:otherwise>
                                    <c:out value="${requestScope.nActiveBooking}"/>&nbsp;libri da restituire!
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="end-booking.jsp">
                        <span class="float-left">Restituisci un libro</span>
                        <span class="float-right">
                                <i class="fa fa-angle-right"></i>
                            </span>
                    </a>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-danger o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fa fa-fw fa-arrow-down"></i>
                        </div>
                        <c:choose>
                            <c:when test="${requestScope.nAllBooking == '1'}">
                                <c:out value="${requestScope.nAllBooking}"/>&nbsp;prestito effettuato!
                            </c:when>
                            <c:otherwise>
                                <c:out value="${requestScope.nAllBooking}"/>&nbsp;prestiti effettuati!
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="booking-user.jsp">
                        <span class="float-left">Cronologia dei prestiti</span>
                        <span class="float-right">
                                <i class="fa fa-angle-right"></i>
                            </span>
                    </a>
                </div>
            </div>
        </div>
        <br>
        <!-- DataTables for all the books in db -->
        <div class="card mb-3">
            <div class="card-header">
                <i class="fa fa-fw fa-table"></i>Catalogo completo dei libri
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table allbooks table-bordered table-hover" id="allBooks" width="100%" cellspacing="0">
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
                        <c:forEach items="${requestScope.allBook}" var="book">
                            <tr>
                                <td><c:out value="${book.bookId}"/></td>
                                <td><c:out value="${book.title}"/></td>
                                <td><c:out value="${book.author}"/></td>
                                <td><c:out value="${book.publisher}"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="card-footer small text-muted">
                <c:set var="now" value="<%=new java.util.Date()%>"/>
                Ultimo aggiornamento: <fmt:formatDate type="both" value="${now}"/>
            </div>
        </div>
    </div>
    <jsp:include page="page-structure/footer.jsp" flush="true"/>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fa fa-angle-up"></i>
    </a>
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
