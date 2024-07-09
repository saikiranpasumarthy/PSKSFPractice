public class CaseTriggerHandler {
    
    public static void updtCaseEmailfromContact(List<Case> caseNewList){

        Set<String> csEmails = new Set<String>();
        Map<String, Id> emailConsMap = new Map<String, Id>();
        List<Contact> consToCreate = new List<Contact>();
        Map<String, Contact> newConsMap = new Map<String, Contact>();
        if (!caseNewList.isEmpty()) {            
                for (Case cs : caseNewList) {  
                    if (cs.Supplied_Email__c != null) {
                    csEmails.add(cs.Supplied_Email__c); 
                   }     
                }
                            
            if (!csEmails.isEmpty()) {
                List<Contact> conList = [Select id, Email from Contact where email in: csEmails];
                if (!conList.isEmpty()) {
                    for (Contact con : conList) {
                                emailConsMap.put(con.email, con.Id);                            
                        }                    
                }
            }        
            for (Case csUpdt : caseNewList) {
                if (csUpdt.Supplied_Email__c != null) {
                        if(emailConsMap.containsKey(csUpdt.Supplied_Email__c)){
                            csUpdt.ContactId = emailConsMap.get(csUpdt.Supplied_Email__c);
                        }                    
                        else {
                            Contact c = new Contact();
                            c.LastName =  'Test' + csUpdt.Supplied_Email__c.split('@')[0];
                            c.email = csUpdt.Supplied_Email__c;
                            consToCreate.add(c);
                            newConsMap.put(csUpdt.Supplied_Email__c, c);
                        } 
                }
            }
            if (!consToCreate.isEmpty()) {
                insert consToCreate;
                for (Case cs : caseNewList) {
                    if (cs.Supplied_Email__c != null && newConsMap.containsKey(cs.Supplied_Email__c)) {
                                System.debug('con id --> '+ newConsMap.get(cs.Supplied_Email__c).id);
                                cs.ContactId = newConsMap.get(cs.Supplied_Email__c).id;     
                    }
                }
            }
        }
    }
}