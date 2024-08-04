public with sharing class ProductClassCLR {
  @AuraEnabled(cacheable=true)
  public static List<ProductDemo__c> ProductList(){
  
    return[SELECT Id,Name,Brand_Name__c ,Price__c,image__c,Type__c FROM ProductDemo__c LIMIT 20];
  }

  @AuraEnabled(cacheable=true)
    public static List<AggregateResult> ProductTypes() {
        return [SELECT Type__c, COUNT(Id) cnt FROM ProductDemo__c GROUP BY Type__c];
    }
}