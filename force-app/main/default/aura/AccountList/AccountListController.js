({
    doInit : function(component, event, helper) {
        
        var action = component.get('c.showAccounts');
        action.setParams ({
            
        });
        
        action.setCallback (this, function(response)
                            {
                                var responseValue = response.getReturnValue();
                                console.log(responseValue);
                                component.set('v.AccountList',responseValue);
                            });
        
        $A.enqueueAction(action);
        
    },
    
    showRelatedContacts : function(component, event, helper)
    {
        console.log('inside  the showRelatedRecords function')
        var pageReference = component.find("navigation");
        console.log('Page reference found')
        var eventSource = event.getSource();
        var id = eventSource.get('v.name');
        console.log('Id of the account is : ' ,id);
        
        
        var pageReferenceNav = {    
            "type": "standard__component",
            "attributes": {
                "componentName": "c__ContactsLists"    
            },    
            "state": {
                
                //"c__myAttr": "attrValue" 
                "c__accountId": id    
            }
            
            
        };
        
        pageReference.navigate(pageReferenceNav);
    },
    
    doSearch : function(component, event, helper) {
        
        var searchParam = component.find('accountSearchInput').get('v.value');
        //console.log('Value of search param is ',searchParam);
        
        var action = component.get('c.searchAccount');
        action.setParams ({
            
            "accountName" : searchParam
            
        });
        
        action.setCallback (this, function(response)
                            {
                                var responseValue = response.getReturnValue();
                                console.log(responseValue);
                                component.set('v.AccountList',responseValue);
                            });
        
        $A.enqueueAction(action);
        
    },
    
    reInit : function(component, event, helper) {
        
        $A.get('e.force:refreshView').fire();
    }
    
})