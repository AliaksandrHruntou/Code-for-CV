<%@page import="model.Credits"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Белорусский Народный Банк</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/menu-style.css">        
        <link rel="stylesheet" type="text/css" href="css/add-style-2.css">
    </head>
    <% String table = (String) request.getAttribute("table");%>
    <% Credits cr = new Credits();%>
    <body>
        <nav class="top-menu">
            <a class="navbar-logo" href="/BankApp/index.jsp"><img width="500px%"src="images/bnb.jpg"></a>
            <ul class="Navigation">
                <li><a href="../BankApp/read">Клиенты</a></li>
                <li><a href="../BankApp/listdoc">Депозиты</a></li>
                <li><a href="../BankApp/clistdoc">Кредиты</a></li>
            </ul>
        </nav>
        <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd.MM.yyyy");%>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/vbankdb?useSSL=false&allowPublicKeyRetrieval=true&autoReconnect=true"
                           user="root"  password="nastya6277"/>

        <sql:query dataSource="${snapshot}" var="result1">SELECT * from clients;
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result2">SELECT * from credits;
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result3">SELECT * from currency;
        </sql:query>

        <h1>Модуль КРЕДИТЫ</h1>
        <h2 align="center">Оформление кредита </h2>
        <div class="block-wrap"> 
        <div class="block2">
            <h3 align="center">Таблица параметров</h3>
            <table border='1'id="10">
                <tr>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">ID</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Название</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Кредит BYN</th>     
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Кредит EUR</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Кредит RUB</th>
                    <th onclick="sort(this)" title="Нажмите на заголовок, чтобы отсортировать колонку">Кредит USD</th>
                </tr>
                <%=table%>  
        </div>


        <div class="block3">
            <form name="лadd" action="cnew" method="get" accept-charset="UTF-8">

                <fieldset>
                    <label>Клиент*</label> 
                    <select name="ClientID" required="true">
                        <c:forEach var="row" items="${result1.rows}">
                            <option value="${row.clientID}">${row.name} ${row.surname}</option>
                        </c:forEach>
                    </select>

                    <br>

                    <label>Вид кредита*</label> 
                    <select  name="crID" required="true">
                        <c:forEach var="row" items="${result2.rows}">
                            <option value="${row.creditID}">${row.creditName}</option>
                        </c:forEach>
                    </select>

                    <br>

                    <label>Валюта*</label> 
                    <select id ="11" name="curID" required="true">
                        <c:forEach var="row" items="${result3.rows}">
                            <option value="${row.curID}">${row.curName}</option>
                        </c:forEach>
                    </select>

                    <label>Сумма кредита*</label> 
                    <input type="text" name="summa" value="0" required="true"> 

                </fieldset>

                <fieldset>

                    <label>Дата оформления*</label> 
                    <input type="text" name="dateOfStart" value="<%= df.format(new java.util.Date())%>" required="true" readonly="readonly">
                    <br>

                    <label>На срок, мес*</label> 
                    <input type="text" name="period" value="1" required="true" pattern="^\d+$">
                    <br>


                </fieldset>
                    <div class="add-btn-wrap"><input class="add-btn" type="submit" name="submit" value="Продолжить"></div>

            </form>

        </div>
        </div>

    </body>
</html>
