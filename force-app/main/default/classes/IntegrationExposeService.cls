@RestResource(urlMapping='/DataServiceIntegration/*')
global class IntegrationExposeService {
    
   @httpget
    global static Contact getContactDetails(){
        String phoneNo=RestContext.request.params.get('Phn');
        Contact con=[select id,Name from contact where Phone=:phoneNo];
        return con;
        
    }

}