({
	doInit : function(component, event, helper) {
        let action = component.get("c.retrievingInfo")
        action.setCallback(this, function(response){
                component.set("v.restaurantInfo", response.getReturnValue())
        });
        
        $A.enqueueAction(action)
        
    }
})