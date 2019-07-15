({
	submitForm : function(component, event, helper) {
        var firstName = component.find('firstName').get("v.value");
        console.log('firstName',document.getElementById("firstName").value);
		var action = component.get("c.InsertUserDetails");

        action.setParams({
            firstName: topicName
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
          }
        });
        $A.enqueueAction(action);
	}
})