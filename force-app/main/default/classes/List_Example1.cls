public class List_Example1 {
    public List<SelectOption> options {set;get;}
    public String selected 			  {set;get;}
    public String result			  {set;get;}
    public List_Example1(){
        options=new List<SelectOption>();
        SelectOption op1=new SelectOption('none','-None-');
        SelectOption op2=new SelectOption('Hyd','Hyd');
        SelectOption op3=new SelectOption('Ban','Ban');
        options.add(op1);
        options.add(op2);
        options.add(op3);
    }
    public void show(){
        result='You have Selected :'   +selected;
    }
}