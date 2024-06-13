import CAR_OBJECT from '@salesforce/schema/Car__c';
import CATEGORY_FIELD from '@salesforce/schema/Car__c.Category__c';
import CONTROL_FIELD from '@salesforce/schema/Car__c.Control__c';
import FUEL_FIELD from '@salesforce/schema/Car__c.Fuel_Type__c';
import MSRP_FIELD from '@salesforce/schema/Car__c.MSRP__c';
import MAKE_FIELD from '@salesforce/schema/Car__c.Make__c';
import NAME_FIELD from '@salesforce/schema/Car__c.Name';
import PICTURE_URL_FIELD from '@salesforce/schema/Car__c.Picture_URL__c';
import SEATS_FIELD from '@salesforce/schema/Car__c.seats__c';
import { NavigationMixin } from 'lightning/navigation';
import { getFieldValue } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
//Lightning Message channel publish

import CAR_SELECTED_ID from '@salesforce/messageChannel/CarSelected__c';
import { MessageContext, subscribe, unsubscribe } from 'lightning/messageService';


export default class CarCard extends NavigationMixin(LightningElement) {

    //exposing fields to make them avialable in the template
    categoryField = CATEGORY_FIELD
    makeField = MAKE_FIELD
    msrpField = MSRP_FIELD
    fuelField = FUEL_FIELD
    seatsField = SEATS_FIELD
    controlField = CONTROL_FIELD

    //Id of car object
    recordId

    carName
    carPictureUrl
    carIdSelectedSubscription

    @wire(MessageContext)
    messageContext

    connectedCallback(){
        this.subscribrCarTileId()
    }

    subscribrCarTileId(){
        this.carIdSelectedSubscription = subscribe(this.messageContext, CAR_SELECTED_ID, (message) => this.handleCarIdSelected(message))
    }

    handleCarIdSelected(message){
        console.log('selected car id subcribed ', message);
        this.recordId = message.carId
    }

    handleRecordLoaded(event){
        const {records} = event.detail
        const recordData = records[this.recordId]

        this.carName = getFieldValue(recordData, NAME_FIELD)
        this.carPictureUrl = getFieldValue(recordData, PICTURE_URL_FIELD)  
    }

    disconnectedCallback(){
        unsubscribe(this.carIdSelectedSubscription)
        this.carIdSelectedSubscription = null
    }

    handleNavigateRecord(){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId,
                objectApiName : CAR_OBJECT.objectApiName,
                actionName: 'view'

            }
        })
    }
}