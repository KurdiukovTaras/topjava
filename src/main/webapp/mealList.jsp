<%@ page import="ru.javawebinar.topjava.model.UserMealWithExceed" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Зверь
  Date: 07.06.2016
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Meal list</title>
<style>
    .normal {color:green;}
    .exceeded {color:red;}
    </style>
</head>
<body>
<h2><a href="index.html">Home</a></h2>
<h2>Meal list</h2>
<a href="meals?action=create">Add Meal</a>>
<%--<c:set var="mealList" value="${mealList}"/>--%>
<table border=1>
    <tr>
        <td>Description</td><td>DateTime</td><td>Calories</td><td>Exceeded?</td><th colspan=2>Action</th>
    </tr>
        <c:forEach items="${mealList}" var="meal">
        <jsp:useBean id="meal" scope="page" type="ru.javawebinar.topjava.model.UserMealWithExceed"/>
            <%--<c:if test="${meal.isExceed() eq true}">--%>
                <%--<tr style="color: red">--%>
            <%--</c:if>--%>
            <%--<c:if test="${meal.isExceed() eq false}">--%>
                <%--<tr style="color: green">--%>
            <%--</c:if>--%>

 <tr class="${meal.exceed?'exceeded':'normal'}">
        <td>${meal.description}</td>
         <td>   <c:set var="cleanedDateTime" value="${fn:replace(meal.dateTime, 'T', ' ')}" />
            <fmt:parseDate value="${ cleanedDateTime }" pattern="yyyy-MM-dd HH:mm" var="parsedDateTime" type="both" />
            <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${ parsedDateTime }" /></td>
        <td>${meal.calories}</td>
        <td>${meal.exceed}</td>
            <td><a href="meals?action=update&id=${meal.id}">Update</a></td>
            <td><a href="meals?action=delete&id=${meal.id}">Delete</a></td>

        <%--<td><a href="<c:url value='/delete-${meal.id}-employee' />">delete</a></td>--%>
    </tr>
    </c:forEach>
    </table>
</body>
</html>
