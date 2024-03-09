public class UpdateChangedFieldsController {
    SObject oldRecord, currentRecord;
    public UpdateChangedFieldsController(ApexPages.StandardController controller) {
        oldRecord = controller.getRecord().clone();
        currentRecord = controller.getRecord();
    }
    public PageReference saveChanges() {
        SObject newClone = currentRecord.getSObjectType().newSObject(currentRecord.Id);
        Map<String, Object> 
            oldValues = oldRecord.getPopulatedFieldsAsMap(),
            newValues = currentRecord.getPopulatedFieldsAsMap();
        for(String key: newValues.keySet()) {
            if(newValues.get(key) != oldValues.get(key)) {
                newClone.put(key, newValues.get(key));
            }
        }
        try {
            upsert newClone;
            return new ApexPages.StandardController(newClone).view();
        } catch(Exception e) {
            return null;
        }
    }
}