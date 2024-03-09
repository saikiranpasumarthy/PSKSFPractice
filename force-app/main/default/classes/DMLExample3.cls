public class DMLExample3 
{
    public list<contactwrapper> contacts {set; get;}
    public DMLExample3()
    {
        contacts = new list<contactwrapper>();
        for(integer i=0; i<3; i++)
        {
            contactwrapper c = new contactwrapper();
            contacts.add(c);
        }
    }
    
    public void save()
    {
        list<contact> conlist = new list<contact>();
        
        for(contactwrapper cw: contacts)
        {
            
            contact c 	= new contact();
            c.lastname 	= cw.lastname;
            c.firstname = cw.firstname;
            c.phone	    = cw.phone;
            c.otherphone = cw.otherphone;
            conlist.add(c);
        }
               
     database.SaveResult[] result = database.insert(conlist, false);
        
        for(database.SaveResult r: result)
        {
            if(r.isSuccess()==true)
            {
                apexpages.Message msg = new apexpages.Message(apexpages.Severity.INFO, 'record ' +r.getId());
                apexpages.addMessage(msg);
                    
            }
            else
            {
                for(database.Error er: r.getErrors() )
                {
                    apexpages.Message errmsg = new apexpages.Message(apexpages.Severity.ERROR,'error ' + er.getFields() + ' - ' + er.getMessage() );
                    apexpages.addMessage(errmsg);
                }
            }
        }
    }
    
}