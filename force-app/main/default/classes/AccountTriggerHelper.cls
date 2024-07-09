public class AccountTriggerHelper {
   
    public static void updateContactAccountCountryField(List<Account> newList, Map<Id,Account> oldMap){

        Account oldAcc = new Account();
        Map<Id, Account> accIds = new Map<Id,Account>();
        List<Contact> conListUpdt = new List<Contact>();
        if (!newList.isEmpty()) {
            
            for (Account newAcc : newList) {
                if (oldMap != null) {
                    oldAcc = oldMap.get(newAcc.Id);                    
                }
                if (newAcc.Country__c != null && (oldAcc.Country__c == null || oldAcc.Country__c != newAcc.Country__c)) {
                    accIds.put(newAcc.Id, newAcc);
                }                
            }
        }
        if (!accIds.isEmpty()) {
            List<Contact> conList = [Select id, accountId, Account_Country__c from Contact where accountId In: accIds.keySet()];

            if (!conList.isEmpty()) {
                
                for (Contact con : conList) {
                    if (accIds.containsKey(con.AccountId)) {
                        con.Account_Country__c = accIds.get(con.AccountId).Country__c;
                        conListUpdt.add(con);
                    }                   
                }
            }
            if (!conListUpdt.isEmpty()) {
                update conListUpdt;
            }
        }        
    }
}