trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) 
{

    if(TriggerHelper.runOnce(Trigger.newMap?.keySet(), Trigger.oldMap?.keySet(), Trigger.operationType)){
        return;
    }
    if (trigger.isAfter && trigger.isUpdate) {
        AccountTriggerHelper.updateContactAccountCountryField(trigger.new, trigger.oldMap);
    }
    /*List<Contact> objCon = new List<contact> ();
     
          for (Account objAcc:Trigger.new)
    { 
        if(objAcc.Name!=' ')
        {    
            contact nc = new contact();
            nc.lastname=objAcc.Name;
            objCon.add(nc);
            
        }
    }
          
     insert objcon;  */
    
    
}