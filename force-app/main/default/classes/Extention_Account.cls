public class Extention_Account {
    public List<Contact> contacts   {Set;get;}
    public List<Opportunity> opty   {set;get;}
    public List<Case> cases			{Set;get;}
    Public Account 	acc				{Set;get;}
    public Extention_Account(Apexpages.StandardController controller){
        String[] fields =new String[]{'Name','Phone','Industry','rating'};
        controller.addFields(fields);
        acc=(Account)controller.getRecord();
        contacts=[select lastname,firstname,phone from Contact where accountId=:acc.Id];
        opty=[select Name,stagename,amount from Opportunity where accountId=:acc.id];
        cases=[select Subject,Priority,Origin from Case where accountId=:acc.Id];
    }
}