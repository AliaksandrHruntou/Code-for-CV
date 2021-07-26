<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Белорусский Народный Банк</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/menu-style.css">
    </head>
    <body>
        <nav class="top-menu" style="border: none;">
            <a class="navbar-logo" href="/BankApp/index.jsp"><img width="500px%"src="images/bnb.jpg"></a>
<!--            <ul class="Navigation">
                <li><a href="../BankApp/read">Клиенты</a></li>
                <li><a href="../BankApp/listdoc">Депозиты</a></li>
                <li><a href="../BankApp/clistdoc">Кредиты</a></li>
                <li><a href="../BankApp/invoices">Счета</a></li>
            </ul>-->
        </nav>
        <h1 align="center">Добро пожаловать!</h1>
       
       <table class="start-table">
        <tr>
            <td>
                <a href="../BankApp/read"><img src="images/clients.png" height="200" width="200"></a>
            </td>
            <td>
                <a href="../BankApp/listdoc"><img src="images/deposits.png" height="200" width="200"></a>
            </td>
            <td>
                <a href="../BankApp/clistdoc"><img src="images/credits.png" height="200" width="200"></a>
            </td>            
        </tr>
        <tr>
            <td>
                <a  href="../BankApp/read"><h2 align="center">Клиенты</h2></a>
            </td>
            <td>
                <a href="../BankApp/listdoc"><h2 align="center">Депозиты</h2></a>
            </td>
            <td>
                <a href="../BankApp/clistdoc"><h2 align="center">Кредиты</h2></a>
            </td>
        </tr>
    </table>   
    </body>
</html>
