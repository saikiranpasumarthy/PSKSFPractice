trigger CustomerTrigger on APEX_Customer__c (after update) 
{
    List<APEX_Invoice__c> objCusInv = new List<APEX_Invoice__c>();
    for(APEX_Customer__c cc: trigger.new)
    { 
        if(cc.APEX_Customer_Status__c=='Active' && trigger.oldMap.get(cc.id).APEX_Customer_Status__c!='Active')
        { 
            APEX_Invoice__c objInv = new APEX_Invoice__c();
            objInv.APEX_Status__c='Pending';
            objInv.APEX_Customer__c=cc.id;
            objInv.APEX_Description__c='record created thru trigger';
            objCusInv.add(objInv);
        }
    }
    insert objCusInv;
}