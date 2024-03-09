public class Soql_Example_3 
{	
    Public List<account> accs {set;get;}
    public list<selectoption> options {set; get;}
    public string selected {set;get;}
    
    Public Soql_Example_3()
    {
        options = new List<selectoption>();
        SelectOption op1=new SelectOption('none','-None-');
        SelectOption op2=new SelectOption('Energy','Energy');
        SelectOption op3=new SelectOption('Banking','Banking');
        SelectOption op4=new SelectOption('Education','Education');
        SelectOption op5=new SelectOption('Transportation','Transportation');
        options.add(op1);
        options.add(op2);
        options.add(op3);
        options.add(op4);
        options.add(op5);
    }
    
    public void get_records()        
    {
        if(selected!='none')
        {
            accs=[select id, name, phone, industry from account where industry=:selected];
        }
        else
        {
            accs=[select id, name, phone, industry from account];
        }
    }
}