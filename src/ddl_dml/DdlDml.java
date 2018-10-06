package ddl_dml;

import bcrypt.BCrypt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by Fabio Somaglia on 20/10/17.
 */

public class DdlDml {

    private static final String URL = "jdbc:postgresql://localhost:8432/dbnomecognome"; //TODO modificare con il proprio account
    private static final String USER = "dbnomecognome"; //TODO modificare con il proprio account
    private static final String PWD = "dbnomecognome"; //TODO modificare con il proprio account

    public static void main(String[] args) {
        //registrazione driver JDBC
        try {
            DriverManager.registerDriver(new org.postgresql.Driver());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        creaTabella();
        popolaTabella();

        System.out.println("DDL e DML eseguite con successo!");
    }

    public static void creaTabella() {
        Connection conn = null;
        Statement st = null;
        try {
            conn = DriverManager.getConnection(URL, USER, PWD);
            st = conn.createStatement();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        try {
            st.executeUpdate("CREATE SCHEMA IF NOT EXISTS library");
            st.execute("SET SEARCH_PATH TO library");

            st.executeUpdate("DROP TABLE IF EXISTS booking");
            st.executeUpdate("DROP TABLE IF EXISTS book");
            st.executeUpdate("DROP TABLE IF EXISTS \"user\"");
            st.executeUpdate("DROP SEQUENCE IF EXISTS book_bookid_seq");
            st.executeUpdate("DROP SEQUENCE IF EXISTS booking_bookingid_seq");

            //st.executeUpdate("CREATE SEQUENCE prestiti_id_prestito_seq");

            st.executeUpdate("CREATE TABLE \"user\"\n" +
                    "(username VARCHAR(30) NOT NULL CONSTRAINT user_pkey PRIMARY KEY,\n" +
                    "password TEXT NOT NULL,\n" +
                    "admin BOOLEAN DEFAULT FALSE NOT NULL,\n" +
                    "email VARCHAR(60) NOT NULL,\n" +
                    "name VARCHAR(50) NOT NULL,\n" +
                    "surname VARCHAR(75) NOT NULL\n" +
                    ")");

            st.executeUpdate("create table book\n" +
                    "(bookid serial not null constraint book_pkey primary key,\n" +
                    "title varchar(30) not null,\n" +
                    "author varchar(100) not null,\n" +
                    "publisher varchar(50) not null\n" +
                    ")");

            st.executeUpdate("create table booking\n" +
                    "(bookingid serial not null constraint booking_pkey primary key,\n" +
                    "bookid integer constraint booking_book_bookid_fk references book on update cascade on delete set null,\n" +
                    "userid varchar(30) constraint booking_user_username_fk references \"user\" on update cascade on delete set null,\n" +
                    "start_booking date not null,\n" +
                    "end_booking date\n" +
                    ")");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                st.close();
                conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    public static void popolaTabella() {
        Connection conn = null;
        Statement st = null;
        try {
            conn = DriverManager.getConnection(URL, USER, PWD);
            st = conn.createStatement();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        try {
            st.execute("SET SEARCH_PATH TO library");

            st.executeUpdate("INSERT INTO library.\"user\" (username, password, admin, email, name, surname) VALUES ('admin', '"+BCrypt.hashpw("sysadmin", BCrypt.gensalt())+"', TRUE, 'admin@obs.it', 'admin', 'admin')");
            st.executeUpdate("INSERT INTO library.\"user\" (username, password, admin, email, name, surname) VALUES ('luca90', '"+BCrypt.hashpw("luc1990", BCrypt.gensalt())+"', FALSE, 'l.rossi@gmail.com', 'Luca', 'Rossi')");
            st.executeUpdate("INSERT INTO library.\"user\" (username, password, admin, email, name, surname) VALUES ('raffy89', '"+BCrypt.hashpw("raff8989", BCrypt.gensalt())+"', FALSE, 'raffaella.neri@outlook.it', 'Raffaella', 'Neri')");

            st.executeUpdate("INSERT INTO library.book (title, author, publisher) VALUES ('ELON MUSK', 'Ashlee Vance', 'Hoepli')");
            st.executeUpdate("INSERT INTO library.book (title, author, publisher) VALUES ('Il Trono di Spade Vol.5', 'Martin George R.R.', 'Hoepli')");
            st.executeUpdate("INSERT INTO library.book (title, author, publisher) VALUES ('Chiamami col tuo Nome', 'Aciman Andre', 'Guanda')");
			st.executeUpdate("INSERT INTO library.book (title, author, publisher) VALUES ('Il Morso della Reclusa', 'Vargas Fred', 'Einaudi')");
			st.executeUpdate("INSERT INTO library.book (title, author, publisher) VALUES ('La Grande Truffa', 'Grisham John', 'Mondadori')");
			st.executeUpdate("INSERT INTO library.book (title, author, publisher) VALUES ('La Giornalaia', 'Heinichen Veit', 'E/O')");
			st.executeUpdate("INSERT INTO library.book (title, author, publisher) VALUES ('Eleganza del Riccio', 'Barbery Muriel', 'E/O')");
			st.executeUpdate("INSERT INTO library.book (title, author, publisher) VALUES ('Stella o Croce', 'Costa', 'Sellerio')");
			st.executeUpdate("INSERT INTO library.book (title, author, publisher) VALUES ('Ninfee Nere', 'Bussi Michel', 'E/O')");
			st.executeUpdate("INSERT INTO library.book (title, author, publisher) VALUES ('Origin', 'Brown Dan', 'Mondadori')");
			st.executeUpdate("INSERT INTO library.book (title, author, publisher) VALUES ('Il Marchio Ribelle', 'Lilin Nicolai', 'Einaudi')");
			st.executeUpdate("INSERT INTO library.book (title, author, publisher) VALUES ('Il Suggeritore', 'Carrisi Donato', 'TEA')");

            st.executeUpdate("INSERT INTO library.booking (bookid, userid, start_booking, end_booking) VALUES (1, 'raffy89', '2017-10-23', '2017-10-30')");
            st.executeUpdate("INSERT INTO library.booking (bookid, userid, start_booking, end_booking) VALUES (1, 'luca90', '2017-11-01', '2017-11-15');");
            st.executeUpdate("INSERT INTO library.booking (bookid, userid, start_booking, end_booking) VALUES (2, 'raffy89', '2017-11-21', null);");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                st.close();
                conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

}
