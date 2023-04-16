// use custom event emitter instead of browsers native
// EventTarget because dart monkey patches this class.
class EventEmitter {
    constructor() {
        this._storage = new Map();
    }

    addEventListener(type, handler) {
        if (this._storage.has(type)) {
            this._storage.get(type).push(handler);
        } else {
            this._storage.set(type, [handler]);
        }
    }

    removeEventListener(type, handler) {
        if (this._storage.has(type)) {
            this._storage.set(type, this._storage.get(type).filter((fn) => fn != handler));
            return true;
        }

        return false;
    }

    dispatchEvent(event) {
        if (this._storage.has(event.type)) {
            this._storage.get(event.type).forEach(handler => handler(event));
            return true;
        }

        return false;
    }
}

class JsInteropManager extends EventEmitter {
    constructor() {
        super();

        this.buttonElement = document.createElement('button');
        this.buttonElement.innerText = 'Web Native Button1';
        this.titleElement=document.createElement('title');
        this.titleElement.innerText='aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        this.titleElement.style.height='20%';
        this.titleElement.style.width='50%';
        this.titleElement.text='aaaaa'
          this.titleElement.appendChild(document.createTextNode("Hi there and greetings!"))

        window.addEventListener('click', (e) => {
            if (e.target === this.titleElement/*buttonElement*/) {
                const interopEvent = new JsInteropEvent(Math.floor(Math.random() * 500));
                this.dispatchEvent(interopEvent);
            }
        });

        window._clickManager = this;
    }

  /*  getValueFromJs() {
        return Math.floor(Math.random() * 500);
    }*/
}

class JsInteropEvent {
    constructor(value) {
        this.type = 'InteropEvent';
        this.value = value;
    }
}

window.ClicksNamespace = {
    JsInteropManager,
    JsInteropEvent,
}