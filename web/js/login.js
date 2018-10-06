// JavaScript for disabling form submissions if there are invalid fields and AJAX
(function () {
    'use strict';

    window.addEventListener('load', function () {
        var form = document.getElementById('formLogin');
        form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    }, false);
})();

function setXMLHttpRequest() {
    var xhr = null;
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xhr = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xhr;
}

function validate() {
    var oXHR = setXMLHttpRequest();
    var url = "Controller";
    oXHR.open("post", url, true);
    oXHR.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    oXHR.onreadystatechange = function() {
        if (oXHR.readyState === 4) {
            var message = document.getElementById("message");
            if (oXHR.status !== 200) {
                message.innerHTML = "Errore: " + oXHR.status + " " + oXHR.statusText;
            } else {
                var response = parseInt(oXHR.responseText);
                if (response === 1) {
                    window.location = "dashboard.jsp";
                } else {
                    $('#formLogin').toggleClass('was-validated');
                    $('#password').val("");
                    message.innerHTML = "Username e/o password errati!<br>Inserire le credenziali corrette.";
                }
            }
        }
    };
    var params = "action=login" + "&username=" + encodeURIComponent(document.forms[0].username.value) + "&password=" + encodeURIComponent(document.forms[0].password.value);
    oXHR.send(params);
}

function checkInput() {
    if ($('#username').val() !== "" && $('#password').val() !== "") {
        validate();
    }
}