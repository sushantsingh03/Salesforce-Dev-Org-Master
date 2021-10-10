({
    doinit : function(component, event, helper) {
        
        component.set('v.variable','Hello World Again');
        
        var action = component.get('c.showAccounts');
        
        action.setParams ({
            
            
        });
        
        action.setCallback(this, function(response)
                           {
                               var responseValue = response.getReturnValue();
                               console.log(responseValue);
                               component.set('v.Accounts',responseValue);
                           });
        
        $A.enqueueAction(action);
        
    }
})