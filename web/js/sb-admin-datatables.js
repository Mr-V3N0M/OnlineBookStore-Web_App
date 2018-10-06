// Call the dataTables jQuery plugin
$(document).ready(function () {
    var table = $('table.display').DataTable({
        "language": {
            "sEmptyTable": "Nessun dato presente nella tabella",
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
    //$('#containerFormBooking').hide();
    table.on('select', function (e, dt, type, indexes) {
        var $idbook = $('#idbook');
        var $title = $('#title');
        var $author = $('#author');
        var $publisher = $('#publisher');
        var rowData = table.row(indexes).data();
        $idbook.html("").append(rowData[0]);
        $("#inputIdBook").val(rowData[0]);
        $title.html("").append(rowData[1]);
        $author.html("").append(rowData[2]);
        $publisher.html("").append(rowData[3]);
        $('#containerFormBooking').fadeToggle();
    })
        .on( 'deselect', function ( e, dt, type, indexes ) {
            var count = table.rows( { selected: true } ).count();
            //$('#containerFormBookingg').slideUp();
        } );
});