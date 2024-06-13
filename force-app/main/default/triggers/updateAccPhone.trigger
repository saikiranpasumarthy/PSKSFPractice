trigger updateAccPhone on Account (after update) {
    
    Map<Id,Account> changedAccount = new Map<Id,Account>();
    if(!trigger.new.isEmpty()){        
        for(Account acc: trigger.new){
            if(acc.Phone != trigger.oldMap.get(acc.Id).Phone){
                changedAccount.put(acc.id, acc);
            }
        }
    }

    List<Contact> conList = [Select id,phone,AccountId from Contact where AccountId in: changedAccount.keySet()];
    List<Contact> consToUpdate = new List<Contact>();
    if(!conList.isEmpty()){
        for (Contact con : conList) {
            con.Phone = changedAccount.get(con.AccountId).Phone;
            consToUpdate.add(con);
        }
    }
    if(!consToUpdate.isEmpty()){
        update consToUpdate;
    }


}