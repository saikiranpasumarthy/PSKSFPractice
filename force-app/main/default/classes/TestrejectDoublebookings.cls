@isTest
public class TestrejectDoublebookings 
{
    static testmethod void Testsinglebooking()
    {
	datetime now=system.now();
    session__c newsess= new session__c(name='jscript', session_date__c=now);
        insert newsess;
     speaker__c newspkr= new speaker__c(first_name__c='lois', last_name__c='p');
        insert newspkr;
        
        session_speaker__C newentry = new session_speaker__C(session__c=newsess.Id, speaker__c=newspkr.Id);
        
        Test.startTest();
        database.SaveResult result= database.insert(newentry, false);
        test.stopTest();
        system.assert(result.isSuccess());
        
    }
    
     static testmethod void Testdoublebooking()
    {
	datetime now=system.now();
    session__c newsess1= new session__c(name='session1', session_date__c=now);
        insert newsess1;
        session__c newsess2= new session__c(name='session2', session_date__c=now);
        insert newsess2;
     speaker__c newspkr= new speaker__c(first_name__c='lois', last_name__c='philips');
        insert newspkr;
        
        session_speaker__C newentry1 = new session_speaker__C(session__c=newsess1.Id, speaker__c=newspkr.Id);
        insert newentry1;
        session_speaker__C newentry2 = new session_speaker__C(session__c=newsess2.Id, speaker__c=newspkr.Id);
        
        Test.startTest();
        database.SaveResult result= database.insert(newentry2, false);
        test.stopTest();
        
        system.assert(!result.isSuccess());
        
    }
}