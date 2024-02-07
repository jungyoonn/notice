import { App, BaseData, Message } from "./app.js";
import {goPage} from "./common.js";

class BoardData extends BaseData {
    constructor(id, title, contents, name, type, password) {
        super();
        this.id = id;
        this.title = title;
        this.contents = contents;
        this.name = name;
        this.type = type;
        this.password = password;
    }

    static of(id, target) {
        let title = target.querySelector("input[name='title']").value;
        let contents = target.querySelector("textarea[name='contents']").value;
        let name = target.querySelector("input[name='name']").value;
        let type = target.querySelector("select[name='type']").value;
        let password = target.querySelector("input[name='password']").value;

        return new BoardData(id, title, contents, name, type, password);
    }
}

export class Board extends App {
    constructor() {
        super();
    }

    static of() {
        return new Board();
    }

    maxLength(){
        const inputElementName = document.getElementById('name');
        const inputValueName = inputElementName.value;

        const inputElementTitle = document.getElementById('title');
        const inputValueTitle = inputElementTitle.value;

        if(inputValueTitle.length > 19) {
            inputElementTitle.value = inputValueTitle.substring(0, 19);
            let maxAlertTitle = document.querySelector('.title-max-alert');
            maxAlertTitle.style.display = 'block';
        } else {
            let maxAlertTitle = document.querySelector('.title-max-alert');
            maxAlertTitle.style.display = 'none';
        }

        if (inputValueName.length > 9) {
            inputElementName.value = inputValueName.substring(0, 9);
            let maxAlertName = document.querySelector('.name-max-alert');
            maxAlertName.style.display = 'block';
        } else {
            let maxAlertName = document.querySelector('.name-max-alert');
            maxAlertName.style.display = 'none';
        }
    }

    create(e, id){
        let title = document.getElementById("title").value;
        let name = document.getElementById("name").value;
        let password = document.getElementById("password").value;

        let requiredAlertTitle = document.querySelector('#title + .required-alert');
        let requiredAlertName = document.querySelector('#name + .required-alert');
        let requiredAlertPassword = document.querySelector('#password + .required-alert');

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

        if(title == ""){
            requiredAlertTitle.style.display = "block";
            return;
        } else {
            requiredAlertTitle.style.display = "none";
        }

        if(name == ""){
            requiredAlertName.style.display = 'block';
            return;
        } else {
            requiredAlertName.style.display = 'none';
        }

        if(password == ""){
            requiredAlertPassword.style.display = 'block';
            return;
        } else {
            requiredAlertPassword.style.display = 'none';
        }

        Message.confirm("등록하시겠습니까?")
            .then(() => {
                let data = BoardData.of(id, e.target.parentElement.parentElement);
                fetch("/board/save", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(data),
                }).then((response) =>{
                    if(!response.ok){
                        throw response.json();
                    }
                    return response.json()
                })
                    .then(() => Message.alert("등록되었습니다."))
                    .catch((error) => {
                        console.log(error);
                        //error.then(e => Message.alert(Object.values(e.errors)));
                    })
                    .then(() => location.href="/board/main");
            })
    }

    update(e, id) {
        let title = document.getElementById("title").value;
        let name = document.getElementById("name").value;
        let password = document.getElementById("password").value;

        let requiredAlertTitle = document.querySelector('#title + .required-alert');
        let requiredAlertName = document.querySelector('#name + .required-alert');
        let requiredAlertPassword = document.querySelector('#password + .required-alert');

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

        if(title == ""){
            requiredAlertTitle.style.display = "block";
            return;
        } else {
            requiredAlertTitle.style.display = "none";
        }

        if(name == ""){
            requiredAlertName.style.display = 'block';
            return;
        } else {
            requiredAlertName.style.display = 'none';
        }

        if(password == ""){
            requiredAlertPassword.style.display = 'block';
            return;
        } else {
            requiredAlertPassword.style.display = 'none';
        }

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

        Message.confirm("수정하시겠습니까?")
        .then(() => {
            let data = BoardData.of(id, e.target.parentElement.parentElement);
            fetch("/board/update", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data),
            })
             .then((response) =>{
                    if(!response.ok){
                        throw response.json();
                    }
                    return response.json()
             })
            .then(() => Message.alert("수정되었습니다."))
            .catch((error) => {
                console.log(error);
                //error.then(e => Message.alert(Object.values(e.errors)));
            }).then(() => location.href="/board/main");
            /*;(async () => {
                throw new Error('error')
            })().catch((error) => {
                console.log(error)
            });*/
        })
    }

    delete(e, id) {
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

        Message.confirm("삭제하시겠습니까?")
            .then(() =>
            fetch(`/board/delete?id=${id}`))
            .then((response) => {
                if(!response.ok){
                    throw response.json();
                }
                return response.json()
            })
            .then(() => Message.alert("삭제되었습니다."))
            .catch((error) => {
                //error.then(e => Message.alert(Object.values(e.errors)))
                console.log(error)
            }).then(() => location.href="/board/main");
    }
}

window.boardApp = Board.of();
window.goPage = goPage;