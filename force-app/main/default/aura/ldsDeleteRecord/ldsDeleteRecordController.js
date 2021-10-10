({
    doDelete : function(component, event, helper) {
        
        //console.log('Inside do delete method')
        
        component.find('recordRemover').deleteRecord($A.getCallback(function(deleteResult){
            
            console.log('Inside deleteRecord function')
            if (deleteResult.state === 'SUCCESS' || deleteResult.state === 'DRAFT')
            {
                var resultToast = $A.get("e.force:showToast");
                resultToast.setParams({
                    "title": "Record Deleted",
                    "type": "Success",
                    // "message": "The record was saved with record id " +deleteResult.id
                });
                
                resultToast.fire();
                
                //to get the nav service and set the page reference - 
                var navService = component.find("navService");
                var pageReference = {
                    type: 'standard__objectPage',
                    attributes: {
                        objectApiName: 'Beer__c',
                        actionName: 'list'
                    },
                    state: {
                        
                    }
                };
                navService.navigate(pageReference);
            }
            
            else if (deleteResult.state==='INCOMPLETE')
            {
                console.log('Inside deleteResult Incomplete'); 
            }
            
                else if (deleteResult.state==='ERROR')
                {
                    console.log('Inside deleteResult error');
                }
        }));
        
    },
})