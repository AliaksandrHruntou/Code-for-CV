<%@page import="model.Clients"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.OC"%>
<% OC oc = (OC) request.getAttribute("oc");%>
<% Clients client = (Clients) request.getAttribute("client");%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Выдача кредита</title>
        <link rel="stylesheet" type="text/css" href="css/add-style.css">
        <link rel="stylesheet" type="text/css" href="css/menu-style.css">
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

        <sql:query dataSource="${snapshot}" var="result1">SELECT * from credits
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result2">SELECT * from families;
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result3">SELECT * from invalids;
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result4">SELECT * from nationals;
        </sql:query>
        <sql:query dataSource="${snapshot}" var="result5">SELECT * from currency;
        </sql:query>


        <div class="block">
            <h3 align="center">Оформление кредита</h3>
            <form name="cconf" action="cconfD" method="get" accept-charset="UTF-8">
                <fieldset>
                    <legend>Информация о клиенте</legend>

                    <label>ClientID</label> 
                    <input type="text" readonly="readonly" name="clientID" value="<%= client.getClientID()%>" required="true">
                    <br>

                    <label>Имя*</label> 
                    <input type="text" readonly="readonly" name="name" value="<%= client.getName()%>" required="true">
                    <br>
                    <label>Фамилия*</label> 
                    <input type="text" readonly="readonly" name="surname" value="<%= client.getSurname()%>" required="true">
                    <br>
                    <label>Отчество*</label> 
                    <input type="text" readonly="readonly" name="fname" value="<%= client.getFname()%>" required="true">
                    <br>
                    <label>Дата рождения*</label> 
                    <input type="date" readonly="readonly" name="birthdate" value="<%= client.getBirthdate()%>" required="true">
                </fieldset>


                <fieldset>
                    <legend>Пасспортные данные</legend>
                    <label>Серия*</label> 
                    <input type="text" readonly="readonly" name="spp" value="<%= client.getSpp()%>" required="true" pattern="[А-Я]{2,2}" placeholder="XY">
                    <br>
                    <label>Номер*</label> 
                    <input type="text" readonly="readonly" name="npp" value="<%= client.getNpp()%>" required="true" pattern="[0-9]{7,7}" placeholder="xxxxxxx">
                    <br>
                    <label>Кем выдан*</label> 
                    <input type="text" readonly="readonly" name="whogive" value="<%= client.getWhogive()%>" required="true">
                    <br>
                    <label>Когда выдан*</label> 
                    <input type="date" readonly="readonly" name="whengive" value="<%= client.getWhengive()%>" required="true">
                </fieldset>

                <fieldset>
                    <legend>Информация о кредите</legend>

                    <label>Кредит*</label> 
                    <c:forEach var="row" items="${result1.rows}">
                        <c:set var="a" scope="session" value="${row.creditID}"/>
                        <c:set var="b" scope="session" value="<%= oc.getCrId()%>"/>

                        <c:if test="${a == b}">
                            <input type="text" readonly="readonly" name="crName" value="<c:out value="${row.creditName}"/>" required="true">
                        </c:if>

                    </c:forEach>


                    <label>Валюта*</label> 


                    <c:forEach var="row" items="${result5.rows}">
                        <c:set var="a" scope="session" value="${row.curID}"/>
                        <c:set var="b" scope="session" value="<%= oc.getCurId()%>"/>

                        <c:if test="${a == b}">
                            <input type="text" readonly="readonly" name="curName" value="<c:out value="${row.curName}"/>" required="true">
                        </c:if>

                    </c:forEach>



                    <br>


                    <label>Процентная ставка*</label> 
                    <input type="text" readonly="readonly" name="percent" value="<%= oc.getPercent()%>" required="true">
                    <br>

                </fieldset>

                <fieldset>
                    <legend>Информация о сроках</legend>

                    <label>Дата выдачи*</label> 
                    <input type="text" readonly="readonly" name="dateOfStart" value="<%= oc.getDateOfStart()%>" required="true">
                    <br>
                    <label>Дата закрытия*</label> 
                    <input type="text" readonly="readonly" name="dateOfFinish" value="<%= oc.getDateOfFinish()%>" required="true">
                    <br>
                    <label>Срок договора</label> 
                    <input type="text" readonly="readonly" name="period" value="<%= oc.getPeriod()%>" >

                </fieldset>

                <fieldset>
                    <legend>Размер кредита</legend>

                    <label>Сумма кредита*</label> 
                    <input type="text" readonly="readonly" name="summa" value="<%= oc.getSumma()%>" required="true">
                    <br>
                    <label>Проценты по окончанию срока*</label> 
                    <input type="text" readonly="readonly" name="accumulation" value="<%= oc.getAccumulation()%>" required="true">

                </fieldset>

                    <div class="add-btn-wrap"><input class="add-btn" type="submit" name="submit" value="Выдать кредит"></div>


            </form>
        </div>


    </body>
</html>

