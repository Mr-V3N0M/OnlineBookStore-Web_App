<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Prenotazione effettuata di un libro su Online BookStore">
    <meta name="author" content="Fabio Somaglia">
    <title>Prenotazione effettuata - Online BookStore</title>
    <!-- Bootstrap CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
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
                <a href="booking.jsp">Prenotazione</a>
            </li>
            <li class="breadcrumb-item active">Prenotazione effettuata</li>
        </ol>
        <div class="row">
            <div class="col-12">
                <h1>Prenotazione effettuata</h1>
                <hr>
            </div>
            <br>
            <div class="col-12">
            <c:choose>
                <c:when test="${requestScope.lastBooking != null}">
                    <h4>Le tue info sul prestito:</h4>
                    <p>&nbsp;<i class="fa fa-fw fa-lg fa-hashtag"></i>&nbsp;<span class="font-weight-bold">ID del prestito: </span><c:out value="${requestScope.lastBooking.bookingId}"/></p>
                    <p>&nbsp;<i class="fa fa-fw fa-lg fa-calendar"></i>&nbsp;<span class="font-weight-bold">Inizio prestito: </span><c:out value="${requestScope.lastBooking.startBooking}"/></p>
                    <p>&nbsp;<i class="fa fa-fw fa-lg fa-barcode"></i>&nbsp;<span class="font-weight-bold">ID del libro: </span><c:out value="${requestScope.lastBooking.book.bookId}"/></p>
                    <p>&nbsp;<i class="fa fa-fw fa-lg fa-book"></i>&nbsp;<span class="font-weight-bold">Titolo del libro: </span><c:out value="${requestScope.lastBooking.book.title}"/></p>
                    <p>&nbsp;<i class="fa fa-fw fa-lg fa-pencil"></i>&nbsp;<span class="font-weight-bold">Autore/i del libro: </span><c:out value="${requestScope.lastBooking.book.author}"/></p>
                    <p>&nbsp;<i class="fa fa-fw fa-lg fa-building"></i>&nbsp;<span class="font-weight-bold">Editore del libro: </span><c:out value="${requestScope.lastBooking.book.publisher}"/></p>
                    <div class="float-right">
                        <a role="button" href="booking-user.jsp" class="btn btn-primary">Vai alla Cronologia dei prestiti</a>
                        <a role="button" href="dashboard.jsp" class="btn btn-secondary">Vai alla Dashboard</a>
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
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages -->
<script src="js/sb-admin.min.js"></script>
</body>

</html>
