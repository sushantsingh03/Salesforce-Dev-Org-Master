({
	doInit : function(component, event, helper) {
        
        alert('doInit method has initated')
        component.set('v.testValue','Now testValue has this value')
		
	},
    
    clickButton : function(component, event, helper) {
        
        var applicationEvent = $A.get('e.c:TestApplicationEvent');
        applicationEvent.fire();
        
		
	},
    
    handleApplicationEvent : function(component, event, helper) {
        
        alert ('Application Events handled')
        
    }
})