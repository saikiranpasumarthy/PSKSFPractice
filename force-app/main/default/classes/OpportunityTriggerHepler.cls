public class OpportunityTriggerHepler {
   
    public static void updateOpportunityPriority(List<Opportunity> oppRecords){

        List<Opportunity_Priority__mdt> oppsMdt = [Select MasterLabel, From_Amount__c, To_Amount__c from Opportunity_Priority__mdt];

        for(Opportunity opp : oppRecords){

            for (Opportunity_Priority__mdt oppLabel : oppsMdt) {
                    if (opp.Amount <= oppLabel.To_Amount__c && opp.Amount >= oppLabel.From_Amount__c) {
                        opp.Priority__c = oppLabel.MasterLabel;
                        break;
                    }
            }
        }
    }
}