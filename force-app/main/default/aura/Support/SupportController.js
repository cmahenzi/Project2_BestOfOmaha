({
	doInit : function(component, event, helper) {
		let getOpenCases = component.get("c.getOpenCases")
        
        getOpenCases.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
                component.set("v.cases", response.getReturnValue())
            }
        })
        
        $A.enqueueAction(getOpenCases)
	}
})