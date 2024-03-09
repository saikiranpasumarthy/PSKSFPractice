public class mapclass 
{
	public void mapcontain()
    {
        map<id,list<opportunity>> newmap = new map<id,list<opportunity>>();
        list<opportunity> op = [select id, ownerid from opportunity];
        for(opportunity ops: op)
        {
            if(newmap.containsKey(ops.id))
            {
                system.debug('the is is : ');
            }
        }
        
    }
}