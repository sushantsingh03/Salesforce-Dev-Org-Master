({
    validateForm : function(component, event, helper) {
        
        var isValid = component.find('border').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            inputCmp.set('v.validity', {valid:false, badInput :true});
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        return isValid; 
        
    },
    
    updateBeerQuantity : function (component, event, quantity,recordId)
    {
        var totalQuantity = component.get('v.simpleRecord.Total_Quantity__c	');
        console.log('Total Available Quantity - ', totalQuantity);
        component.set('v.simpleRecord.Remaining_Quantity__c',parseInt(totalQuantity)- parseInt(quantity));
        component.find("recordEditor").saveRecord(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                
                //setting page reference on successfull creation of beer order
                var pageReference = component.find("navigation");
                var id =  recordId;
                console.log(id);
                var pageReferenceNav = {    
                    "type": "standard__component",
                    "attributes": {
                        "componentName": "c__OrderDetail"    
                    },    
                    "state": {
                        //"c__myAttr": "attrValue" 
                        "c__orderId": id    
                    }
                };
                pageReference.navigate(pageReferenceNav);
                
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                console.log('Problem saving contact, error: ' + 
                            JSON.stringify(saveResult.error));
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Error While Placing Your Order.",
                    "message": JSON.stringify(saveResult.error),
                    "type" : "success"
                });
                resultsToast.fire();               
            } else {
                console.log('Unknown problem, state: ' + saveResult.state +
                            ', error: ' + JSON.stringify(saveResult.error));
            }
        });
    },
    
})