({
    handleCartClick : function(component, event, helper) {
        

        var action = component.get('c.getCartId');
        action.setParams({
            
            'beerList' : component.get('v.beerNameList')
            
        });
        
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            alert(state);
            if (state === 'SUCCESS' || state=== 'DRAFT')
            {
                var pageReference = component.find("navigation");
                var pageReferenceNav = {    
                    "type": "standard__component",
                    "attributes": {
                        "componentName": "c__CartDetail"    
                    },    
                    "state": {
                        
                        //"c__myAttr": "attrValue"   
                        "c__cartId" : response.getReturnValue()
                    }
                    
                    
                };
                
                pageReference.navigate(pageReferenceNav);
            }
            
            else if (state === "INCOMPLETE") {
                // do something
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        })
        
        $A.enqueueAction(action);
        
    },
    
    createCartItems : function(component, event, helper) {
        
        var names = [];
        for (var i=0; i<component.get('v.beerList').length; i++)
        {
            names.push(component.get('v.beerList')[i].Id);
        }
        console.log('Names', names);
        component.set ('v.beerNameList', names);
        console.log (component.get('v.beerNameList'));
    },
})