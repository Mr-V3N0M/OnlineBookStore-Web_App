<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Prestiti e restituzioni di tutti i clienti di Online BookStore">
    <meta name="author" content="Fabio Somaglia">
    <title>Prestiti/restituzioni clienti - Online BookStore</title>
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
    <jsp:param name="action" value="op-clients"/>
</jsp:include>
<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="dashboard.jsp">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Prestiti/restituzioni clienti</li>
        </ol>
        <div class="row">
            <div class="col-12">
                <h1>Prestiti e restituzioni dei clienti</h1>
                <hr>
            </div>
            <br>

            <div class="col-12">
                <h6 class="mb-3">In questa sezione potrai vedere i prestiti attivi e passati di tutti i clienti di Online BookStore. L'ordine di visualizzazione di default è temporale discendente, questo significa che le prenotazioni più recenti sono in cima.</h6>
                <!-- Nav tabs -->
                <ul id="tabOpClients" class="nav nav-pills" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="pill" href="#pa" role="tab">Prestiti attivi dei clienti</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="pill" href="#pp" role="tab">Prestiti passati dei clienti</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="pa" role="tabpanel">
                        <br>
                        <!-- DataTables for booking -->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-fw fa-table"></i>Prestiti attivi</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table booked table-bordered table-hover" id="booked" width="100%" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th>ID Prestito</th>
                                            <th>Username</th>
                                            <th>ID Libro</th>
                                            <th>Titolo</th>
                                            <th>Autore/i</th>
                                            <th>Editore</th>
                                            <th>Inizio Prestito</th>
                                        </tr>
                                        </thead>
                                        <tfoot>
                                        <tr>
                                            <th>ID Prestito</th>
                                            <th>Username</th>
                                            <th>ID Libro</th>
                                            <th>Titolo</th>
                                            <th>Autore/i</th>
                                            <th>Editore</th>
                                            <th>Inizio Prestito</th>
                                        </tr>
                                        </tfoot>
                                        <c:forEach items="${requestScope.allActiveBooking}" var="activeBooking">
                                            <tr>
                                                <td><c:out value="${activeBooking.bookingId}" /></td>
                                                <td><c:out value="${activeBooking.userId}" /></td>
                                                <td><c:out value="${activeBooking.book.bookId}" /></td>
                                                <td><c:out value="${activeBooking.book.title}" /></td>
                                                <td><c:out value="${activeBooking.book.author}" /></td>
                                                <td><c:out value="${activeBooking.book.publisher}" /></td>
                                                <td><c:out value="${activeBooking.startBooking}" /></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer small text-muted">
                                <c:set var = "now" value = "<%=new java.util.Date()%>" />
                                Ultimo aggiornamento: <fmt:formatDate type = "both" value = "${now}" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="pp" role="tabpanel">
                        <br>
                        <!-- DataTables for returned books -->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-fw fa-table"></i>Libri restituiti</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table returned table-bordered table-hover" id="endBooked" width="100%" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th>ID Prestito</th>
                                            <th>Username</th>
                                            <th>ID Libro</th>
                                            <th>Titolo</th>
                                            <th>Autore/i</th>
                                            <th>Editore</th>
                                            <th>Inizio Prestito</th>
                                            <th>Fine Prestito</th>
                                        </tr>
                                        </thead>
                                        <tfoot>
                                        <tr>
                                            <th>ID Prestito</th>
                                            <th>Username</th>
                                            <th>ID Libro</th>
                                            <th>Titolo</th>
                                            <th>Autore/i</th>
                                            <th>Editore</th>
                                            <th>Inizio Prestito</th>
                                            <th>Fine Prestito</th>
                                        </tr>
                                        </tfoot>
                                        <c:forEach items="${requestScope.allEndedBooking}" var="endedBooking">
                                            <tr>
                                                <td><c:out value="${endedBooking.bookingId}" /></td>
                                                <td><c:out value="${endedBooking.userId}" /></td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${endedBooking.book.bookId=='0'}">
                                                            Libro eliminato
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${endedBooking.book.bookId}" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td><c:out value="${endedBooking.book.title}" /></td>
                                                <td><c:out value="${endedBooking.book.author}" /></td>
                                                <td><c:out value="${endedBooking.book.publisher}" /></td>
                                                <td><c:out value="${endedBooking.startBooking}" /></td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${endedBooking.endBooking==null}">
                                                            Non restituito
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${endedBooking.endBooking}" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer small text-muted">
                                <c:set var = "now" value = "<%=new java.util.Date()%>" />
                                Ultimo aggiornamento: <fmt:formatDate type = "both" value = "${now}" />
                            </div>
                        </div>
                    </div>
                </div>
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
<!-- Script for nav tabs -->
<script>
    $('#tabBookingUser').click(function (e) {
        e.preventDefault();
        $(this).tab('show')
    })
</script>
</body>

</html>