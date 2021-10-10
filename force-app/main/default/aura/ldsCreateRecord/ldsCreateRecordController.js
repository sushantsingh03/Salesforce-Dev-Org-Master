({
    doInit : function(component, event, helper) {
        
        component.find('recordCreator').getNewRecord (
            
            'Beer__c', //sObjectType
            null, //recordTypeId
            false, //skipCache?        
            $A.getCallback (function ()
                            {
                                var record = component.get('v.targetRecord');
                                var error = component.get('v.targetRecordError');
                                
                                if (error || (record==null))
                                {
                                    console.log ('Error while creating the template - ',error);
                                }
                                else
                                {
                                    console.log('Template Successfully created');
                                    //alert('Template Successfully created');
                                }
                            })
        );
    },
    
    doSave : function(component, event, helper) {
        
        //console.log('Inside do Save method')
        //setting default value before saving the record
        component.set('v.targetFields.Beer_Code__c','1234567');
        component.find('recordCreator').saveRecord(function(saveResult){
            console.log('Inside saveRecord function')
            if (saveResult.state === 'SUCCESS' || saveResult.state === 'DRAFT')
            {
                var resultToast = $A.get("e.force:showToast");
                resultToast.setParams({
                    "title": "Record Saved",
                    "type": "Success",
                    "message": "The record was saved with record id " +saveResult.id
                });
                
                resultToast.fire();
            }
            
            else if (saveResult.state==='INCOMPLETE')
            {
                console.log('Inside saveResult Incomplete') 
            }
            
                else if (saveResult.state==='ERROR')
                {
                    console.log('Problem saving Beer record, error: ' +JSON.stringify(saveResult.error));
                    
                }
        });
        
    },
})