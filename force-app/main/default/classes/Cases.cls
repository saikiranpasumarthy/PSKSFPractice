public inherited sharing class Cases extends fflib_SObjectDomain implements Task_Creator_Interface{
    
    //This sets up the super class (fflib_SObjectDomain) to have the record variable 
    public Cases(List<Case> caseRecords) {
        super(caseRecords);
    }


    //This allows us to select the records that we want to run through the trigger logic
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Cases(sObjectList);
        }
    }
    
}