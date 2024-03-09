trigger AccountTrigger on Account (after insert) 
{
    List<Contact> objCon = new List<contact> ();
     
          for (Account objAcc:Trigger.new)
    { 
        if(objAcc.Name!=' ')
        {    
            contact nc = new contact();
            nc.lastname=objAcc.Name;
            objCon.add(nc);
            
        }
    }
          
     insert objcon;  
    
    
}