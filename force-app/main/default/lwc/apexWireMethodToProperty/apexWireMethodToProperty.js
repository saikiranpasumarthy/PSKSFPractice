import getContactList from '@salesforce/apex/ContactController.getContactList';
import { LightningElement, wire } from 'lwc';

export default class ApexWireMethodToProperty extends LightningElement {
    @wire(getContactList) contacts;
}