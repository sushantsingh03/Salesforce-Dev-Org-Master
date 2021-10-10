({
    doInit : function(component, event, helper) {
        
        var pageReference = component.get('v.pageReference');
        
        if (pageReference)
        {
            var state = pageReference.state;
            component.set('v.accountId', state.c__accountId);
            //component.find('recordViewer').reloadRecord();
            
        }
        
        else {
            alert ('Page Reference is null');
        }
        
        var action = component.get('c.getContactList');
        
        action.setParams ({
            
            accountId : component.get('v.accountId')
            
        });
        
        action.setCallback (this, function(response){
            
            var responseValue = response.getReturnValue();
            console.log(responseValue);
            component.set('v.contactList',responseValue);
            //component.find('recordViewer').reloadRecord();
            
        });
        
        $A.enqueueAction(action);
        
    },
    
    markAsPrimary : function(component, event, helper) {
        
        
        //var pageReference = component.get('v.pageReference');
        var contactId = event.getSource().get("v.name");
        console.log ('Contact record fetched is ' +contactId); 
        var action = component.get('c.updatePrimaryContactOnAccount');
        action.setParams ({
            
            contactId : contactId
            
        })
        
        action.setCallback (this, function(response) {
            
            var state = response.getState();
            if (state === 'SUCCESS')
            {
                //alert ('In success stage')
                var responseValue = response.getReturnValue();
                console.log(responseValue);
                
                //component.set('v.AccountList',responseValue);
                
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "message": "The Contact has been successfully set as the Primary Contact for the account.",
                    "type": "Success"
                });
                toastEvent.fire();
                
                $A.get('e.force:refreshView').fire();
            }
            
            else if (state === 'ERROR')
            {
                alert ('In error stage')
                console.log(response.getError());
            }
            
        });
        
        $A.enqueueAction(action);
    },
    
    handleClick : function(component, event, helper){
        
        var pageReference = component.find("navigation");
        
        var pageReferenceNav = {    
            "type": "standard__component",
            "attributes": {
                "componentName": "c__SalesforceAccounts"    
            },    
            "state": {
                
            }
            
            
        };
        
        pageReference.navigate(pageReferenceNav);
        
        
    },
    
    reInit : function(component, event, helper) {
        
        $A.get('e.force:refreshView').fire();
    },
    
    
})