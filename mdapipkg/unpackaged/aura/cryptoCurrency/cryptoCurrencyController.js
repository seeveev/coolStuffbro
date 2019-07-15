({
    doInit : function(component, event, helper) {
        var action = component.get("c.createcryptoCurrency");
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log("state: " + response.getReturnValue());
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.cryptoCurrency", response.getReturnValue());
                
            } else {
                console.log("Failed with state: " + state);
            }
        });
        
        $A.enqueueAction(action);
    }
})