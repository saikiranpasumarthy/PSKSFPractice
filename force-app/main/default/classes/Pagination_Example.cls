public class Pagination_Example 
{
    public Apexpages.StandardSetController controller {set;get;}
    public Integer total {set;get;}
    Public integer totalpages {set;get;}
    public List<Opportunity> getopp()
    {
        List<Opportunity> opp =(List<Opportunity>)controller.getRecords();
        return opp;
    }
    
    public Pagination_Example()
    {
        List<Opportunity> ops = [Select id, name, amount, stagename, closedate from Opportunity];
        controller = new Apexpages.StandardSetController(ops);
        total = controller.getResultSize();
        controller.setPageSize(5);
        Integer val = Math.mod(total, 5);
        if(val>0){
            totalpages = (total/5)+1;
        }
        else{
            totalpages=total/5;
        }
        
    }
}