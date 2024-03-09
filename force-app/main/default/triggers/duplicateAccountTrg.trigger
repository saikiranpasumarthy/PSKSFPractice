trigger duplicateAccountTrg on Account (before insert)
{
    if(trigger.isbefore)
    {
        duplicateAccount.oldacc(trigger.new, trigger.old);
        
    }
}