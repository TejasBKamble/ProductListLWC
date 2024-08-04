public with sharing class imagesClass {
   public static List<Product2> imagesList(){     
    return[SELECT Id, Name, Description, Price__c,
    (SELECT Id, ResourceURL__c FROM Product_Images__r)FROM Product2];
   }
}