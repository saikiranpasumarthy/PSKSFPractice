trigger CaseTrigger on Case (before insert) {
	
    if(trigger.isBefore && trigger.isInsert){
        CaseTriggerHandler.updtCaseEmailfromContact(trigger.new);
    }
}