({
    doInit: function(component, event, helper){
      //  console.log(component.get("v.record").Name);
    },
	recordUpdate: function(component, event, helper) {
        alert(component.get("v.record").Name);
    }
 
})