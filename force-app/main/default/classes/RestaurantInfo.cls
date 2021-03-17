public class RestaurantInfo {
    @AuraEnabled
    public static List<Restaurant_Info__c> retrievingInfo() {
       List<Restaurant_Info__c> restaurantInfo = [SELECT Name, Phone_Number__c, Address__c, Cuisine__c, Website__c FROM Restaurant_Info__c];
         return restaurantInfo;
    }
}