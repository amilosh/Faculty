<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../css.jsp"/>
    <title><spring:message code="AdminAllStudentsPage"/></title>
</head>
<body>

<div class="wrapper">

    <c:import url="/WEB-INF/views/main/header.jsp"/>

    <div id="content">

        <ul>
            <li><a href="${contextPath}/admin/allRoles"><spring:message code="Roles"/></a></li>
            <li><a href="${contextPath}/admin/allCourses"><spring:message code="Courses"/></a></li>
            <li><a href="${contextPath}/admin/allStudentsPagination/1" class="active"><spring:message code="Students"/></a></li>
            <li><a href="${contextPath}/admin/allTeachersPagination/1"><spring:message code="Teachers"/></a></li>
        </ul>

        <br/>

        <table>
            <caption><spring:message code="ListOfStudents"/></caption>
            <tr>
                <th>userId</th>
                <th>username</th>
                <th>password</th>
            </tr>
            <c:forEach var="s" items="${students}">
                <tr>
                    <td><c:out value="${s.userId}" /></td>
                    <td><c:out value="${s.username}" /></td>
                    <td><c:out value="${s.password}" /></td>
                </tr>
            </c:forEach>
        </table>

        <br/><br/>

        <c:if test="${currentPage != 1}">
            <td><a href="${contextPath}/admin/allStudentsPagination/${currentPage - 1}" class="prev"> Previous </a></td>
        </c:if>

        <c:forEach begin="1" end="${numberOfPages}" var="i">
            <c:choose>
                <c:when test="${currentPage eq i}">
                    <span class="currentPage">${i}</span>
                </c:when>
                <c:otherwise>
                    <a href="${contextPath}/admin/allStudentsPagination/${i}" class="page">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${currentPage lt numberOfPages}">
            <td><a href="${contextPath}/admin/allStudentsPagination/${currentPage + 1}" class="next"> Next </a> </td>
        </c:if>

        <br/><br/>

        <div>
            <form:form name="expelStudent" method="post" action="${contextPath}/admin/expelStudent">
                <input type="text" name="username" placeholder="<spring:message code="StudentName"/>" class="addInput" value=""/><br/><br/>
                <button type="submit" class="addButton"><spring:message code="Expel"/></button>
            </form:form><br/>
        </div>

    </div>

    <c:import url="/WEB-INF/views/main/footer.jsp"/>

</div>

</body>
</html>





















