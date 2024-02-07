export class Crypto{
    constructor(){
    }
    randomUUID(){
        return new Date().getTime() + Math.random();
    }
}

export class _Event extends Crypto {
    constructor(){
        super();
       document.addEventListener("DOMContentLoaded", () => {
            this.event();
        });
    }

    event(){
    }

    addEventListnerAll(selector, event, func){
        [].map.call(document.querySelectorAll(selector), target => target.addEventListener(event, func));
    }
}

export class App extends _Event{
    constructor(){
        super();
        this.uuid = super.randomUUID()
        this._data = {};
        this._app = document;


        window[this.uuid]= this;
    }


    refFunc(func){
        return `window['${this.uuid}'].${func.name}(event)`;
    }

    data(data){
        this._data = data;
        this.render();
        return data;
    }

    getData(){
        return this._data;
    }

    render(){
        if(this._data.modifiedDate && this._data.modifiedDate != '' && this._data.modifiedDate.length > 9){
            document.querySelector("#modifiedDate").innerText = this._data.modifiedDate.substring(0, 10);
        } else {
            document.querySelector("#modifiedDate").innerText = this._data.modifiedDate;
        }

        document.querySelector("#modifiedBy").innerText = this._data.modifiedBy;
        return true;
    }

    bind(selector){

        let binds = this._app.querySelectorAll(selector);

        const event = (bind) => {
            if(bind.type == "radio"){
                bind.addEventListener("click", action);
            }else {
                bind.addEventListener("change", action);
            }
        }

        const action = (e) => {

            let uuid = e.target.parentElement.dataset.uuid;
            let index = e.target.parentElement.dataset.index;
            let name = e.target.name;
            let value = e.target.value;
            let dataset = this._data;

            if(e.target.type == "checkbox"){
                value = e.target.checked;
            }

            if(e.target.type == "number"){
                value = Number(e.target.value);
            }

            if(e.target.classList.contains("dateStart") ||    e.target.classList.contains("dateEnd")){
                value = value.replaceAll(/-/g, '');
            }

            let isRender = false;
            if(Array.isArray(dataset)){
                dataset.map(d => {
                    if(d.uuid == uuid && d[name] != value){
                        d[name] = value;
                        isRender = true;
                    }
                    return d;
                });

            } else if(dataset[name] != value){
                dataset[name] = value;
                isRender = true;
            }

            if(isRender){
                this.render();
            }
        };
        [].map.call(binds, event);
    }
}

export class BaseData extends Crypto{
    constructor(){
        super();
        this.uuid = super.randomUUID()
        this.modifiedDate = '';
        this.modifiedBy = '';
    }
}

export class Message extends Crypto{
    constructor(){
        super();
        this.uuid = super.randomUUID()
        window[this.uuid]= this;
    }

    static of(){
        return new Message();
    }

    refFunc(func){
        return `window['${this.uuid}'].${func.name}(event)`;
    }

    ok(){
        document.querySelector("._message").remove();
        document.body.style.overflow = 'auto';
        this.resolve(true);
    }

    cancel(){
        document.querySelector("._message").remove();
        document.body.style.overflow = 'auto';
        this.reject(false);
    }

    static alert(message){
        return Message.of()._alert(message);
    }

    _alert(message){
        return new Promise((resolve, reject) => {
            this.resolve = resolve;
            this.reject = reject;
            let div = document.createElement("div");
            div.innerHTML = Array.isArray(message) ?
                `
                <div id="popupContainer" class="popup-container">
                    <div class="popup">
                        <span id="closePopup" onclick=${this.refFunc(this.cancel)} class="close-btn">×</span>
                        <p>${message.map(d => (d + '<br>')).join('')}</p>
                        <div class="btn-wrap">
                            <button onclick=${this.refFunc(this.ok)} class="btn-on">확인</button>
                            <button onclick=${this.refFunc(this.cancel)}>닫기</button>
                        </div>
                    </div>
                </div>
            `
                :
                `
                <div id="popupContainer" class="popup-container">
                    <div class="popup">
                        <span id="closePopup" onclick=${this.refFunc(this.cancel)} class="close-btn">×</span>
                        <p>${message}</p>
                        <div class="btn-wrap">
                            <button onclick=${this.refFunc(this.cancel)} class="btn-on">확인</button>
                            <button onclick=${this.refFunc(this.cancel)}>취소</button>
                        </div>
                    </div>
                </div>
            `

            div.classList.add("_message");
            div.style.display = 'flex';
            div.style.zIndex = 2000;
            document.body.appendChild(div);
            document.body.style.overflow = 'hidden';
        });
    }

    static confirm(message){
        return Message.of()._confirm(message);
    }

    _confirm(message){
        return new Promise((resolve, reject) => {
            this.resolve = resolve;
            this.reject = reject;
            let div = document.createElement("div");
            div.innerHTML =
                `
                <div id="popupContainer" class="popup-container">
                    <div class="popup">
                        <span id="closePopup" onclick=${this.refFunc(this.cancel)} class="close-btn">×</span>
                        <p>${message}</p>
                        <div class="btn-wrap">
                            <button onclick=${this.refFunc(this.ok)} class="btn-on">확인</button>
                            <button onclick=${this.refFunc(this.cancel)}>취소</button>
                        </div>
                    </div>
                </div>
            `

            div.classList.add("_message");
            div.style.display = 'flex';
            div.style.zIndex = 2000;
            document.body.appendChild(div);
            document.body.style.overflow = 'hidden';
        });
    }
    static maxLengthAlert(message){
        let div = document.createElement("div");
        div.innerHTML =
            `
                <div id="popupContainer" class="popup-container">
                    <div class="popup">
                        <span id="closePopup" onClick="${this.refFunc(this.close)}" class="close-btn">×</span>
                        <p>${message}</p>
                        <div class="btn-wrap">
                            <button onClick="${this.refFunc(this.close)}" class="btn-on">확인</button>
                        </div>
                    </div>
                </div>
            `

        div.classList.add("_message");
        div.style.display = 'flex';
        div.style.zIndex = 2000;
        document.body.appendChild(div);
        document.body.style.overflow = 'hidden';
    }
}
