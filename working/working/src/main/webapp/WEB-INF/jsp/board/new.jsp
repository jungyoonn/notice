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
                    <p>기타 설명란</p>
                </div>
            </div>
            <div class="board-write-wrap">
                <div class="board-write">
                    <div class="title">
                        <dl>
                            <dt>제목</dt>
                            <dd><input type="text" placeholder="제목을 입력해 주세요"/></dd>
                        </dl>
                        <dl>
                            <dt>말머리</dt>
                            <dd>
                                <select name="boardType">
                                    <c:forEach var="boardTypes" items="${boardTypeList}" varStatus="status">
                                        <option value="${boardTypes.val}">${boardTypes.name}</option>
                                    </c:forEach>
                                </select>
                            </dd>
                        </dl>
                    </div>
                    <div class="info">
                        <dl>
                            <dt>작성자</dt>
                            <dd><input type="text" placeholder="작성자"/></dd>
                        </dl>
                        <dl>
                            <dt>비밀번호</dt>
                            <dd><input type="password" placeholder="비밀번호를 입력하세요"/></dd>
                        </dl>
                    </div>
                    <div class="cont">
                        <textarea placeholder="내용을 입력해 주세요"></textarea>
                    </div>
                </div>
                <div class="btn-wrap">
                    <a href="/work/main" class="on">등록</a>
                    <a href="/work/main">취소</a>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
