<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Redirect if access is not authorized -->
<c:if test="${sessionScope.role != 0 && sessionScope.role != 1}">
    <script language="javascript">
        window.location = "login.jsp";
    </script>
</c:if>
<c:if test="${sessionScope.role == 0 || sessionScope.role == 1}">
    <!-- Menu di navigazione -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
        <a class="navbar-brand" href="dashboard.jsp">Online BookStore</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav navbar-sidenav" id="sideNavBar">
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                    <a class="nav-link" href="dashboard.jsp">
                        <i class="fa fa-fw fa-dashboard"></i>
                        <span class="nav-link-text">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Booking">
                    <a class="nav-link" href="booking.jsp">
                        <i class="fa fa-fw fa-arrow-down"></i>
                        <span class="nav-link-text">Prenota un libro</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="EndBooking">
                    <a class="nav-link" href="end-booking.jsp">
                        <i class="fa fa-fw fa-arrow-up"></i>
                        <span class="nav-link-text">Restituisci un libro</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="ActiveBookingUser">
                    <a class="nav-link" href="booking-user.jsp">
                        <i class="fa fa-fw fa-book"></i>
                        <span class="nav-link-text">Cronologia dei prestiti</span>
                    </a>
                </li>
                <c:if test="${sessionScope.role == 0}">
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="MenageBook">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMenageBook"
                           data-parent="#sideNavBar">
                            <i class="fa fa-fw fa-wrench"></i>
                            <span class="nav-link-text">Libri a catalogo</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseMenageBook">
                            <li>
                                <a href="insert-book.jsp">Inserici un libro</a>
                            </li>
                            <li>
                                <a href="remove-book.jsp">Rimuovi un libro</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="OpClients">
                        <a class="nav-link" href="op-clients.jsp">
                            <i class="fa fa-fw fa-rotate-90 fa-exchange"></i>
                            <span class="nav-link-text">Prestiti/restituzioni clienti</span>
                        </a>
                    </li>
                </c:if>
            </ul>
            <!-- Freccia in basso per comprimere il menu di navigazione -->
            <ul class="navbar-nav sidenav-toggler">
                <li class="nav-item">
                    <a class="nav-link text-center" id="sidenavToggler">
                        <i class="fa fa-fw fa-angle-left"></i>
                    </a>
                </li>
            </ul>
            <!-- Logout navbar-->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item my-2 my-lg-0 mr-lg-2">
                <a class="navbar-text text-white" href="dashboard.jsp">Ciao, <c:out value="${sessionScope.user.name}"/></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#logoutModal">
                        <i class="fa fa-fw fa-sign-out"></i>Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Logout Modal-->
    <c:url value="Controller" var="urlLogout">
        <c:param name="action" value="logout" />
    </c:url>
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="logoutModalLabel">Sicuro di voler uscire?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Click su "Logout" se vuoi terminare la tua attuale sessione.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancella</button>
                    <a class="btn btn-primary" href="${urlLogout}">Logout</a>
                </div>
            </div>
        </div>
    </div>
</c:if>