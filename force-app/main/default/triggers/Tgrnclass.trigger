trigger Tgrnclass on APEX_Customer__c (after update) 
{
        customertrighelper.updateInv(trigger.new, trigger.oldmap); 
}