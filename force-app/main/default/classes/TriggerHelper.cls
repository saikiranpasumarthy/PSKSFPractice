public class TriggerHelper {

    private static final Map<String, Set<Id>> PROCESSEDRECORDS = new Map<String,Set<Id>>();
   
    public static Boolean runOnce(Set<Id> newRecordIds, Set<Id> oldRecordIds, TriggerOperation operationName){

        Set<Id> recordIds = newRecordIds;
        if(newRecordIds == null){
            recordIds = oldRecordIds;
        }
        if (recordIds == null) {
            return false;
        }
        for (Id recId : recordIds) {
            if(validateRecursion(recId, operationName.name())){
                return true;
            }   
        }
        return false;
    }

    private static Boolean validateRecursion(Id recId, String operation){

        Boolean isRecursive = false;        
        if (PROCESSEDRECORDS.containsKey(operation)) {

            Set<Id> records = PROCESSEDRECORDS.get(operation);
            if (records.contains(recId)) {
                isRecursive = true;
                return isRecursive;
            }
            records.add(recId);
        }
        else {
            Set<Id> records = new Set<Id>();
            records.add(recId);
            PROCESSEDRECORDS.put(operation, records);
        }
        return isRecursive;
    }
}