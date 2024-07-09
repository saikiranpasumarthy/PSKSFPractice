trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update, after undelete, after delete, before delete) {

    if(trigger.operationType == TriggerOperation.BEFORE_INSERT || trigger.operationType == TriggerOperation.BEFORE_UPDATE)
    {
        OpportunityTriggerHepler.updateOpportunityPriority(trigger.new);
    }

    if(trigger.isAfter && (trigger.isInsert || trigger.isUndelete)){
        Opp_Getmax_Amount.getOppMaxAmount(trigger.new, null);
    }
    else if (trigger.isAfter && trigger.isUpdate) {
        Opp_Getmax_Amount.getOppMaxAmount(trigger.new, trigger.oldMap);
    }
    else if (trigger.isAfter && trigger.isDelete) {
        Opp_Getmax_Amount.getOppMaxAmount(trigger.old, null);
    }
}