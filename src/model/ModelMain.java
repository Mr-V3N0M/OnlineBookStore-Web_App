package model;

/**
 * Created by Fabio Somaglia on 26/11/17.
 */

public class ModelMain {

    private static final String URL = "jdbc:postgresql://localhost:8432/dbnomecognome"; // url del DB
    private static final String USER = "dbnomecognome"; // login utente da usare per connettersi
    private static final String PWD = "dbnomecognome"; // password utente

    public static void main(String args[]) {
        Model model = new Model(URL, USER, PWD);
        model.registerDriver();

        /*System.out.println("Funzione checkUser(), dovrebbe ritornare 0 (admin): " + model.checkUser("admin", "sysadmin"));
        System.out.println("Funzione checkUser(), dovrebbe ritornare 1 (luca90): " + model.checkUser("luca90", "luc1990"));
        System.out.println("Funzione checkUser(), dovrebbe ritornare -1 (admin con password errata): " + model.checkUser("admin", "luc1990"));
        System.out.println();

        System.out.println("Cerco un libro (ELON): ");
        for (Book book : model.searchBook("elon", null, "hoepli")) {
            System.out.println(book.getBookId() + ", " + book.getTitle() + ", " + book.getAuthor() + ", " + book.getPublisher());
        }
        System.out.println();

        System.out.println("Inserisco un libro (true se inserito correttamente): " + model.insertBook("1984", "Orwell George", "Mondadori"));
        System.out.println();

        System.out.println("Cancello un libro (true se è stato cancellato): " + model.deleteBook(3));
        System.out.println();

        System.out.println("Modifico un libro (true se è stato modificato): " + model.updateBook(5, "1984", "George Orwell", "Mondadori"));
        System.out.println();

        System.out.println("La lista di tutti i libri a catalogo:");
        for (Book book : model.getAllBooks()) {
            System.out.println(book.getBookId() + ", " + book.getTitle() + ", " + book.getAuthor() + ", " + book.getPublisher());
        }
        System.out.println();

        System.out.println("La lista di tutti i libri disponibili al momento:");
        for (Book book : model.getAllAvailableBooks()) {
            System.out.println(book.getBookId() + ", " + book.getTitle() + ", " + book.getAuthor() + ", " + book.getPublisher());
        }
        System.out.println();

        System.out.println("La lista di tutti i libri non disponibili al momento:");
        for (Book book : model.getAllNotAvailableBooks()) {
            System.out.println(book.getBookId() + ", " + book.getTitle() + ", " + book.getAuthor() + ", " + book.getPublisher());
        }
        System.out.println();

        System.out.println("La lista di tutti i prestiti attivi effettuati dall'utente raffy89:");
        for (Booking booking : model.getActiveBookingUser("raffy89")) {
            System.out.println(booking.getBookingId() + ", " + booking.getBookId() + ", " + booking.getUserId() + ", " + booking.getStartBooking() + ", " + booking.getEndBooking());
        }
        System.out.println();

        System.out.println("La lista di tutte le restituzioni effettuate dall'utente raffy89:");
        for (Booking booking : model.getEndedBookingUser("raffy89")) {
            System.out.println(booking.getBookingId() + ", " + booking.getBookId() + ", " + booking.getUserId() + ", " + booking.getStartBooking() + ", " + booking.getEndBooking());
        }
        System.out.println();

        System.out.println("La lista di tutti i prestiti attivi degli utenti:");
        for (Booking booking : model.getAllActiveBooking()) {
            System.out.println(booking.getBookingId() + ", " + booking.getBookId() + ", " + booking.getUserId() + ", " + booking.getStartBooking() + ", " + booking.getEndBooking());
        }
        System.out.println();

        System.out.println("La lista di tutte le restituzioni degli utenti:");
        for (Booking booking : model.getAllEndedBooking()) {
            System.out.println(booking.getBookingId() + ", " + booking.getBookId() + ", " + booking.getUserId() + ", " + booking.getStartBooking() + ", " + booking.getEndBooking());
        }
        System.out.println();

        System.out.println("Effettuo un prestito a nome di raffy89 (dovrebbe restituire true se è andato a buon fine): " + model.booking(1, "raffy89"));
        System.out.println();

        System.out.println("Restituisco il libro prenotato precedentemente da raffy89 (dovrebbe restituire true se è andato a buon fine): " + model.endBooking(4));
        System.out.println();

        System.out.println("Operazioni eseguite con successo!");*/
    }

}