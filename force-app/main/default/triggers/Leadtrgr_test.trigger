trigger Leadtrgr_test on Lead (after insert) 
{
	Leademail_Test l = new Leademail_Test();
    l.emailchange(Trigger.new);
}