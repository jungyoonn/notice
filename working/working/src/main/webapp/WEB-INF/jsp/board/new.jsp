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
        <script type="module">
            document.addEventListener("DOMContentLoaded", () => {

            });

            function save(){
                var title = document.getElementById("title").value;
                var name = document.getElementById("name").value;
                var password = document.getElementById("password").value;

                var requiredAlertTitle = document.querySelector('#title + .required-alert');
                var requiredAlertName = document.querySelector('#name + .required-alert');
                var requiredAlertPassword = document.querySelector('#password + .required-alert');


                if(title == "" && name == "" && password == "") {
                    requiredAlertTitle.style.display = 'block';
                    requiredAlertName.style.display = 'block';
                    requiredAlertPassword.style.display = 'block';
                    return;
                } else {
                    requiredAlertTitle.style.display = 'none';
                    requiredAlertName.style.display = 'none';
                    requiredAlertPassword.style.display = 'none';
                }

                if (title == "" && name == "") {
                    requiredAlertTitle.style.display = 'block';
                    requiredAlertName.style.display = 'block';
                    return;
                } else {
                    requiredAlertTitle.style.display = 'none';
                    requiredAlertName.style.display = 'none';
                }

                if(title == "" && password == "") {
                    requiredAlertTitle.style.display = 'block';
                    requiredAlertPassword.style.display = 'block';
                    return;
                } else {
                    requiredAlertTitle.style.display = 'none';
                    requiredAlertPassword.style.display = 'none';
                }

                if(name == "" && password == ""){
                    requiredAlertName.style.display = 'block';
                    requiredAlertPassword.style.display = 'block';
                    return;
                } else {
                    requiredAlertName.style.display = 'none';
                    requiredAlertPassword.style.display = 'none';
                }

                const formSubmit = document.getElementById("newNotification");
                formSubmit.submit();
            }

            function checkInputLength() {
                var inputElementName = document.getElementById('name');
                var inputValueName = inputElementName.value;

                var inputElementTitle = document.getElementById('title');
                var inputValueTitle = inputElementTitle.value;

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
                <form id="newNotification" name="newNotification" method="post" oninput="checkInputLength()" action="/work/save">
                    <div class="board-write">
                        <div class="title">
                            <dl>
                                <dt>제목</dt>
                                <dd>
                                    <input type="text" name="title" id="title" placeholder="제목을 입력해 주세요"/>
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
                                    <input type="text" name="name" id="name" placeholder="작성자"/>
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
                        <button onclick="save()" class="btn-on">등록</button>
                        <a href="/work/main">취소</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </body>
</html>
