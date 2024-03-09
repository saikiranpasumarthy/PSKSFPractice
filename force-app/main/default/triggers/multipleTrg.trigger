trigger multipleTrg on APEX_Customer__c (after update, after insert) 
{
        if(trigger.isafter && trigger.isupdate)
        { 
            custMulTrg.updatecusinv(trigger.new, trigger.oldmap);
        }
}