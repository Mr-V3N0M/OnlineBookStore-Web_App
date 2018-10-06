<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Login Online BookStore">
    <meta name="author" content="Fabio Somaglia">
    <title>Login</title>
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

<body class="bg-dark">
<jsp:include page="Controller">
    <jsp:param name="action" value="loginPage"/>
</jsp:include>
<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login</div>
        <div class="card-body">
            <form id="formLogin" name="formLogin" onsubmit="checkInput(); return false;" novalidate>
                <div class="form-header text-center">
                    <h2>
                        Online BookStore
                    </h2>
                    <p>
                        Accedi per utilizzare il nostro servizio.<br><a href="#bookModal" data-toggle="modal">Clicca qui</a> per visualizzare tutti i libri a catalogo.
                    </p>
                </div>

                <div class="form-group">
                    <label class="control-label" for="username">Username<span class="asteriskField">*</span></label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Username" maxlength="30" required/>
                    <div class="invalid-feedback">
                        Inserisci il tuo Username.
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label" for="password">Password<span class="asteriskField">*</span></label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required/>
                    <div class="invalid-feedback">
                        Inserisci la tua Password.
                    </div>
                </div>

                <input type="submit" value="Login" class="btn btn-primary btn-block"/>
                <!-- <button type="submit" class="btn btn-primary btn-block">Login</button>-->
            </form>

            <div id="message" class="errorLogin mt-2"></div>
         </div>
     </div>
 </div>

<!-- Book Modal-->
<div class="modal fade" id="bookModal" tabindex="-1" role="dialog" aria-labelledby="bookModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="bookModalLabel">Libri a catalogo</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
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
            <div class="modal-footer">
                <button class="btn btn-primary" type="button" data-dismiss="modal">Chiudi</button>
            </div>
        </div>
    </div>
</div>

 <!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- JavaScript for disabling form submissions if there are invalid fields and AJAX -->
<script src="js/login.js"></script>
<!-- DataTables core JavaScript -->
<script src="vendor/datatables/jquery.dataTables.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
<!-- Custom scripts for all pages -->
<script src="js/sb-admin.min.js"></script>
<!-- Custom scripts for DataTables -->
<script src="js/datatables.js"></script>
</body>

</html>