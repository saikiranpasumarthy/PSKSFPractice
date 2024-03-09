trigger Triggertest_Acc on Account (before insert) 
{
	Acc_Triggertest.rateChange(Trigger.new);
}