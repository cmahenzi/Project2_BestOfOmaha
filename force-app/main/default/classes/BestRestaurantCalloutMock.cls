@isTest
public class BestRestaurantCalloutMock implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        
        response.setBody('{"this":"acts like a JSON object"}');
        
        response.setStatusCode(200);
        
        return response;
    }
}