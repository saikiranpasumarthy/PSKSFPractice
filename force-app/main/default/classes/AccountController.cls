public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Active__c, Status__c, Rating FROM Account];
    }

    @AuraEnabled(cacheable=true)
    public static List<String> getPicklistValues(String recordType, String picklistField) {
        List<String> picklistValues = new List<String>();
        
        // Fetch the record type Id based on the record type name
        Schema.DescribeSObjectResult describeSObjectResult = Account.SObjectType.getDescribe();
        Map<String, Schema.RecordTypeInfo> recordTypeInfoMap = describeSObjectResult.getRecordTypeInfosByDeveloperName();
        Id recordTypeId = recordTypeInfoMap.get(recordType).getRecordTypeId();
        
        // Describe the field and get picklist values for the specified record type
        Schema.DescribeFieldResult fieldResult = Schema.SObjectType.Account.fields.getMap().get(picklistField).getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
        for (Schema.PicklistEntry f : ple) {
            if (f.getValue().con  getValidFor().contains(recordTypeId)) {
                picklistValues.add(f.getLabel());
            }
        }

        return picklistValues;
    }
}