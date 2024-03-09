public class list_example2 
{
    public list<selectoption> options {set;get;}
    public list<string> selected {set;get;}
    public String result			  {set;get;}
    public list_example2()
    {
        options=new List<SelectOption>();
        selected=new List<String>();
        SelectOption op1=new SelectOption('none','-None-');
        SelectOption op2=new SelectOption('Hyd','Hyd');
        SelectOption op3=new SelectOption('Ban','Ban');
        SelectOption op4=new SelectOption('Che','Che');
        options.add(op1);
        options.add(op2);
        options.add(op3);
        options.add(op4);
    }
    public void call()
    {
        result='You have Selected :'   +selected;
    }
}