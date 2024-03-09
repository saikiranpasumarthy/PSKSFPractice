public class Soql_Example_1 
{
    public List<account> accs {set;get;}
    public integer rows {set; get;}
    public string selected {set;get;}
    public list<selectoption> selectlist {set;get;}
    public string selectedlist {set;get;}
    
    public Soql_Example_1()
    {
       // accs=[select id, name, phone, industry, rating from account];
        selectlist = new List<selectoption>();
         selectoption sn = new selectoption('none','none');
        selectoption s1 = new selectoption('2','2');
        selectoption s2 = new selectoption('3','3');
        selectoption s3 = new selectoption('4','4');
        selectoption s4 = new selectoption('5','5');
        selectlist.add(sn);
        selectlist.add(s1);
        selectlist.add(s2);
        selectlist.add(s3);
        selectlist.add(s4);
        
    }
    public void set_dynamic_limit()
    {
        accs=[select id, name, phone, industry, rating from account limit: rows];
    }
    
    public void set_dynamic()
    {
        if(selectedlist!='none')
        {
            string query = 'select id, name, phone, industry, rating from account limit ' +selectedlist;
            accs=database.query(query);
        }
        else
        {
            accs= new List<account>();
        }
    }
}