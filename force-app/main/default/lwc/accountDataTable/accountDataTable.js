import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import getPicklistValues from '@salesforce/apex/AccountController.getPicklistValues';
import { LightningElement, track } from 'lwc';

export default class AccountDataTable extends LightningElement {
    @track accounts;
    @track recordTypeOptions = [
        { label: 'Customer', value: 'Customer' },
        { label: 'Vendor', value: 'Vendor' }
    ];
    @track picklistFieldOptions = [
        { label: 'Status', value: 'Status' },
        { label: 'Rating', value: 'Rating' }
    ];
    @track picklistValueOptions = [];

    selectedRecordType;
    selectedPicklistField;
    selectedPicklistValue;

    columns = [
        { label: 'Account Name', fieldName: 'Name' },
        { label: 'Is Active', fieldName: 'IsActive', type: 'image', 
          cellAttributes: { iconName: { fieldName: 'isActiveIcon' } } },
        { label: 'Status', fieldName: 'Status__c' },
        { label: 'Rating', fieldName: 'Rating__c' }
    ];

    connectedCallback() {
        this.loadAccounts();
    }

    loadAccounts() {
        getAccounts().then(result => {
            this.accounts = result.map(acc => {
                return {
                    ...acc,
                    isActiveIcon: acc.IsActive ? 'utility:check' : 'utility:close'
                };
            });
        }).catch(error => {
            console.error('Error fetching accounts: ', error);
        });
    }

    handleRecordTypeChange(event) {
        this.selectedRecordType = event.detail.value;
        this.updatePicklistValues();
    }

    handlePicklistFieldChange(event) {
        this.selectedPicklistField = event.detail.value;
        this.updatePicklistValues();
    }

    handlePicklistValueChange(event) {
        this.selectedPicklistValue = event.detail.value;
        this.loadAccounts();
    }

    updatePicklistValues() {
        if (this.selectedRecordType && this.selectedPicklistField) {
            getPicklistValues({ recordType: this.selectedRecordType, picklistField: this.selectedPicklistField })
                .then(result => {
                    this.picklistValueOptions = result.map(value => {
                        return { label: value, value: value };
                    });
                })
                .catch(error => {
                    console.error('Error fetching picklist values: ', error);
                });
        } else {
            this.picklistValueOptions = [];
        }
    }
}
