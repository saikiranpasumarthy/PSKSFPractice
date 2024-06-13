import findContacts from '@salesforce/apex/ContactController.findContacts';
import { LightningElement, wire } from 'lwc';

const DELAY = 300;

export default class ApexWireMethodWithParams extends LightningElement {
    searchKey = '';

    @wire(findContacts, {searchKey: '$searchKey'})
    contacts;

    handleKeyChange(event){

        window.clearTimeout(this.delayTimeout);
        const searchKey = event.target.value;
        this.delayTimeout = setTimeout(() => {
            this.searchKey = searchKey;
        }, DELAY);
    }

}