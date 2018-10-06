// DataTables jQuery
$(document).ready(function () {
    var allBooks = $('table.allbooks').DataTable({
        "language": {
            "sEmptyTable": "Nessun libro presente nella tabella",
            "sInfo": "Vista da _START_ a _END_ di _TOTAL_ elementi",
            "sInfoEmpty": "Vista da 0 a 0 di 0 elementi",
            "sInfoFiltered": "(filtrati da _MAX_ elementi totali)",
            "sInfoPostFix": "",
            "sInfoThousands": ".",
            "sLengthMenu": "Visualizza _MENU_ elementi",
            "sLoadingRecords": "Caricamento...",
            "sProcessing": "Elaborazione...",
            "sSearch": "Cerca:",
            "sZeroRecords": "La ricerca non ha portato alcun risultato.",
            "oPaginate": {
                "sFirst": "Inizio",
                "sPrevious": "Precedente",
                "sNext": "Successivo",
                "sLast": "Fine"
            },
            "oAria": {
                "sSortAscending": ": attiva per ordinare la colonna in ordine crescente",
                "sSortDescending": ": attiva per ordinare la colonna in ordine decrescente"
            },
            "select": {
                "rows": {
                    "_": "%d righe selezionate",
                    "0": "",
                    "1": "1 riga selezionata"
                }
            }
        },
        select: {
            style: 'single'
        }
    });

    var allAvailableBooks = $('table.booking').DataTable({
        "language": {
            "sEmptyTable": "Nessun libro disponibile per la prenotazione",
            "sInfo": "Vista da _START_ a _END_ di _TOTAL_ elementi",
            "sInfoEmpty": "Vista da 0 a 0 di 0 elementi",
            "sInfoFiltered": "(filtrati da _MAX_ elementi totali)",
            "sInfoPostFix": "",
            "sInfoThousands": ".",
            "sLengthMenu": "Visualizza _MENU_ elementi",
            "sLoadingRecords": "Caricamento...",
            "sProcessing": "Elaborazione...",
            "sSearch": "Cerca:",
            "sZeroRecords": "La ricerca non ha portato alcun risultato.",
            "oPaginate": {
                "sFirst": "Inizio",
                "sPrevious": "Precedente",
                "sNext": "Successivo",
                "sLast": "Fine"
            },
            "oAria": {
                "sSortAscending": ": attiva per ordinare la colonna in ordine crescente",
                "sSortDescending": ": attiva per ordinare la colonna in ordine decrescente"
            },
            "select": {
                "rows": {
                    "_": "%d righe selezionate",
                    "0": "",
                    "1": "1 riga selezionata"
                }
            }
        },
        select: {
            style: 'single'
        }
    });

    $('#containerFormBooking').hide();
    allAvailableBooks.on('select', function (e, dt, type, indexes) {
        var $idbook = $('#idbook');
        var $title = $('#title');
        var $author = $('#author');
        var $publisher = $('#publisher');
        var rowData = allAvailableBooks.row(indexes).data();
        $idbook.html("").append(rowData[0]);
        $("#inputIdBook").val(rowData[0]);
        $title.html("").append(rowData[1]);
        $author.html("").append(rowData[2]);
        $publisher.html("").append(rowData[3]);
        $('#containerFormBooking').slideDown();
    });

    allAvailableBooks.on('deselect', function (e, dt, type, indexes) {

    });

    $('table.booking tbody').on('click', 'tr', function () {
        var data = allAvailableBooks.row(this).data();
        if (data[0] === $('#idbook').text())
            $('#containerFormBooking').slideUp();
    });

    var allActiveBooking = $('table.endbooking').DataTable({
        "language": {
            "sEmptyTable": "Nessun libro da restituire",
            "sInfo": "Vista da _START_ a _END_ di _TOTAL_ elementi",
            "sInfoEmpty": "Vista da 0 a 0 di 0 elementi",
            "sInfoFiltered": "(filtrati da _MAX_ elementi totali)",
            "sInfoPostFix": "",
            "sInfoThousands": ".",
            "sLengthMenu": "Visualizza _MENU_ elementi",
            "sLoadingRecords": "Caricamento...",
            "sProcessing": "Elaborazione...",
            "sSearch": "Cerca:",
            "sZeroRecords": "La ricerca non ha portato alcun risultato.",
            "oPaginate": {
                "sFirst": "Inizio",
                "sPrevious": "Precedente",
                "sNext": "Successivo",
                "sLast": "Fine"
            },
            "oAria": {
                "sSortAscending": ": attiva per ordinare la colonna in ordine crescente",
                "sSortDescending": ": attiva per ordinare la colonna in ordine decrescente"
            },
            "select": {
                "rows": {
                    "_": "%d righe selezionate",
                    "0": "",
                    "1": "1 riga selezionata"
                }
            }
        },
        select: {
            style: 'single'
        }
    });

    $('#containerFormEndBooking').hide();
    allActiveBooking.on('select', function (e, dt, type, indexes) {
        var $idbooking = $('#idbooking');
        var $endidbook = $('#endidbook');
        var $endtitle = $('#endtitle');
        var $endauthor = $('#endauthor');
        var $endpublisher = $('#endpublisher');
        var $endstartbooking = $('#endstartbooking');
        var rowData = allActiveBooking.row(indexes).data();
        $idbooking.html("").append(rowData[0]);
        $("#inputIdBooking").val(rowData[0]);
        $endidbook.html("").append(rowData[1]);
        $endtitle.html("").append(rowData[2]);
        $endauthor.html("").append(rowData[3]);
        $endpublisher.html("").append(rowData[4]);
        $endstartbooking.html("").append(rowData[5]);
        $('#containerFormEndBooking').slideDown();
    });

    allActiveBooking.on('deselect', function (e, dt, type, indexes) {

    });

    $('table.endbooking tbody').on('click', 'tr', function () {
        var data = allActiveBooking.row(this).data();
        if (data[0] === $('#idbooking').text())
            $('#containerFormEndBooking').slideUp();
    });

    var allBooked = $('table.booked').DataTable({
        "language": {
            "sEmptyTable": "Nessun prestito attivo presente nella tabella",
            "sInfo": "Vista da _START_ a _END_ di _TOTAL_ elementi",
            "sInfoEmpty": "Vista da 0 a 0 di 0 elementi",
            "sInfoFiltered": "(filtrati da _MAX_ elementi totali)",
            "sInfoPostFix": "",
            "sInfoThousands": ".",
            "sLengthMenu": "Visualizza _MENU_ elementi",
            "sLoadingRecords": "Caricamento...",
            "sProcessing": "Elaborazione...",
            "sSearch": "Cerca:",
            "sZeroRecords": "La ricerca non ha portato alcun risultato.",
            "oPaginate": {
                "sFirst": "Inizio",
                "sPrevious": "Precedente",
                "sNext": "Successivo",
                "sLast": "Fine"
            },
            "oAria": {
                "sSortAscending": ": attiva per ordinare la colonna in ordine crescente",
                "sSortDescending": ": attiva per ordinare la colonna in ordine decrescente"
            },
            "select": {
                "rows": {
                    "_": "%d righe selezionate",
                    "0": "",
                    "1": "1 riga selezionata"
                }
            }
        },
        select: {
            style: 'single'
        },
        "order": [[ 0, "desc" ]]
    });

    var allEndedBooking = $('table.returned').DataTable({
        "language": {
            "sEmptyTable": "Non hai effettuato nessun prestito in precedenza",
            "sInfo": "Vista da _START_ a _END_ di _TOTAL_ elementi",
            "sInfoEmpty": "Vista da 0 a 0 di 0 elementi",
            "sInfoFiltered": "(filtrati da _MAX_ elementi totali)",
            "sInfoPostFix": "",
            "sInfoThousands": ".",
            "sLengthMenu": "Visualizza _MENU_ elementi",
            "sLoadingRecords": "Caricamento...",
            "sProcessing": "Elaborazione...",
            "sSearch": "Cerca:",
            "sZeroRecords": "La ricerca non ha portato alcun risultato.",
            "oPaginate": {
                "sFirst": "Inizio",
                "sPrevious": "Precedente",
                "sNext": "Successivo",
                "sLast": "Fine"
            },
            "oAria": {
                "sSortAscending": ": attiva per ordinare la colonna in ordine crescente",
                "sSortDescending": ": attiva per ordinare la colonna in ordine decrescente"
            },
            "select": {
                "rows": {
                    "_": "%d righe selezionate",
                    "0": "",
                    "1": "1 riga selezionata"
                }
            }
        },
        select: {
            style: 'single'
        },
        "order": [[ 0, "desc" ]]
    });

    var similarBooks = $('table.similar').DataTable({
        "language": {
            "sEmptyTable": "Nessun libro simile",
            "sInfo": "Vista da _START_ a _END_ di _TOTAL_ elementi",
            "sInfoEmpty": "Vista da 0 a 0 di 0 elementi",
            "sInfoFiltered": "(filtrati da _MAX_ elementi totali)",
            "sInfoPostFix": "",
            "sInfoThousands": ".",
            "sLengthMenu": "Visualizza _MENU_ elementi",
            "sLoadingRecords": "Caricamento...",
            "sProcessing": "Elaborazione...",
            "sSearch": "Cerca:",
            "sZeroRecords": "La ricerca non ha portato alcun risultato.",
            "oPaginate": {
                "sFirst": "Inizio",
                "sPrevious": "Precedente",
                "sNext": "Successivo",
                "sLast": "Fine"
            },
            "oAria": {
                "sSortAscending": ": attiva per ordinare la colonna in ordine crescente",
                "sSortDescending": ": attiva per ordinare la colonna in ordine decrescente"
            },
            "select": {
                "rows": {
                    "_": "%d righe selezionate",
                    "0": "",
                    "1": "1 riga selezionata"
                }
            }
        },
        select: {
            style: 'single'
        }
    });

    $('#containerFormRemove').hide();
    allBooks.on('select', function (e, dt, type, indexes) {
        var $idbook = $('#idbook');
        var $title = $('#title');
        var $author = $('#author');
        var $publisher = $('#publisher');
        var rowData = allBooks.row(indexes).data();
        $idbook.html("").append(rowData[0]);
        $("#inputIdBook").val(rowData[0]);
        $title.html("").append(rowData[1]);
        $author.html("").append(rowData[2]);
        $publisher.html("").append(rowData[3]);
        $('#containerFormRemove').slideDown();
    });

    allBooks.on('deselect', function (e, dt, type, indexes) {

    });

    $('table.allbooks tbody').on('click', 'tr', function () {
        var data = allBooks.row(this).data();
        if (data[0] === $('#idbook').text())
            $('#containerFormRemove').slideUp();
    });

});