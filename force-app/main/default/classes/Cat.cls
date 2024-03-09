public class Cat 
{
	private String name;
    private Integer size;
    
    public Cat (String n, Integer s)
    {
        name=n;
        size=s;
    }
    
    public void display1()
    {
        System.debug('Name of my cat: ' +name);
        System.debug('Size of my cat: ' +size);
    }
     public void setName(String n)
    {
        name=n;
    }
    
    public void setSize(Integer s)
    {
        if(s<=0)
        {
            System.debug('You cant set a wrong value for my cat ');
            size=10;
        }
        else
        {
            size=s;
        }
    }
    public void display()
    {
        System.debug('Name of my cat: ' +name);
        System.debug('Size of my cat: ' +size);
    }
}