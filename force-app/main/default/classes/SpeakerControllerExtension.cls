public class SpeakerControllerExtension 
{
    public blob picture {get; set;}
    public string errorMessage {get; set;}
    
    private final Speaker__C speaker;
    private apexpages.StandardController stdController;
    
    public SpeakerControllerExtension(apexpages.StandardController stdController)
    {
        this.speaker = (Speaker__C)stdController.getRecord();
        this.stdController = stdController;
    }
    
    public PageReference Save()
    {
        errorMessage ='';
        try
        {
            upsert speaker;
            if(picture != null)
            {
                Attachment atchmnt = new Attachment();
                atchmnt.Body=picture;
                atchmnt.Name='Speaker__'+ speaker.id+'.jpg';
                atchmnt.ParentId=speaker.Id;
                atchmnt.ContentType='application/jpg';
                insert atchmnt;
                speaker.Picture_Path__c='/servlet/.servlet.filedownload?file=' +atchmnt.id;
                update speaker;
                
            }
            
            return new apexpages.StandardController(speaker).view();
            
        }
        catch(system.Exception ex)
        {
             errorMessage = ex.getMessage();
        return null;
        }
           
    }
}