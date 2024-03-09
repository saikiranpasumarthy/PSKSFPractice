public class List_Set_Example3 
{
    public List<SelectOption> notselected {set;get;}
    public List<SelectOption> selected {set;get;}
    public set<string> not_selected_fields {set;get;}
    public set<string> selected_fields {set;get;}
    public List<string> addlist {set;get;}
    public List<string> removelist {set;get;}
    
public List_Set_Example3()
{
    notselected = new List<SelectOption>();
    selected = new List<SelectOption>();
    not_selected_fields = new set<string>{'name','street','area','dob'};
    selected_fields = new set<string>();
    addlist = new List<string>();
    removelist = new List<string>();
    createOptions();
    
}
    public void createOptions()
    {
        
    }
}