trigger custhelprtrg on APEX_Customer__c (after update, after insert) 
{
        if(trigger.isafter && trigger.isupdate)
        { 
            customerhelpertrg.getcust(trigger.new, Trigger.oldMap, trigger.newmap);
        }
}