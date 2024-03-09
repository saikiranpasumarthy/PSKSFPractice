trigger RejectDoublebooking on Session_Speaker__c (before insert)
{
	rejectDoublebookings.rejectbookingtwice(trigger.new);
}