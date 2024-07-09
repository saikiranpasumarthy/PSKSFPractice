@isTest
public class AccountControllerTest {
    
    @testSetup
    static void setupTestData() {
        // Create test record types
        RecordType customerRecordType = new RecordType(
            Name = 'Customer',
            SObjectType = 'Account',
            DeveloperName = 'Customer'
        );
        insert customerRecordType;
        
        RecordType vendorRecordType = new RecordType(
            Name = 'Vendor',
            SObjectType = 'Account',
            DeveloperName = 'Vendor'
        );
        insert vendorRecordType;
        
        // Create test accounts
        Account customerAccount1 = new Account(
            Name = 'Customer Account 1',
            RecordTypeId = customerRecordType.Id,
            IsActive = true,
            Status__c = 'Active',
            Rating__c = 'Hot'
        );
        Account customerAccount2 = new Account(
            Name = 'Customer Account 2',
            RecordTypeId = customerRecordType.Id,
            IsActive = false,
            Status__c = 'Inactive',
            Rating__c = 'Cold'
        );
        Account vendorAccount1 = new Account(
            Name = 'Vendor Account 1',
            RecordTypeId = vendorRecordType.Id,
            IsActive = true,
            Status__c = 'Suspended',
            Rating__c = 'Warm'
        );
        insert new List<Account> { customerAccount1, customerAccount2, vendorAccount1 };
    }
    
    @isTest
    static void testGetAccounts() {
        // Call the method to get accounts
        List<Account> accounts = AccountController.getAccounts();
        
        // Validate the results
        System.assertNotEquals(null, accounts, 'Accounts should not be null');
        System.assertEquals(3, accounts.size(), 'There should be 3 accounts');
    }
    
    @isTest
    static void testGetPicklistValues() {
        // Test for Status field on Customer record type
        List<String> statusValues = AccountController.getPicklistValues('Customer', 'Status__c');
        System.assertNotEquals(null, statusValues, 'Status values should not be null');
        System.assert(statusValues.contains('Active'), 'Status values should contain Active');
        System.assert(statusValues.contains('Inactive'), 'Status values should contain Inactive');
        
        // Test for Rating field on Vendor record type
        List<String> ratingValues = AccountController.getPicklistValues('Vendor', 'Rating__c');
        System.assertNotEquals(null, ratingValues, 'Rating values should not be null');
        System.assert(ratingValues.contains('Warm'), 'Rating values should contain Warm');
        System.assert(ratingValues.contains('Cold'), 'Rating values should contain Cold');
    }
}
