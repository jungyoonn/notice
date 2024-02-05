<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>공지사항</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="resources/css/css.css">
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script>

        </script>
    </head>
    <body>
    <div class="page-inner background" style="background-image: url('/resources/img/bg_01.png'); height: 20rem;">

    </div>
        <div class="section">
            <div class="container">
                <div class="board-wrap">
                    <div class="board-title">
                        <strong>공지사항</strong>
                        <form class="searchForm" name="searchForm" method="post" action="/work/main">
                            <select name="boardType" onchange="this.form.submit()">
                                <option value="">전체</option>
                                <c:forEach var="boardTypes" items="${boardTypeList}" varStatus="status">
                                    <option value="${boardTypes.val}">${boardTypes.name}</option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>
                </div>
                <div class="board-list-wrap">
                    <div class="board-list">
                        <div class="top">
                            <div class="num">번호</div>
                            <div class="types">분류</div>
                            <div class="title">제목</div>
                            <div class="name">작성자</div>
                            <div class="date">작성일</div>
                            <div class="count">조회수</div>
                        </div>
                        <div class="board-page">
                            <%@include file="/WEB-INF/jsp/include/paging.jsp"%>
                        </div>

                    </div>
                    <div class="btn-wrap">
                        <a href="/work/main" class="on">목록</a>
                        <a href="/work/new">등록</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
