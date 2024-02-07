<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>공지사항</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="resources/resource/css.css">
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script type="module" src="resources/resource/board.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", () => {

            });
        </script>
    </head>
    <body>
    <%--<div class="page-inner background" style="background-image: url('/resources/img/bg_01.png'); height: 20rem;">
        <img src="/resources/static/bg_01.png" style="text-align: center; height: 15rem;" alt=""/>
    </div>--%>
        <div class="section">
            <div class="container">
                <div class="board-wrap">
                    <div class="board-title">
                        <strong>공지사항</strong>
                        <form class="searchForm" name="searchForm" method="get" action="/board/main">
                            <select name="type" id="type" onchange="this.form.submit()">
                                <option value="">전체</option>
                                <c:forEach var="boardTypes" items="${boardTypeList}" varStatus="status">
                                    <option value="${boardTypes.val}" <c:if test="${search.type == boardTypes.val}"> selected</c:if>>${boardTypes.name}</option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>
                </div>
                <div class="board-list-wrap">
                    <form id="searchForm" name="searchForm" method="get" action="/board/main">
                        <input type="hidden" id="page" name="page" value="0" onchange="this.form.submit()"/>
                    </form>
                    <div class="board-list">
                        <div class="top">
                            <div class="num">번호</div>
                            <div class="types">분류</div>
                            <div class="title">제목</div>
                            <div class="name">작성자</div>
                            <div class="date">작성일</div>
                            <div class="count">조회수</div>
                        </div>
                        <c:forEach var="data" items="${page.content}" varStatus="status">
                            <div>
                                <div class="num"><c:out value="${page.totalElements - (page.size * page.number) - status.index}"/></div>
                                <div class="types"><c:out value="${data.type.name}"/></div>
                                <div class="title"><a href="/board/detail?id=${data.id}"><c:out value="${data.title}"/></a></div>
                                <div class="name"><c:out value="${data.name}"/></div>
                                <div class="date">
                                    <fmt:parseDate value="${data.createdDate}" var="data_createdDate" pattern="yyyy-MM-dd'T'HH:mm" />
                                    <fmt:formatDate value="${data_createdDate}" pattern="yyyy-MM-dd" />
                                </div>
                                <div class="count"><c:out value="${data.count}"/></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="board-page">
                        <%@include file="/WEB-INF/jsp/include/paging.jsp"%>
                    </div>
                    <div class="btn-wrap">
                        <a href="/board/main" class="on">목록</a>
                        <a href="/board/new">등록</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
