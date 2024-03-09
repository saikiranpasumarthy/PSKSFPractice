public class customerhelpertrg
{ 
    public static void getcust(list<APEX_Customer__c> objlcus, map<id,APEX_Customer__c> objmcus,
    map<id,APEX_Customer__c> newmapcus )
    { 
        custinvrec(objlcus, objmcus);
        updtdesc(objlcus, newmapcus );
        
    }
    
    
    public static void custinvrec(list<APEX_Customer__c> objlcus, map<id,APEX_Customer__c> objmcus)
    { 
        List<APEX_Invoice__c> objCusInv = new List<APEX_Invoice__c>();
        for(APEX_Customer__c nc: objlcus)
        { 
            if(nc.APEX_Customer_Status__c=='active' && objmcus.get(nc.id).APEX_Customer_Status__c=='inactive')
            { 
                 APEX_Invoice__c objInv = new APEX_Invoice__c();
                objInv.APEX_Status__c='Pending';
                objInv.APEX_Customer__c=nc.id;
                objInv.APEX_Description__c='record created thru trigger';
                objCusInv.add(objInv);
            }
        }
        insert objCusInv;
    }
    
    public static void updtdesc(list<APEX_Customer__c> objlcus, map<id,APEX_Customer__c> newmapcus)
    { 
        list<apex_customer__C> cuslstinv= [select id, name, (select id, name, apex_description__C from invoices__r) from apex_customer__c where
         id in :newmapcus.keyset()];
         
         list<APEX_Invoice__c> newupdtinv= new list<APEX_Invoice__c>();
         list<APEX_Invoice__c> updtinv=cuslstinv[0].invoices__r;
         
         for(APEX_Invoice__c obinv: updtinv)
         { 
             obinv.APEX_Description__c='your new invoice';
             newupdtinv.add(obinv);
         }
         update newupdtinv;
          
    }
}