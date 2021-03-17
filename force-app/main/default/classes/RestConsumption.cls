public class RestConsumption {
   	public static String makeCalloutJSONParser() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://us-restaurant-menus.p.rapidapi.com/v2/restaurants/state/NE');
        request.setMethod('GET');
        request.setHeader('x-api-key', '74052639f57cbef7452999cb3d12cc79');
        request.setHeader('x-rapidapi-key', '8c20d6998fmshdaf985c65a0c5e6p1f974ajsn5fe1374fa24e');
        request.setHeader('x-rapidapi-host', 'us-restaurant-menus.p.rapidapi.com');
        HttpResponse response = http.send(request);
        
        
        if(response.getStatusCode() == 200) {
            
			JSON2Apex hold = JSON2Apex.parse(response.getBody());
            for (integer i = 0; i<10; i++){
                System.debug(hold.data[i].address.formatted);
            	System.debug(hold.data[i].cuisines);
            	System.debug(hold.data[i].restaurant_name);
            	System.debug(hold.data[i].restaurant_phone);
                System.debug(hold.data[i].restaurant_website);
            }          
        }
        return null;  
    } 

}