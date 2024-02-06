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
        let contents = target.querySelector("input[name='contents']").value;
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

    update(e, id) {
        Message.confirm("수정하시겠습니까?")
            .then(() =>
            fetch("/work/update", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(this._data),
            })
            )
            .then((response) =>{
                if(!response.ok){
                    throw response.json();
                }
                return response.json()
            })
            .then(() => Message.alert("수정되었습니다."))
            .then((result) => goPage())
            .catch((error) => {
                error.then(e => Message.alert(Object.values(e.errors)));
            });
    }

    delete(e, id) {
        Message.confirm("삭제하시겠습니까?")
            .then(() =>
            fetch(`/work/delete?id=${this._data.id}`))
            .then((response) => {
                if(!response.ok){
                    throw response.json();
                }
                return response.json()
            })
            .then((result) => Message.alert("삭제되었습니다."))
            .then((result) => goPage(0))
            .catch((error) => {
                error.then(e => Message.alert(Object.values(e.errors)))
            });
    }
}

window.boardApp = Board.of();
window.goPage = goPage;