public class WrapperClass {  
    public String restaurantAddress;
    public Object cuisine;    
	public String restaurantName;    
    
    public List<Object> dataObject;
    public Map<String, Object> dataMap;
    public Map<String, Object> addressMap;
    
    public WrapperClass(String restaurantAddress, Object cuisine, String restaurantName){
        this.restaurantAddress = restaurantAddress;
        this.cuisine = cuisine;
        this.restaurantName = restaurantName;
        
    }
    
    
   /* public static WrapperClass parse(String json){
        return (WrapperClass) System.JSON.deserialize(json, WrapperClass.class);
    }*/   
}

/*public class addressItem {
    public String address; // formated 
}*/

/*public static String makeCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://us-restaurant-menus.p.rapidapi.com/v2/restaurants/state/NE');
        request.setMethod('GET');
        request.setHeader('x-api-key', '74052639f57cbef7452999cb3d12cc79');
        request.setHeader('x-rapidapi-key', '8c20d6998fmshdaf985c65a0c5e6p1f974ajsn5fe1374fa24e');
        request.setHeader('x-rapidapi-host', 'us-restaurant-menus.p.rapidapi.com');
        HttpResponse response = http.send(request);
        //https://api.documenu.com/v2/restaurant/4072702673999819?key=YOUR_API_KEY_GOES_HERE
		// the document is a JSON file 
        
        if(response.getStatusCode() == 200) {
            Object deserializedResponse = JSON.deserializeUntyped(response.getBody());
            //System.debug(deserializedResponse);
            Map<String, Object> respMap = (Map<String, Object>) deserializedResponse;
            List<Object> dataObject = (List<Object>) respMap.get('data');
            //System.debug(dataObject);
            Map<String, Object> dataMap = (Map<String,Object>) dataObject[0];
            Map<String, Object> addressMap = (Map<String, Object>) dataMap.get('address');
            //System.debug(addressMap);
            String restaurantAddress = String.valueOf(addressMap.get('formatted'));
            Object cuisine = dataMap.get('cuisines') ;
            String restaurantName = String.valueOf(dataMap.get('restaurant_name'));
            
            //System.debug(restaurantName);
            //Object menu = dataMap.get('menu') ;
            //System.debug(menu);
            
        }
        return null; 
    }  */