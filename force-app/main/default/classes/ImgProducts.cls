public with sharing class ImgProducts {
    @AuraEnabled(cacheable=true)
    public static List<Product2> ImagesList(){
         // Query to get all products with their related images
         List<Product2> allProducts = [
            SELECT Id, Name, Description, Price__c,
                (SELECT Id, ResourceURL__c, Image__c 
                 FROM Product_Images__r 
                 WHERE Image__c = TRUE) 
            FROM Product2
        ];
        
        // Filter to keep only products that have at least one image with Image__c = TRUE
        List<Product2> filteredProducts = new List<Product2>();
        
        for (Product2 product : allProducts) {
            if (product.Product_Images__r.size() > 0) {
                filteredProducts.add(product);
            }
        }
        
        return filteredProducts;
       }
}
