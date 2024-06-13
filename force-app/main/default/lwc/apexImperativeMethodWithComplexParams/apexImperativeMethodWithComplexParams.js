import checkApexTypes from '@salesforce/apex/ApexTypesController.checkApexTypes';
import { LightningElement } from 'lwc';

export default class ApexImperativeMethodWithComplexParams extends LightningElement {
    listItemValue = 4;
    numberValue = 50;
    stringValue = 'Some string';

    message;
    error;

    handleStringChange(event){
        this.stringValue = event.target.value;
    }

    handleNumberChange(event){
        this.numberValue = event.target.value;
    }

    handleListItemChange(event){
        this.listItemValue = event.target.value;
    }

    async handleButtonClick(){

        let parameterObject = {
            someString: this.stringValue,
            someInteger: this.numberValue,
            someList: []
        };

        for(let i = 0; i < this.listItemValue; i++){            
            parameterObject.someList.push(this.stringValue);
        }
       
        try{
            this.message = await checkApexTypes({ wrapper: parameterObject });            
            this.error = undefined;
        } catch (error) {
            this.message = undefined;
            this.error = error;
        }
    }
}