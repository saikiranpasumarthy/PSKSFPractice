import checkApexTypes from '@salesforce/apex/ApexTypesController.checkApexTypes';
import { LightningElement, wire } from 'lwc';

export default class ApexWireMethodWithComplexParams extends LightningElement {
    listItemValue = 0;
    numberValue = 50;
    stringValue = 'Some string';

    parameterObject = {
        someInteger: this.numberValue,
        someString: this.stringValue,
        someList: []
    }

    @wire(checkApexTypes, { wrapper: '$parameterObject'})
    apexResponse;

    handleStringChange(event){
        this.parameterObject = {
            ...this.parameterObject,
            someString: (this.stringValue = event.target.value)
        };
    }
    handleNumberChange(event){
        this.parameterObject = {
            ...this.parameterObject,
            someInteger: (this.numberValue = parseInt(event.target.value, 10))
        };
    }

    handleListItemChange(event){
        const someList = [];

        for(let i = 0; i < event.target.value; i++){
            someList.push(this.stringValue);
        }

        this.parameterObject = {
            ...this.parameterObject,
            someList
        }
        console.log(JSON.stringify(this.someList));
        console.log(JSON.stringify(this.parameterObject));
    }
}