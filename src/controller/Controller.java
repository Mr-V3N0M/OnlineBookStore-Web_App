package controller;

import model.Book;
import model.Booking;
import model.Model;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Fabio Somaglia on 23/11/17.
 */

public class Controller extends HttpServlet {

    private Model model;

    public void init(ServletConfig conf) throws ServletException {
        super.init(conf);
        ServletContext servletContext = conf.getServletContext();
        String url = servletContext.getInitParameter("db-url");
        String user = servletContext.getInitParameter("user");
        String pwd = servletContext.getInitParameter("pwd");
        model = new Model(url, user, pwd);
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ServletContext context = request.getServletContext();
        RequestDispatcher rd = context.getRequestDispatcher("/login.jsp");
        HttpSession session;
        try {
            String action = request.getParameter("action");
			List<Book> allBook;
            if (action == null || action.equals("")) {
                rd.forward(request, response);
                System.out.println("Sono null");
                return;
            } else {
                switch (action) {
                    case "loginPage":
						allBook = model.getAllBooks();
						request.setAttribute("allBook", allBook);
                        System.out.println("Sono loginPage");
                        break;
                    case "login":
						response.setContentType("text/plain");
                        String username = request.getParameter("username");
                        String password = request.getParameter("password");
                        int isAdmin = model.checkUser(username, password);
                        if (isAdmin != -1) {
                            System.out.println("Credenziali corrette");
                            session = request.getSession();
                            User user = model.getUser(username);
                            session.setAttribute("user", user);
                            session.setAttribute("role", isAdmin);
                            out.println("1");
                            out.flush();
                            out.close();
                        } else {
                            System.out.println("Credenziali errate");
                            out.println("-1");
                            out.flush();
                            out.close();
                        }
                        System.out.println("Sono login");
                        break;
                    case "logout":
                        request.getSession().invalidate();
                        rd = context.getRequestDispatcher("/login.jsp");
                        rd.forward(request, response);
                        System.out.println("Sono logout");
                        break;
                    case "dashboard":
                        if ((int) request.getSession().getAttribute("role") != -1) {
                            User user = (User) request.getSession().getAttribute("user");
                            int nBook = model.getAllAvailableBooks().size();
                            request.setAttribute("nBook", nBook);
                            int nActiveBooking = model.getActiveBookingUser(user.getUsername()).size();
                            request.setAttribute("nActiveBooking", nActiveBooking);
                            int nAllBooking = nActiveBooking + model.getEndedBookingUser(user.getUsername()).size();
                            request.setAttribute("nAllBooking", nAllBooking);
                            allBook = model.getAllBooks();
                            request.setAttribute("allBook", allBook);
                        } else
                            throw new Exception("Utente non abilitato a questa operazione.");
                        System.out.println("Sono dashboard");
                        break;
                    case "booking-user":
                        if ((int) request.getSession().getAttribute("role") != -1) {
                            User user = (User) request.getSession().getAttribute("user");
                            List<Booking> activeBookingUser = model.getActiveBookingUser(user.getUsername());
                            request.setAttribute("activeBookingUser", activeBookingUser);
                            List<Booking> endedBookingUser = model.getEndedBookingUser(user.getUsername());
                            request.setAttribute("endedBookingUser", endedBookingUser);
                        } else
                            throw new Exception("Utente non abilitato a questa operazione.");
                        System.out.println("Sono booking-user");
                        break;
                    case "booking":
                        if ((int) request.getSession().getAttribute("role") != -1) {
                            List<Book> allAvailableBook = model.getAllAvailableBooks();
                            request.setAttribute("allAvailableBook", allAvailableBook);
                        } else
                            throw new Exception("Utente non abilitato a questa operazione.");
                        System.out.println("Sono booking");
                        break;
                    case "booked":
                        if ((int) request.getSession().getAttribute("role") != -1) {
                            User user = (User) request.getSession().getAttribute("user");
                            String idBook = request.getParameter("inputIdBook");
                            if (model.booking(Integer.parseInt(idBook), user.getUsername())) {
                                request.setAttribute("lastBooking", model.getLastActiveBookingUser(user.getUsername()));
                                rd = context.getRequestDispatcher("/booked-page.jsp");
                                rd.forward(request, response);
                            } else {
                                request.setAttribute("errorBooking", "true");
                                rd = context.getRequestDispatcher("/booking.jsp");
                                rd.forward(request, response);
                            }
                        } else
                            throw new Exception("Utente non abilitato a questa operazione.");
                        System.out.println("Sono booked");
                        break;
                    case "end-booking":
                        if ((int) request.getSession().getAttribute("role") != -1) {
                            User user = (User) request.getSession().getAttribute("user");
                            List<Booking> activeBooking = model.getActiveBookingUser(user.getUsername());
                            request.setAttribute("activeBooking", activeBooking);
                        } else
                            throw new Exception("Utente non abilitato a questa operazione.");
                        System.out.println("Sono end-booking");
                        break;
                    case "returned":
                        if ((int) request.getSession().getAttribute("role") != -1) {
                            String idBooking = request.getParameter("inputIdBooking");
                            if (model.endBooking(Integer.parseInt(idBooking))) {
                                request.setAttribute("lastReturn", model.getLastEndedBookingUser(Integer.parseInt(idBooking)));
                                rd = context.getRequestDispatcher("/returned-page.jsp");
                                rd.forward(request, response);
                            } else {
                                request.setAttribute("errorEndBooking", "true");
                                rd = context.getRequestDispatcher("/end-booking.jsp");
                                rd.forward(request, response);
                            }
                        } else
                            throw new Exception("Utente non abilitato a questa operazione.");
                        System.out.println("Sono returned");
                        break;
                    case "confirm-insert-book": // todo errore da testare
                        if ((int) request.getSession().getAttribute("role") == 0) {
                            String title = request.getParameter("title");
                            String author = request.getParameter("author");
                            String publisher = request.getParameter("publisher");
                            List<Book> similarBooks = model.searchBook(title, author, publisher);
                            if (similarBooks.isEmpty()) {
                                insertBook(request, response, context, title, author, publisher);
                            } else {
                                request.setAttribute("title", title);
                                request.setAttribute("author", author);
                                request.setAttribute("publisher", publisher);
                                request.setAttribute("similarBooks", similarBooks);
                                rd = context.getRequestDispatcher("/confirm-insert.jsp");
                                rd.forward(request, response);
                            }
                        } else
                            throw new Exception("Utente non abilitato a questa operazione.");
                        System.out.println("Sono confirm-insert-book");
                        break;
                    case "insertion-confirmed": // todo errore da testare
                        if ((int) request.getSession().getAttribute("role") == 0) {
                            String title = request.getParameter("title");
                            String author = request.getParameter("author");
                            String publisher = request.getParameter("publisher");
                            insertBook(request, response, context, title, author, publisher);
                        } else
                            throw new Exception("Utente non abilitato a questa operazione.");
                        System.out.println("Sono insertion-confirmed");
                        break;
                    case "remove-book":
                        if ((int) request.getSession().getAttribute("role") == 0) {
                            List<Book> allBooks = model.getAllBooks();
                            request.setAttribute("allBooks", allBooks);
                        } else
                            throw new Exception("Utente non abilitato a questa operazione.");
                        System.out.println("Sono remove-book");
                        break;
                    case "remove-confirmed":
                        if ((int) request.getSession().getAttribute("role") == 0) {
                            int idBook = Integer.parseInt(request.getParameter("inputIdBook"));
                            request.setAttribute("removedBook", model.getBook(idBook));
                            if (model.deleteBook(idBook)) {
                                rd = context.getRequestDispatcher("/book-removed.jsp");
                                rd.forward(request, response);
                            } else {
                                request.setAttribute("errorRemoveBook", "true");
                                rd = context.getRequestDispatcher("/remove-book.jsp");
                                rd.forward(request, response);
                            }
                        } else
                            throw new Exception("Utente non abilitato a questa operazione.");
                        System.out.println("Sono remove-confirmed");
                        break;
                    case "op-clients":
                        if ((int) request.getSession().getAttribute("role") == 0) {
                            List<Booking> allActiveBooking = model.getAllActiveBooking();
                            request.setAttribute("allActiveBooking", allActiveBooking);
                            List<Booking> allEndedBooking = model.getAllEndedBooking();
                            request.setAttribute("allEndedBooking", allEndedBooking);
                        } else
                            throw new Exception("Utente non abilitato a questa operazione.");
                        System.out.println("Sono op-clients");
                        break;
                    default:
                        System.out.println("Sono default");
                        throw new Exception("");
                }
            }
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
            e.printStackTrace();
        }

    }

    private void insertBook(HttpServletRequest request, HttpServletResponse response, ServletContext context, String title, String author, String publisher) throws ServletException, IOException {
        RequestDispatcher rd;
        if (model.insertBook(title, author, publisher)) {
            Book bookInserted = model.getBook(title, author, publisher);
            request.setAttribute("bookInserted", bookInserted);
            rd = context.getRequestDispatcher("/book-inserted.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("errorInsertBook", "true");
            rd = context.getRequestDispatcher("/insert-book.jsp");
            rd.forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}