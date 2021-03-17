@isTest
private class BestRestaurantCalloutMock_Test {
    @isTest
    static void testInterfaceMock(){
        Test.setMock(HttpCalloutMock.class, new BestRestaurantCalloutMock());
        String testInfo = RestConsumption.makeCallout();
        //don't forget to finish this 
        System.assertEquals('you have to enter the value of the result of your apex parsing class', testInfo);
    }
    

}