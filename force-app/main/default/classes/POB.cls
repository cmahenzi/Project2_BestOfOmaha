/////////////////////////////////////////////////////////////////
    //
    // Name: Project 0 Bravo
    // Author: Clara Mahenzi (clara.mahenzi@revature.com)
    // Date: 2/17/2021
    // Description: Series of apex methods to demonstrate
    // basic understanding of coding concepts.
    //
    /////////////////////////////////////////////////////////////////

public with sharing class POB {
    
        /*
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */
        public static Integer nFibonacci( Integer n ){
            Integer number1 = 0;
            Integer number2 = 1;
            Integer number3 = 0;
            // returning first number 
            if (n==0){
                return number1;
            }
            for (Integer i=2; i <= n; i++){
                number3=number1+number2;
                number1=number2;
                number2=number3;
            }
            return number2; 
        }
        /*
     * 2. Sort a list of integers.
     * Test Cases:
     * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
     * Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
     *
     * Don't use the sort() method... that would be lame.
    */
    public static List<Integer> sortList( List<Integer> intList ) {
        Integer tempNum;
        for (Integer i = 0; i< intList.size()-1; i++){ //first element in the list
            for (Integer l= i+1; l<intList.size(); l++){ //second element 
                if(intList[i] > intList[l]){ // comparing first and second 
                    tempNum = intList[i]; // storing element in index i in a temporary variable
                    intList[i] = intList[l]; // swap the elements here 
                    intList[l] = tempNum;
                }                 
            }
        }        
        return intList;        
    }
    /*
     * 3. Return the factorial of n.
     * Test Cases:
     * Input: 0    Output: 1
     * Input: 1    Output: 1
     * Input: 3    Output: 6
    */
    public static Integer nFactorial( Integer n) {
        Integer result = 1;
        for (Integer i=2; i<=n; i++){
            result *=i;
        }
        return result;
    }

    /*
     * 4. Rotate left
     * Given a list, list, and an integer, n, rotate the values in list left n times and return list
     * Test Cases:
     * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
    */
    public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n){
        Integer temp; // this will store the first element of the list before starting the rotation 
        for (Integer i=0; i<n; i++){
            temp = nList[0]; // takes out the first element, so in index 0
            for (Integer j=0; j< nlist.size()-1; j++){
                nList[j] = nList[j+1];// shifts the list left by 1 place 
            }
            nList[nList.size()-1] = temp; // this puts that first element at the end of the list
        }
        return nList;
    }

    /*
     * 5. Balanced Brackets
     * A bracket is any one of the following: (, ), {, }, [, or ]
     * 
     * The following are balanced brackets:
     *    ( )
     *    ( ) ( )
     *    ( ( ) )
     *    ( { [ ] } )
     *
     * The following are NOT balanced brackets:
     *   (
     *   )
     *   ( ( )
     *   ( [ ) ]
     *
     * Return true if balanced
     * Return false if not balanced
    */
    public static Boolean bracketsAreBalanced(String s){
        String[] d = new String [0]; //list does not have anything in the beginning 
        for (Integer i = 0; i<s.length(); i++){ // we are looping through the string of character checking if it matches or not 
            String p = s.substring(i, i+1); // looking at the first character 
            if (p =='('|| p =='['|| p =='{'){ // if it's open, it save the character  
                d.add(p); // adds the open character to the list 
            }
            // if it's closed, it should match the most recent open bracket 
            else if(p ==')'|| p ==']'|| p =='}'){ 
                if (p == ')'){
                    p = '(';
                }
                if (p == ']'){
                    p = '[';
                }
                if (p == '}'){
                    p = '{';
                }
                if (p == ')'){
                    p = '(';
                }
                if (p == ')'){
                    p = '(';
                }
                // if the list is empty meaning never have a ])} after the [({ then it is rigth away false 
                if (d.isEmpty()){
                    return false;
                }
                // if the characters match, they are both removed from list. if not it returns false 
                if (p != d.remove(d.size() - 1)){ // if p != to the last character in the list, return false. 
                    return false;
                }
            }
        }
        if (d.isEmpty()){// at the end of the loop if the list is empty, it means everything matched, so true
            return true;
        }
        else {
            return false; // if there's still a character, then it did not match so return false. 
        }
    }

    /* You should NOT be submitting answers that you find online. You will be expected to be able to defend any of these solutions without notice. */

    /*
     * 6. Create a method that retrieves a list of all accounts and updates those accounts.
     *      Create a custom field on the Account standard object called Size__c that will be a 
     * picklist containing small/medium/large.
     *     Create a method that retrieves a list of all accounts. 
     *         - If an account has between 1-1000 employees then it is classified as small.
     *         - If an account has between 1001-10000 employees it is classified as medium.
    *         - If an account has more than 10000 employees it is classified as large.
     *     Update the Size__c field on each account to reflect the amount of employees in the Account.
    */
    public static void updateAccountSize(){
        // Retrieve all account including the numberOfEmployees field
      Account[] allAccounts = [SELECT Id, numberOfEmployees FROM Account];
      for (Account AccRecord: allAccounts){
        if (AccRecord.numberOfEmployees >= 1 && AccRecord.numberOFEmployees <=1000){
            AccRecord.Size__c = 'Small';    
        }
        if (AccRecord.numberOfEmployees >= 1001 && AccRecord.NumberOfEmployees <=10000){
            AccRecord.Size__c = 'Medium'; 
        }
        if (AccRecord.NumberOfEmployees >10000){
            //large
            AccRecord.Size__c = 'Large'; 
        }
      }
      // save and update the change made
      update allAccounts;
    }
    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
    public static void updateCALeads() {       
        List<lead> leadToChange = [SELECT id, state, Status FROM lead WHERE state = 'California'];
        for (lead lrecord: leadToChange){
            if (lrecord.State == 'California'){
                lrecord.Status = 'Closed - Not Converted'; // change Status
                lrecord.Description = 'We are no longer doing business in California.'; // change description
            }
        }  
        // save and update the change made        
        update leadToChange;
    }
    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
    public static void closePastDueOpportunities( ){
        List<Opportunity> P = Database.query('SELECT id FROM Opportunity WHERE StageName != \'Closed_Won\' AND CloseDate < TODAY');
        for(Opportunity Opp : P){
            opp.StageName = 'Closed_Lost'; //update the stage 
        }
        update P;
    }   
}