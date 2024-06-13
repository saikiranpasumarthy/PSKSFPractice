public with sharing class CarController {
   
    public class Filters{

        @AuraEnabled
        public String searchKey {get;set;}
        @AuraEnabled
        public Decimal maxPrice{get;set;}
        @AuraEnabled
        public String[] categories {get;set;}
        @AuraEnabled
        public String[] makeType {get;set;}
    }
    @AuraEnabled(Cacheable=true)
    public static List<Car__c> getCars(Filters filters){

        String key, whereClause = '';
        Decimal maxPrice;
        String[] categories, maketype , criteria = new List<String>();
        if(filters != null){
              key = filters.searchKey;
              maxPrice = filters.maxPrice;
              categories = filters.categories;
              maketype = filters.makeType;
              if(!String.isEmpty(key)) {
                key = '%'+key+'%';
                criteria.add('NAME LIKE :key');
              }
              if (filters.maxPrice > 0) {
                criteria.add('MSRP__c <= :maxPrice');
              }
              if (filters.categories != null) {
                criteria.add('Category__c IN :categories');
              }
               if (filters.makeType != null) {
                criteria.add('Make__c IN :maketype');
              }
              if (criteria.size() > 0) {
                    whereClause = ' WHERE ' + String.join(criteria, ' AND ');
              } 
        }
        
        String queries = 'SELECT Id, Name, Category__c, Control__c, Description__c, Fuel_Type__c, Make__c, MSRP__c, seats__c,Picture_URL__c FROM Car__c' + whereClause + ' WITH SECURITY_ENFORCED Order By Name';

        return Database.query(queries);
    }

    @AuraEnabled(Cacheable=true)
    public static List<Car__c> getSimilarCars(Id carId, String[] makeType){
      List<Car__c> carsData = [Select Id, Name, Category__c, Control__c, Description__c, Fuel_Type__c, Make__c, MSRP__c, seats__c, Picture_URL__c 
      From Car__c 
      WHERE Make__c IN: makeType AND Id !=: carId];
      system.debug('carsData ---> '+ carsData);
      return carsData;
    }
}