trigger ContactBeforeInsertUpdate on Contact (before Insert, before update) {
for (Contact c:Trigger.new)
{
    if(trigger.isinsert)
        {
         c.description='contact created succesfully by insert trigger';   
         }
        else if (trigger.isupdate)    
        {    
         c.description='contact updated succesfully by else update block';   
         }
         
        
}
}