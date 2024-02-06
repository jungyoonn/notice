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
            let submitEvent = "";

            document.addEventListener("DOMContentLoaded", () => {
                /*if("${updateOk}" == true){
                    confirmPopup("수정되었습니다.");
                    location.href = "/work/main";
                }
                if("${deleteOk}" == true){
                    location.href = "/work/main";
                }*/

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
                document.getElementById("popupContainer").style.display = 'none';
            }

            function showPopup(message){
                let div = document.createElement("div");
                div.innerHTML = `
                <div id="popupContainer" class="popup-container">
                    <div class="popup">
                        <span id="closePopup" onclick="closePopup()" class="close-btn">×</span>
                        <p>`
                         + message +
                    `</p>
                            <div class="btn-wrap">
                                <button type="button" id="popupSubmit" onClick="updateOrDelete()" class="btn-on">확인</button>
                                <button onclick="closePopup()">취소</button>
                            </div>
                        </div>
                </div>
                `
                div.style.display = 'flex';
                div.style.zIndex = 2000;
                document.body.appendChild(div);
                document.body.style.overflow = 'hidden';
                document.getElementById("popupContainer").style.display = 'block';
            }

            function confirmPopup(message){
                let div = document.createElement("div");
                div.innerHTML = `
                <div id="popupContainer" class="popup-container">
                    <div class="popup">
                        <span id="closePopup" onclick="closePopup()" class="close-btn">×</span>
                        <p>`
                    + message +
                    `</p>
                            <div class="btn-wrap">
                                <a href="/work/main"><button type="button" class="btn-on">확인</button></a>
                                <button onclick="closePopup()">취소</button>
                            </div>
                        </div>
                </div>
                `
                div.style.display = 'flex';
                div.style.zIndex = 2000;
                document.body.appendChild(div);
                document.body.style.overflow = 'hidden';
                document.getElementById("popupContainer").style.display = 'block';
            }

            /*window.onload=function(){}
            function updateOrDelete(){
                if(submitEvent == "delete"){
                    const delForm = document.getElementById("delNotification");
                    console.log(delForm);
                    delForm.submit();
                } else if(submitEvent == "update"){
                    const form = document.getElementById("updateNotification");
                    form.submit();
                } else if(submitEvent == "fail"){
                    history.reload();
                }
            }*/
        </script>
    </head>
    <body>
        <div class="section">
            <div class="container">
                <div class="board-wrap">
                    <div class="board-title">
                        <strong>공지사항</strong>
                        <p>기타 설명란</p>
                    </div>
                </div>
                <div class="board-write-wrap">
                    <div class="btn-wrap">
                        <%--<form name="delNotification" id="delNotification" method="post" action="/work/delete">
                            <input type="text" id="id" name="id" hidden="hidden" value="<c:out value="${detailDto.id}"/>"/>
                            <input type="text" name="title" hidden="hidden" value="<c:out value="${detailDto.title}"/>"/>
                            <input type="text" name="name" hidden="hidden" value="<c:out value="${detailDto.name}"/>"/>
                            <input type="text" name="password" hidden="hidden" value="<c:out value="${detailDto.password}"/>"/>
                            <input type="text" name="contents" hidden="hidden" value="<c:out value="${detailDto.contents}"/>"/>
                            <button type="button" id="delete" style="background: #777777">삭제</button>
                        </form>--%>
                    </div>
                    <form id="updateNotification" method="post" action="/work/update">
                        <div class="board-write">
                            <div class="title">
                                <dl>
                                    <dt>제목</dt>
                                    <dd>
                                        <input type="text" maxlength="20" name="title" id="title" value="<c:out value="${detailDto.title}"/>"/>
                                        <p class="required-alert" style="margin: 0; color: red; display: none;">필수입력입니다.</p>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>말머리</dt>
                                    <dd>
                                        <select name="type">
                                            <c:forEach var="boardTypes" items="${boardTypeList}" varStatus="status">
                                                <option value="${boardTypes.val}" <c:if test="${detailDto.type == boardTypes.val}"> selected</c:if>>${boardTypes.name}</option>
                                            </c:forEach>
                                        </select>
                                    </dd>
                                </dl>
                            </div>
                            <div class="info">
                                <dl>
                                    <dt>작성자</dt>
                                    <dd>
                                        <input type="text" maxlength="10" name="name" id="name" value="<c:out value="${detailDto.name}"/>"/>
                                        <p class="required-alert" style="margin: 0; color: red; display: none;">필수입력입니다.</p>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>비밀번호</dt>
                                    <dd>
                                        <input type="password" name="password" id="password" data-pw="${detailDto.password}" placeholder="비밀번호를 입력하세요"/>
                                        <p class="required-alert" style="margin: 0; color: red; display: none;">필수입력입니다.</p>
                                        <p class="password-alert" style="margin: 0; color: red; display: none;">비밀번호를 확인해주세요.</p>
                                    </dd>
                                </dl>
                            </div>
                            <div class="cont">
                                <textarea><c:out value="${detailDto.contents}"/></textarea>
                            </div>
                        </div>
                        <div class="btn-wrap">
                            <button type="button" id="update" onclick="boardApp.update(event, ${detailDto.id})" class="btn-on">수정</button>
                            <a href="/work/main">취소</a>
                            <button type="button" id="delete" onclick="boardApp.delete(event, ${detailDto.id})" style="background: #777777">삭제</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
