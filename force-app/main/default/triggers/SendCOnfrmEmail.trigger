trigger SendCOnfrmEmail on Session_Speaker__c (after insert) 
{
	SessionSpeakerEnrlmnt.sendemailmsg(trigger.newmap);
}