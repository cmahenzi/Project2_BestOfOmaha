public without sharing class TrialExpirationController {
    
    @AuraEnabled(cacheable=true)
    public static Integer getExpirationDaysLeft () {
        
        Integer daysLeft;
        
        try {
            // TODO #1:
            // Write a SOQL query to retrieve the TrialExpirationDate field from the Organization sObject.
            // TrialExpirationDate is a DateTime field. Convert this to a Date data type and use the
            // Date.today().daysBetween() method chain to determine the number of days between the current
            // date and the expiration date. You will need to subtract 1 from the total to get the correct value.
            // Store the resulting value in the daysLeft variable.
            //
            Organization org = [SELECT TrialExpirationDate FROM Organization];
            Date expirDate = org.TrialExpirationDate.date();
            daysLeft = Date.today().daysBetween(expirDate) - 1; // because we only want the days between not that first day
        }
        catch (Exception e) {
            throw new AuraHandledException('Unable to get org expiration date');   
        }

        return daysLeft;        
    }
}