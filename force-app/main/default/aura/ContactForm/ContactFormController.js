({
	doSave : function(component, event, helper) {
        
        var action = component.get('c.createContact');
        
        //error handling
        
        /*
        var cont = component.get('v.CreateContact');
        if (cont.FirstName === null || cont.FirstName === undefined || cont.FirstName === '')
        {
            alert ('Please input the first name');
            return;
        }
        */
        
        action.setParams({
            
            con : component.get('v.CreateContact'),
            AccountId : component.get('v.accountId')
            
        });
        
        action.setCallback(this, 
                           function(response) {
                                                    var state = response.getState();
                               						alert(state);
                                                    if (state === 'SUCCESS'|| state === 'DRAFT')
                                                    {
                                                        var responseValue = response.getReturnValue();
                                                        var componentEvent = component.getEvent("quickContact");
                                                        //console.log('before component event set params');
                                                        componentEvent.setParams({
                                                            
                                                            ContactRecord : responseValue  
                                                            
                                                        });
                                                        
                                                        componentEvent.fire();
                                                    }
                                                    else if (state === 'ERROR')
                                                    {
                                                        var error = response.getError(); //array of errors
                                                        console.log(error);
                                                        console.log(error[0].pageErrors);
                                                    }
                               						else if (state === 'INCOMPLETE')
                                                    {
                                                        
                                                    }
                               
        										}, 'ALL');
        
        $A.enqueueAction(action);
        
    }
})