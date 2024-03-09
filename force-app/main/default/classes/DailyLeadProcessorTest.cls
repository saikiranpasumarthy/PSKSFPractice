@isTest

public class DailyLeadProcessorTest 
{
    @isTest 
    public static void Testleadssource()
    {
        List<lead> newleads = new List<Lead>();
        
        for(integer i=0; i < 200; i++)
        {
            newleads.add(new lead(LastName = 'test '+i, Company = 'sample', MobilePhone = '1234567', Status = 'Open - Not Contacted'));
        }
        insert newleads;
        
        DailyLeadProcessor scdl = new DailyLeadProcessor();
        
        test.startTest();
        //system.schedule('DailyLeadJob', '0 45 17 9 DEC ? 2019', scdl);
        system.schedule('DailyLeadJob', '0 56 11 10 DEC ? 2019', scdl);
        //lead lnew = [select LeadSource from lead where LastName = 'test 1' limit 1];
        test.stopTest();
        
        //system.assertNotEquals(lnew.LeadSource, '');
    }
}