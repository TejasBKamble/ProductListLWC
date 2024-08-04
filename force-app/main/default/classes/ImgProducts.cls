public with sharing class ImgProducts {
    @AuraEnabled(cacheable=true)
    public static List<Product2> ImagesList(){
        return[SELECT Id, Name, Description, Price__c,
            (SELECT Id, ResourceURL__c FROM Product_Images__r)FROM Product2];
       }
}
