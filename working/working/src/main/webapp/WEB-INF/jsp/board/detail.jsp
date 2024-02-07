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
            document.getElementById("goEdit").addEventListener('click', function () {
                let pwd = document.getElementById("password").value;
                let inputPwd = document.getElementById("password").dataset.pw;

                if(pwd != inputPwd){
                    let requiredAlertPassword = document.querySelector('.password-alert');
                    requiredAlertPassword.style.display = 'block';
                    return;
                } else {
                    let requiredAlertPassword = document.querySelector('.password-alert');
                    requiredAlertPassword.style.display = 'none';
                }
                location.href="/board/edit?id=${detailDto.id}";
            });
        });
    </script>
</head>
<body>
<div class="section">
    <div class="container">
        <div class="board-wrap">
            <div class="board-title">
                <strong>공지사항</strong>
                <p>상세 조회 페이지</p>
            </div>
        </div>
        <div class="board-write-wrap">
            <div class="board-write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd>
                            ${detailDto.title}
                        </dd>
                    </dl>
                    <dl>
                        <dt>말머리</dt>
                        <dd>
                            ${detailDto.type.name}
                        </dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <dd>
                            ${detailDto.name}
                        </dd>
                    </dl>
                    <dl>
                        <dt>비밀번호</dt>
                        <dd>
                            <input type="password" name="password" id="password" data-pw="${detailDto.password}" placeholder="비밀번호를 입력하세요"/>
                            <p class="password-alert" style="margin: 0; color: red; display: none;">비밀번호를 확인해주세요.</p>
                        </dd>
                    </dl>
                </div>
                <div class="cont">
                    ${detailDto.contents}
                </div>
            </div>
            <div class="btn-wrap">
                <button id="goEdit" class="btn-on">수정</button>
                <a href="/board/main">목록</a>
            </div>

        </div>
    </div>
</div>
</body>
</html>

