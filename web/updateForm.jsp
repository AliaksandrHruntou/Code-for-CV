<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.Clients"%>
<% Clients client = (Clients) request.getAttribute("client");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Редактировать информацию о клиенте</title>
        <link rel="stylesheet" type="text/css" href="css/add-style.css">
        <link rel="stylesheet" type="text/css" href="css/menu-style.css">
        <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <script type="text/javascript" src="js/jquery.maskedinput.js"></script>
        <script>
            $(document).ready(function () {
                if ($("#oldl").val() === "Да") {
                    $("#penY").prop("checked", true);
                } else {
                    $("#penY").prop("checked", false);
                    $("#penN").prop("checked", true);
                }
            });
        </script>
        <script>
            jQuery(function ($) {
                $("#mh").mask("+375(99)999-99-99");
            });
        </script>
        <script>
            jQuery(function ($) {
                $("#hh").mask("+375(99)999-99-99");
            });
        </script>
    </head>
    <body>
        <nav class="top-menu">
            <a class="navbar-logo" href="/BankApp/index.jsp"><img width="500px%"src="images/bnb.jpg"></a>
            <ul class="Navigation">
                <li><a href="../BankApp/read">Клиенты</a></li>
                <li><a href="../BankApp/listdoc">Депозиты</a></li>
                <li><a href="../BankApp/clistdoc">Кредиты</a></li>
                <li><a href="../BankApp/invoices">Счета</a></li>
            </ul>
        </nav>

        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/vbankdb?useSSL=false&allowPublicKeyRetrieval=true&autoReconnect=true"
                           user="root"  password="nastya6277"/>

        <sql:query dataSource="${snapshot}" var="result1">SELECT * from cities;
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result2">SELECT * from families;
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result3">SELECT * from invalids;
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result4">SELECT * from nationals;
        </sql:query>


        <div class="block">
            <h3 align="center">Редактирование профиля клиента</h3>
            <form name="updateForm" action="updateClient" method="get">
                <fieldset>
                    <legend>Информация о клиенте</legend>

                    <label>ClientID</label> 
                    <input type="text" readonly="readonly" name="clientID" value="<%= client.getClientID()%>" required="true">
                    <br>

                    <label>Имя*</label> 
                    <input type="text" name="name" value="<%= client.getName()%>" required="true" pattern="[А-Яа-я]{2,50}">
                    <br>
                    <label>Фамилия*</label> 
                    <input type="text" name="surname" value="<%= client.getSurname()%>" required="true" pattern="[А-Яа-я]{2,50}">
                    <br>
                    <label>Отчество*</label> 
                    <input type="text" name="fname" value="<%= client.getFname()%>" required="true" pattern="[А-Яа-я]{2,50}">
                    <br>
                    <label>Дата рождения*</label> 
                    <input type="date" name="birthdate" value="<%= client.getBirthdate()%>" required="true">
                </fieldset>


                <fieldset>
                    <legend>Пасспортные данные</legend>
                    <label>Серия*</label> 
                    <input type="text" name="spp" value="<%= client.getSpp()%>" required="true" pattern="[А-Я]{2,2}" placeholder="XY">
                    <br>
                    <label>Номер*</label> 
                    <input type="text" name="npp" value="<%= client.getNpp()%>" required="true" pattern="[0-9]{7,7}" placeholder="xxxxxxx">
                    <br>
                    <label>Ид. номер*</label> 
                    <input type="text" name="ipp" value="<%= client.getIpp()%>" required="true" pattern="[А-Яа-я0-9]{14}">
                    <br>
                    <label>Кем выдан*</label> 
                    <input type="text" name="whogive" value="<%= client.getWhogive()%>" required="true">
                    <br>
                    <label>Когда выдан*</label> 
                    <input type="date" name="whengive" value="<%= client.getWhengive()%>" required="true">
                </fieldset>

                <fieldset>
                    <legend>Информация о месте проживания</legend>
                    <label>Место рождения*</label> 
                    <input type="text" name="cityborn" value="<%= client.getCityborn()%>" required="true">
                    <br>
                    <label>Город прописки*</label> 
                    <select name="city">
                        <c:forEach var="row" items="${result1.rows}">
                            <option value="${row.city}">${row.city}</option>
                        </c:forEach>
                        <option selected class="defn"><%= client.getCity()%></option>
                    </select>
                    <br>
                    <label>Город проживания*</label> 
                    <select name="citydoc">
                        <c:forEach var="row" items="${result1.rows}">
                            <option value="${row.city}">${row.city}</option>
                        </c:forEach>
                        <option selected class="defn"><%= client.getCitydoc()%></option>
                    </select>
                    <br>
                    <label>Адрес проживания*</label> 
                    <input type="text" name="address" value="<%= client.getAddress()%>" required="true">
                </fieldset>

                <fieldset>
                    <legend>Контактные данные</legend>
                    <label>Мобильный</label> 
                    <input type="text" id="mh" name="mobilenum" value="<%= client.getMobilenum()%>">
                    <br>
                    <label>Домашний</label> 
                    <input type="text" id="hh" name="homenum" value="<%= client.getHomenum()%>">
                    <br>
                    <label>e-mail</label> 
                    <input type="email" name="email" value="<%= client.getEmail()%>">
                </fieldset>

                <fieldset>
                    <legend>Информация о работе</legend>
                    <label>Место работы</label> 
                    <input type="text" name="job" value="<%= client.getJob()%>">
                    <br>
                    <label>Должность</label> 
                    <input type="text" name="post" value="<%= client.getPost()%>">
                    <br>
                    <label>Доход</label> 
                    <input type="text" name="money" value="<%= client.getMoney()%>">
                </fieldset>

                <fieldset>
                    <legend>Дополнительная информация</legend>
                    <label>Семейное положение*</label> 
                    <select name="marriage" required="true">
                        <c:forEach var="row" items="${result2.rows}">
                            <option value="${row.family}">${row.family}</option>
                        </c:forEach>
                        <option selected class="defn"><%= client.getMarriage()%></option>
                    </select>
                    <br>
                    <label>Национальнось*</label> 
                    <select name="nat" required="true">
                        <c:forEach var="row" items="${result4.rows}">
                            <option value="${row.national}">${row.national}</option>
                        </c:forEach>
                        <option selected class="defn"><%= client.getNat()%></option>
                    </select>
                    <br>
                    <label>Инвалидность*</label> 
                    <select name="invalid" required="true">
                        <c:forEach var="row" items="${result3.rows}">
                            <option value="${row.invalidgroup}">${row.invalidgroup}</option>
                        </c:forEach>
                        <option selected class="defn"><%= client.getInvalid()%></option>
                    </select>
                    <br>
                    <label>Пенсионер</label> 
                    <input type="text" name="oldl" id="oldl" style="display:none" value="<%= client.getOld()%>">  
                    <input type="radio"  name="old" id="penY" value="Да" >Да
                    <br>
                    <label> </label> 
                    <input type="radio"  name="old" id="penN" value="Нет" >Нет   
                </fieldset>

                <input type="submit" name="submit" value="submit">


            </form>
        </div>


    </body>
</html>
