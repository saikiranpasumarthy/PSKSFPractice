public class Soql_Example_2 
{
    public List<account> accs {set;get;}
    public string offsetv {set;get;}
    public string selected {set;get;}
    public List<selectoption> sellist {set;get;}
    
    public Soql_Example_2()
    {
        accs=[select id, name, phone, industry from account ];
        sellist = new list<selectoption>();
        selectoption sn = new selectoption('none','none');
        selectoption s1 = new selectoption('2','2');
        selectoption s2 = new selectoption('3','3');
        selectoption s3 = new selectoption('4','4');
        sellist.add(sn);
        sellist.add(s1);
        sellist.add(s2);
        sellist.add(s3);
    }
    
    public void set_offstatic()
    {
        accs= [select id, name, phone, industry from account limit 5  offset 2];
    }
    
    public void set_dynoffset()
    {
        
        string query;
        query= 'select id, name, phone, industry from account limit '+offsetv+'offset '+offsetv;
        accs=database.query(query);
    }
    public void set_dynsellist()
    {
        if(selected!='none')
        {
            string query;
            query= 'select id, name, phone, industry from account limit '+selected+'offset '+selected;
            accs=database.query(query);
        }
        else
        {
            accs= [select id, name, phone, industry from account limit 5  offset 2];
        }
    }
}