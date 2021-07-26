<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/add-style.css">
        <link rel="stylesheet" type="text/css" href="css/menu-style.css">
        <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <script type="text/javascript" src="js/jquery.maskedinput.js"></script>
        <title>Добавить клиента</title>
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


        <div class="block" white-space="pre-line">
            <h2 align="center">Добавление нового клиента</h2>
            <form name="addForm" action="addClient" method="get" accept-charset="UTF-8">
                <fieldset>
                    <legend>Информация о клиенте</legend>
                    <label>Имя*</label> 
                    <input type="text" name="name" pattern="[A-Za-zА-Яа-я]+"  value="" required="true">
                    <br>
                    <label>Фамилия*</label> 
                    <input type="text" name="surname" pattern="[A-Za-zА-Яа-я]+" value="" required="true">
                    <br>
                    <label>Отчество*</label> 
                    <input type="text" name="fname" pattern="[A-Za-zА-Яа-я]+" value="" required="true">
                    <br>
                    <label>Дата рождения*</label> 
                    <input type="date" name="birthdate" value="" required="true">
                </fieldset>


                <fieldset>
                    <legend>Паспортные данные</legend>
                    <label>Серия*</label> 
                    <input type="text" name="spp" value="" required="true" pattern="[А-Я]{2,2}" placeholder="XY">
                    <br>
                    <label>Номер*</label> 
                    <input type="text" name="npp" value="" required="true" pattern="[0-9]{7,7}" placeholder="xxxxxxx">
                    <br>
                    <label>Ид. номер*</label> 
                    <input type="text" name="ipp" value="" required="true" pattern="{14,14}" placeholder="14 знаков">
                    <br>
                    <label>Кем выдан*</label> 
                    <input type="text" name="whogive" value="" required="true">
                    <br>
                    <label>Когда выдан*</label> 
                    <input type="date" name="whengive" value="" required="true">
                </fieldset>

                <fieldset>
                    <legend>Информация о месте проживания</legend>
                    <label>Место рождения*</label> 
                    <input type="text" name="cityborn" pattern="[A-Za-zА-Яа-я]+" value="" required="true">
                    <br>
                    <label>Город прописки*</label> 
                    <select name="city">
                        <c:forEach var="row" items="${result1.rows}">
                            <option value="${row.city}">${row.city}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <label>Город проживания*</label> 
                    <select name="citydoc">
                        <c:forEach var="row" items="${result1.rows}">
                            <option value="${row.city}">${row.city}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <label>Адрес проживания*</label> 
                    <input type="text" name="address" value="" required="true">
                </fieldset>

                <fieldset>
                    <legend>Контактные данные</legend>
                    <label>Мобильный телефон</label> 
                    <input type="text" id="mh" name="mobilenum" value="">
                    <br>
                    <label>Домашний телефон</label> 
                    <input type="text" id="hh" name="homenum" value="">
                    <br>
                    <label>Е-mail</label> 
                    <input type="email" name="email" value="">
                </fieldset>

                <fieldset>
                    <legend>Информация о месте работы</legend>
                    <label>Место работы</label> 
                    <input type="text" name="job" value="">
                    <br>
                    <label>Должность</label> 
                    <input type="text" name="post" value="">
                    <br>
                    <label>Доход</label> 
                    <input type="number" name="money" value="0">
                </fieldset>

                <fieldset>
                    <legend>Дополнительная информация</legend>
                    <label>Семейное положение*</label> 
                    <select name="marriage" required="true">
                        <c:forEach var="row" items="${result2.rows}">
                            <option value="${row.family}">${row.family}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <label>Национальнось*</label> 
                    <select name="nat" required="true">
                        <c:forEach var="row" items="${result4.rows}">
                            <option value="${row.national}">${row.national}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <label>Инвалидность*</label> 
                    <select name="invalid" required="true">
                        <c:forEach var="row" items="${result3.rows}">
                            <option value="${row.invalidgroup}">${row.invalidgroup}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <div class="old-form-wrap">
                    <label>Пенсионер</label> 
<!--                    <input type="text" name="oldl" id="oldl" style="display:none" value="">  -->                        
                    <div class="old-form">
                        <input type="radio" width="30" name="old" id="penY" value="Да" > 
                        <label>Да</label> 
                        <input type="radio" width="30" name="old" id="penN" value="Нет" >
                        <label>Нет</label> 
                    </div>
                    </div>
                </fieldset>
                <div class="add-btn-wrap">
                    <input type="submit" name="submit" value="Добавить" class="add-btn">
                </div>
            </form>
        </div>
    </body>
</html>
