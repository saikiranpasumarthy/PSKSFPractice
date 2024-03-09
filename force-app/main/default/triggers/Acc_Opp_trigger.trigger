trigger Acc_Opp_trigger on Account (after insert, after update) 
{
     Acc_Opp_class.Opp_before(trigger.new);
}