<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/menu-style.css">
        <title>Белорусский Народный Банк</title>
        <script>
            function confirmClose(arg1) {
                if (confirm("Вы подтверждаете закрытие кредита номер " + arg1)) {
                    location.href = '../../BankApp/CloseCredit?DogID=' + arg1;
                } else {
                    return false;
                }
            }
            
            function sort(el) {
                var col_sort = el.innerHTML;
                var tr = el.parentNode;
                var table = tr.parentNode;
                var th, arrow, col_sort_num;

                for (var i = 0; (th = tr.getElementsByTagName("th").item(i)); i++) {
                    if (th.innerHTML == col_sort) {
                        col_sort_num = i;
                        if (th.prevsort == "y") {
                            arrow = th.firstChild;
                            el.up = Number(!el.up);
                        } else {
                            th.prevsort = "y";
                            arrow = th.insertBefore(document.createElement("span"), th.firstChild);
                            el.up = 0;
                        }
                        //arrow.innerHTML = el.up ? "↑ " : "↓ ";
                    } else {
                        if (th.prevsort == "y") {
                            th.prevsort = "n";
                            if (th.firstChild)
                                th.removeChild(th.firstChild);
                        }
                    }
                }

                var a = new Array();

                for (i = 1; i < table.rows.length; i++) {
                    a[i - 1] = new Array();
                    a[i - 1][0] = table.rows[i].getElementsByTagName("td").item(col_sort_num).innerHTML;
                    a[i - 1][1] = table.rows[i];
                }

                a.sort();
                if (el.up)
                    a.reverse();

                for (i = 0; i < a.length; i++)
                    table.appendChild(a[i][1]);
            }


        </script>
    </head>
    <% String table = (String) request.getAttribute("table");%>

    <body>
        <nav class="top-menu">
            <a class="navbar-logo" href="/BankApp/index.jsp"><img width="500px%"src="images/bnb.jpg"></a>
            <ul class="Navigation">
                <li><a href="../BankApp/read">Клиенты</a></li>
                <li><a href="../BankApp/listdoc">Депозиты</a></li>
                <li><a href="../BankApp/clistdoc">Кредиты</a></li>
            </ul>
        </nav>
        <h1>Модуль КРЕДИТЫ</h1>
        <h2 align="center">Список выданных кредитов 
            <!--input type="button" name="button2" value="Выдать кредит" onclick="location.href = '../BankApp/clist'"--> </h2>
        <h3 align="center" class="add-btn-wrap"><a href="../BankApp/clist" class="add-btn">Выдать кредит</a></h3>
        <div class="block1" >
            <table border='1'>
                <tr>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">№ договора</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">ID клиента</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Имя</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Фамилия</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Тип кредита</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Валюта</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Сумма</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Процент</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Срок договора</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Дата начала</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Дата окончания</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Сумма процентов на конец периода</th>
                </tr>
                <%=table%>  
        </div>


    </body>
</html>
