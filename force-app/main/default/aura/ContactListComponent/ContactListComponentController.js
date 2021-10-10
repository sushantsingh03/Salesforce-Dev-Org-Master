({
	doInit : function(component, event, helper) {
        
        /* Step 1*/
        var action = component.get('c.getContactList');
        
        action.setParams({
            			accountId : component.get('v.recordId')
                        });
        
        /* Step 3*/
        action.setCallback(this, function(response){
            
            var responseValue = response.getReturnValue();
            console.log(responseValue);
            component.set('v.contactList',responseValue);
            
        });
        
        /* Step 2*/
        $A.enqueueAction(action, false);
		
	},
    
    showContactRecord : function(component, event, helper) {
        
        var eventSource = event.getSource();
        var id = eventSource.get('v.name');
        //alert(id);
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
          "recordId": id,
          "slideDevName": "detail"
        });
        navEvt.fire();
    },
    
    handleCompEvent : function(component, event, helper)
    {
        
        var contactRecord = event.getParam('ContactRecord');
        var currentList =  component.get('v.contactList');
       	console.log(contactRecord);
        currentList.push(contactRecord);
        component.set('v.contactList',currentList);
    },
})