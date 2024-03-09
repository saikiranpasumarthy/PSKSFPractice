trigger tgrLeadField on Lead (before insert, before update)
{	
	list<lead> leadlist = trigger.new;
    for(lead l:leadlist)
    {
         if(!l.FirstName.contains('Dr.'))
        {
            l.FirstName = 'Dr.'+l.FirstName;
        }
       
    }
}