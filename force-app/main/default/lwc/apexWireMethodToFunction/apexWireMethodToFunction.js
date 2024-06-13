import getContactList from '@salesforce/apex/ContactController.getContactList';
import { LightningElement, wire } from 'lwc';

export default class ApexWireMethodToFunction extends LightningElement {

    contacts;
    error;

    @wire(getContactList)
    wiredContacts({ data, error }){
        if(data){
            this.contacts = data;
            this.error = undefined;
        }else if(error){
            this.contacts = undefined;
            this.error = error;
        }
    }
}