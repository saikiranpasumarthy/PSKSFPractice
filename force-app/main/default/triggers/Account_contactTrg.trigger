trigger Account_contactTrg on Account (after insert) 
{
    Account_contactclass.afterinsetm(trigger.new);
}