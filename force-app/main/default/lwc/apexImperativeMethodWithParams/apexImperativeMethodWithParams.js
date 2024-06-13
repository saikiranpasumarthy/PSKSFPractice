import findContacts from '@salesforce/apex/ContactController.findContacts';
import { LightningElement } from 'lwc';

export default class ApexImperativeMethodWithParams extends LightningElement {
    searchKey = '';
    contacts;
    error;

    handleKeyChange(event){
        this.accessKey = event.target.value;
    }

    async handleSearch(){
        try{
            this.contacts = await findContacts({ searchKey: this.searchKey});
            console.log('this.contacts --> ',this.contacts);
            this.error = undefined;
        } catch(error){
            this.error = error;
            this.contacts = undefined;
        }
    }
}