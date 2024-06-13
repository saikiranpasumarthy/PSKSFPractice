import getCars from '@salesforce/apex/CarController.getCars';
import { LightningElement, wire } from 'lwc';

//Lightning Message channel publish

import CAR_SELECTED_ID from '@salesforce/messageChannel/CarSelected__c';
import CARS_FILTERED_MESSAGE from '@salesforce/messageChannel/CarsFiltered__c';
import { MessageContext, publish, subscribe, unsubscribe } from 'lightning/messageService';

export default class CarTileList extends LightningElement {

    cars = []
    error
    filters = {}
    carFilterSubscription
    @wire(getCars, {filters:'$filters'})
    carsHandler({data, error}){

        if(data){
            console.log('filters data --> ', data);
            this.cars = data
        }
        if(error){
            console.log(error);
            this.error = error
        }
    }

     /* Load Context for Wire */
     @wire(MessageContext)
     messageContext

     connectedCallback(){
        this.subscribeHandler()
     }

     subscribeHandler(){
       this.carFilterSubscription = subscribe(this.messageContext, CARS_FILTERED_MESSAGE, (message)=>this.handleFilterChanges(message))
     }

     handleFilterChanges(message){
        console.log(message.filters);
        this.filters={...message.filters}
     }

     handleCarSelected(event){
        console.log('tile event hit ', event.detail);
        publish(this.messageContext, CAR_SELECTED_ID, {
            carId: event.detail
        })
     }

     disconnectedCallback(){
         unsubscribe(this.carFilterSubscription)
         this.carFilterSubscription = null
     }
}