import { LightningElement } from 'lwc';

export default class DisplayName extends LightningElement {


    name
    
    handleClick(event){
        this.name = 'saikiran'
    } 
}