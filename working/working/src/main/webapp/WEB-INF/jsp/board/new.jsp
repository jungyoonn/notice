<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

            function maxLength(){
                const inputElementName = document.getElementById('name');
                const inputValueName = inputElementName.value;

                const inputElementTitle = document.getElementById('title');
                const inputValueTitle = inputElementTitle.value;

                if(inputValueTitle.length > 20) {
                    inputElementTitle.value = inputValueTitle.substring(0, 20);
                    alert('제목은 20자리를 넘길 수 없습니다.');
                }

                if (inputValueName.length > 10) {
                    inputElementName.value = inputValueName.substring(0, 10);
                    alert('이름은 10자리를 넘길수 없습니다.');
                }
            }
        </script>
    </head>
    <body>
    <div class="section">
        <div class="container">
            <div class="board-wrap">
                <div class="board-title">
                    <strong>공지사항</strong>
                    <p>공지사항 신규 등록</p>
                </div>
            </div>
            <div class="board-write-wrap">
                <form id="newNotification" name="newNotification" method="post" oninput="maxLength()" action="/board/save">
                    <div class="board-write">
                        <div class="title">
                            <dl>
                                <dt>제목</dt>
                                <dd>
                                    <input type="text" name="title" id="title" maxlength="20" placeholder="제목을 입력해 주세요"/>
                                    <p class="required-alert" style="margin: 0; color: red; display: none;">필수입력입니다.</p>
                                </dd>
                            </dl>
                            <dl>
                                <dt>말머리</dt>
                                <dd>
                                    <select name="type">
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
                                <dd>
                                    <input type="text" name="name" id="name" maxlength="10" placeholder="작성자"/>
                                    <p class="required-alert" style="margin: 0; color: red; display: none;">필수입력입니다.</p>
                                </dd>
                            </dl>
                            <dl>
                                <dt>비밀번호</dt>
                                <dd>
                                    <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요"/>
                                    <p class="required-alert" style="margin: 0; color: red; display: none;">필수입력입니다.</p>
                                </dd>
                            </dl>
                        </div>
                        <div class="cont">
                            <textarea name="contents" id="contents" placeholder="내용을 입력해 주세요"></textarea>
                        </div>
                    </div>
                    <div class="btn-wrap">
                        <button type="button" onclick="boardApp.create(event, 0)" class="btn-on">등록</button>
                        <a href="/board/main">취소</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </body>
</html>