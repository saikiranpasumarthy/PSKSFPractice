public class Lead_helperclas 
{
	public static void afterinsertm(Map<id, lead> oldleads, Map<id, lead> newleads )
    {
        list<lead> leadsl = new List<lead>();
        set<id> keys = oldleads.keySet();
        set<id> ownerids;
        for(id recid: keys)
        {
            lead oldlead = oldleads.get(recid);
            lead newlead = newleads.get(recid);
            if(oldlead.Domain__c==newlead.Domain__c)
            {
               
               newlead.OwnerId=oldlead.OwnerId;
                leadsl.add(newlead);
               
            }
            
        }
         update leadsl;
        
    }
}