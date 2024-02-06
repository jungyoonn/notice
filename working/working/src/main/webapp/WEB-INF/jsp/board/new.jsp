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
                document.getElementById("submit").addEventListener('click', function (){
                    var title = document.getElementById("title").value;
                    var name = document.getElementById("name").value;
                    var password = document.getElementById("password").value;

                    console.log(title, name, password);

                    if(title == "" && name == "" && password == "") {
                        var requiredAlertTitle = document.querySelector('#title + .required-alert');
                        var requiredAlertName = document.querySelector('#name + .required-alert');
                        var requiredAlertPassword = document.querySelector('#password + .required-alert');
                        requiredAlertTitle.style.display = 'block';
                        requiredAlertName.style.display = 'block';
                        requiredAlertPassword.style.display = 'block';
                        return;
                    } else {
                        var requiredAlertTitle = document.querySelector('#title + .required-alert');
                        var requiredAlertName = document.querySelector('#name + .required-alert');
                        var requiredAlertPassword = document.querySelector('#password + .required-alert');
                        requiredAlertTitle.style.display = 'none';
                        requiredAlertName.style.display = 'none';
                        requiredAlertPassword.style.display = 'none';
                    }

                    if (title == "" && name == "") {
                        var requiredAlertTitle = document.querySelector('#title + .required-alert');
                        var requiredAlertName = document.querySelector('#name + .required-alert');
                        requiredAlertTitle.style.display = 'block';
                        requiredAlertName.style.display = 'block';
                        return;
                    } else {
                        var requiredAlertTitle = document.querySelector('#title + .required-alert');
                        var requiredAlertName = document.querySelector('#name + .required-alert');
                        requiredAlertTitle.style.display = 'none';
                        requiredAlertName.style.display = 'none';
                    }

                    if(title == "" && password == "") {
                        var requiredAlertTitle = document.querySelector('#title + .required-alert');
                        var requiredAlertPassword = document.querySelector('#password + .required-alert');
                        requiredAlertTitle.style.display = 'block';
                        requiredAlertPassword.style.display = 'block';
                        return;
                    } else {
                        var requiredAlertTitle = document.querySelector('#title + .required-alert');
                        var requiredAlertPassword = document.querySelector('#password + .required-alert');
                        requiredAlertTitle.style.display = 'none';
                        requiredAlertPassword.style.display = 'none';
                    }

                    if(name == "" && password == ""){
                        var requiredAlertName = document.querySelector('#name + .required-alert');
                        var requiredAlertPassword = document.querySelector('#password + .required-alert');
                        requiredAlertName.style.display = 'block';
                        requiredAlertPassword.style.display = 'block';
                        return;
                    } else {
                        var requiredAlertName = document.querySelector('#name + .required-alert');
                        var requiredAlertPassword = document.querySelector('#password + .required-alert');
                        requiredAlertName.style.display = 'none';
                        requiredAlertPassword.style.display = 'none';
                    }

                    if(title == ""){
                        var requiredAlertTitle = document.querySelector('#title + .required-alert');
                        requiredAlertTitle.style.display = "block";
                        return;
                    } else {
                        var requiredAlertTitle = document.querySelector('#title + .required-alert');
                        requiredAlertTitle.style.display = "none";
                    }

                    if(name == ""){
                        var requiredAlertName = document.querySelector('#name + .required-alert');
                        requiredAlertName.style.display = 'block';
                        return;
                    } else {
                        var requiredAlertName = document.querySelector('#name + .required-alert');
                        requiredAlertName.style.display = 'none';
                    }

                    if(password == ""){
                        var requiredAlertPassword = document.querySelector('#password + .required-alert');
                        requiredAlertPassword.style.display = 'block';
                        return;
                    } else {
                        var requiredAlertPassword = document.querySelector('#password + .required-alert');
                        requiredAlertPassword.style.display = 'none';
                    }

                    document.getElementById("popupContainer").style.display = 'block';

                });

                document.querySelector('input[type="text"]').addEventListener('oninput', function (){
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
                });
            });

            function closePopup(){
                document.querySelector('.close-btn').style.display = 'none';
            }

            /*function checkLength() {
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
            }*/
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
                <form id="newNotification" name="newNotification" method="post" action="/work/save">
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
                        <button type="button" id="submit" class="btn-on">등록</button>
                        <a href="/work/main">취소</a>
                    </div>
                    <div id="popupContainer" class="popup-container">
                        <div class="popup">
                            <span id="closePopup" onclick="closePopup()" class="close-btn">×</span>
                            <p>저장하시겠습니까?</p>
                            <div class="btn-wrap">
                                <button type="submit" class="btn-on">확인</button>
                                <button onclick="closePopup()">취소</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </body>
</html>
