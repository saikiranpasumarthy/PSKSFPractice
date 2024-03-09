public class Mass_UpdateOpp 
{
    public List<Opportunity> opp {set;get;}
    public Mass_UpdateOpp(Apexpages.StandardSetController controller)
    {
        List<String> fields = new List<string>{'Name','StageName','CloseDate'};
        controller.addFields(fields);
        opp = (List<Opportunity>)controller.getSelected();
    }
    
    public pagereference invoke()
        {
            for(Opportunity o:opp){
                o.StageName='Prospecting';
            }
            update opp;
            Pagereference p = new Pagereference('/006');
            return p;
        }
}