trigger CustomerTgr on APEX_Customer__c (after update) 
{

        List<APEX_Invoice__c> objCusInv = new List<APEX_Invoice__c>();
        for(APEX_Customer__c objCus: Trigger.new)
        { 
            if(objCus.APEX_Customer_Status__c=='active' && trigger.oldmap.get(objcus.id).APEX_Customer_Status__c=='inactive')
            { 
                APEX_Invoice__c objinv = new APEX_Invoice__c();
                objInv.APEX_Status__c='Pending';
                objInv.APEX_Customer__c=objCus.id;
                objInv.APEX_Description__c='record created thru new trigger';
                objCusInv.add(objInv);
            }
        }
        
        insert objCusInv;
}