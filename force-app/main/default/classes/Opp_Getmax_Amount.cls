public class Opp_Getmax_Amount {
    
    public static void getOppMaxAmount(List<Opportunity> newList, Map<Id, Opportunity> oldMap){

        Set<Id> accIds = new Set<Id>();
        List<Account> accUpdtList =  new List<Account>();
        Opportunity oppOldRec = new Opportunity();
        if(!newList.isEmpty()){
            for (Opportunity oppNewRec : newList) {
                if (oldMap != null) {
                    oppOldRec = oldMap.get(oppNewRec.Id);
                    if(oppOldRec.AccountId != oppNewRec.AccountId || oppOldRec.Amount != oppNewRec.Amount){
                        
                        accIds.add(oppNewRec.AccountId);
                        accIds.add(oppOldRec.AccountId);
                    }
                } else {
                    accIds.add(oppNewRec.AccountId);
                }               
                
            }
        }
        if (accIds != null) {
            List<Opportunity> allOpps = [Select Id, AccountId, Amount, Name from Opportunity where AccountId In: accIds];
            Map<Id, Opportunity> oppCheckMap = new Map<Id, Opportunity>();

            if (!allOpps.isEmpty()) {
                
                for (Opportunity opp : allOpps) {
                    if (!oppCheckMap.containsKey(opp.AccountId) || opp.Amount > oppCheckMap.get(opp.AccountId).Amount) {
                        oppCheckMap.put(opp.AccountId, opp);
                    }
                }
            }

            for (Id accountId : accIds) {
                Account acc = new Account();
                acc.Id = accountId;
                acc.Description = 'Opportunity with highest amount --> ' + oppCheckMap.get(accountId).Amount;
                accUpdtList.add(acc);
            }             
            if(!accUpdtList.isEmpty()){
                update accUpdtList;
            }
        }
    }
}