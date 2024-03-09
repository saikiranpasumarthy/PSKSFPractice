public class custMulTrg
{ 
    public static void updatecusinv (list<APEX_Customer__c> objcus, map<id,APEX_Customer__c> objoldmapcus)
    { 
        List<APEX_Invoice__c> objCusInv = new List<APEX_Invoice__c>();
  
            for(APEX_Customer__c nc: objcus)
            { 
            
                if(nc.APEX_Customer_Status__c=='active' && objoldmapcus.get(nc.id).APEX_Customer_Status__c=='inactive')
        { 
                 APEX_Invoice__c objinv= new APEX_Invoice__c();
                 objInv.APEX_Status__c='Pending';
                 objInv.APEX_Customer__c=nc.id;
                 objInv.APEX_Description__c='record created thru trigger';
                objCusInv.add(objInv);
                    
            }
        }
        insert objCusInv;
    } 
}