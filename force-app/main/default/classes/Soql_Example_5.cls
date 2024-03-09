public class Soql_Example_5 
{
    public List<opportunity> opps {set;get;}
    Public string userin {set;get;}
    public Boolean rend { get; set; }
   
    public void get_records()
    {
        List<user> userinfo = [select id, name from user];
        if(string.isNotEmpty(userin))
        {
            string query;
            
            for(user u: userinfo)
            {
                if(userin==u.Name)
                {
                    user uid = [select id,name from user where name=:userin];
                    query = 'select id, StageName, Account.name , Owner.name, owner.username from Opportunity where Ownerid in (select id from user where id= \''+uid.id+'\')';
                    opps= database.query(query);
                }
                else
                {
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'enter valid name'));
                }
            } 
           
        }
        
        else
        {
            opps= [select id, StageName, Account.name , Owner.name, owner.username from Opportunity];
        }
    }
}