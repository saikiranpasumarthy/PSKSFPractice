@isTest
public class LeadProcessorTest 
{
	public testmethod static void testleads()
    {
        Lead ld = new lead();
        ld.LastName='testlead';
        ld.Company='testcomp';
        ld.MobilePhone='11111';
        ld.Status='Working - Contacted';
        insert ld;
        
        Test.startTest();
        
        LeadProcessor lp = new LeadProcessor();
        database.executeBatch(lp);
        
        system.assertEquals('Dreamforce', ld.LeadSource);
        Test.stopTest();
        
        
    }
    
}