global class LeadProcessor implements Database.Batchable<sObject> 
{
    global Database.QueryLocator start(Database.BatchableContext bc) 
    {
       //string query = 'Select id, leadsource from lead where leadsource=\'Web\'';
       string query = 'Select id, leadsource from lead';
           return database.getQueryLocator(query);
    }
   global void execute(Database.BatchableContext bc, List<lead> records)  
   {
       List<lead> lds = new List<lead>();
       for(Lead l: records)
           {               
               l.leadsource='Web';              
               lds.add(l);
           }
       update lds;
       
   }
    global void finish (Database.BatchableContext bc)
    {
        
    }    
}