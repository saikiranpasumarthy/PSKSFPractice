global with sharing class HotelRemoter 
{
	@RemoteAction 
    global static List<Hotel__c> findAll()
    {
        return [select id, name, location__latitude__s, location__longitude__s from Hotel__c ];
        
    }
    
    
}