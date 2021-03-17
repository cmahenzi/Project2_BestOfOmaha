({
    doInit : function(component, event, helper) {
      
      //setting the collon for my data
        component.set("v.Columns", [
            {label:"Restaurant Name", fieldName:"Name", type:"text"},
            {label:"Phone Number", fieldName:"Phone_Number__c", type:"text"},
            {label:"Address", fieldName:"Address__c", type:"text"},
            {label:"Cuisine", fieldName:"Cuisine__c", type:"text"},
            {label:"Website", fieldName:"Website__c", type:"text"},
        ]);
             
    }
})