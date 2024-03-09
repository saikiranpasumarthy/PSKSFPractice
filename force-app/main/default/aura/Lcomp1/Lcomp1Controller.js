({
	add : function(component, event, helper) {
		var addvalue = component.get("v.num1") + component.get("v.num2");
        component.set("v.sum",addvalue);
	},
    
     handleClick : function(component, event, helper) {
		
        component.set("v.clicked",event.getSource().get("v.label"));
    
	},

    doInit : function(component, event, helper) {
		
        var action = component.get("c.getAccounts");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state==="SUCCESS"){
                component.set("v.accountlist", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);						//$A is global aura variable
    
	}
    
   
})