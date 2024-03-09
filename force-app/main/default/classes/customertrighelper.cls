public class customertrighelper 
{ 
    public static void updateInv ( List<APEX_Customer__c> objCus, Map<id, APEX_Customer__c> objmapCus)
    { 
        list<APEX_Invoice__c> invlist = new list<APEX_Invoice__c>();
        for(APEX_Customer__c nc: objCus)
        { 
            if(nc.APEX_Customer_Status__c=='active' && objmapCus.get(nc.id).APEX_Customer_Status__c=='inactive')
            { 
                APEX_Invoice__c objinv= new APEX_Invoice__c();
                objInv.APEX_Status__c='Pending';
                objInv.APEX_Customer__c=nc.id;
                objInv.APEX_Description__c='record created thru trigger';
                invlist.add(objinv);
                
            }
        }
        
        insert invlist;
        
    }
}