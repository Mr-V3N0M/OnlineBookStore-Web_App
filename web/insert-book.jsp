<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Inserimento di un libro su Online BookStore">
    <meta name="author" content="Fabio Somaglia">
    <title>Inserisci libro - Online BookStore</title>
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
            <li class="breadcrumb-item active">Inserisci libro</li>
        </ol>
        <div class="row">
            <div class="col-12">
                <h1>Inserisci un nuovo libro</h1>
                <hr>
            </div>
            <br>
            <div class="col-8 offset-2">
                <!-- Error in inserting the book -->
                <c:if test="${requestScope.errorInsertBook != null}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <strong>Oh no!</strong> Abbiamo riscontrato dei problemi ad inserire il libro. Riprovare più tardi. Grazie.
                    </div>
                </c:if>
                <form action="<%=request.getContextPath()%>/Controller" method="post" id="formInsertBook" novalidate>
                    <div class="col-xs-6">
                        <div class="form-header">
                            <h6 class="mb-3">Aggiungi un libro nel database, inserendone il titolo, l'autore e l'editore. Il sistema verificherà che non ci siano libri simili a quello che vuoi aggiungere, nel caso te li mostrerà e potrai decidere in seguito se confermare l'inserimento.</h6>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="title">Titolo<span class="asteriskField">*</span></label>
                            <input type="text" class="form-control" id="title" name="title" placeholder="Inserisci il titolo" maxlength="30" required/>
                            <div class="invalid-feedback">
                                Inserisci il titolo.
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="author">Autore/i<span class="asteriskField">*</span></label>
                            <input type="text" class="form-control" id="author" name="author" placeholder="Inserisci l'autore" maxlength="100" required/>
                            <div class="invalid-feedback">
                                Inserisci l'autore.
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="publisher">Editore<span class="asteriskField">*</span></label>
                            <input type="text" class="form-control" id="publisher" name="publisher" placeholder="Inserisci l'editore" maxlength="50" required/>
                            <div class="invalid-feedback">
                                Inserisci l'editore.
                            </div>
                        </div>

                        <div class="float-right">
                            <button type="reset" class="btn btn-danger">Cancella</button>
                            <button type="submit" class="btn btn-primary" name="action" value="confirm-insert-book">Inserisci</button>
                        </div>
                    </div>
                </form>
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
<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>
<!-- JavaScript for disabling form submissions if there are invalid fields -->
<script src="js/insert-book.js"></script>
</body>

</html>
