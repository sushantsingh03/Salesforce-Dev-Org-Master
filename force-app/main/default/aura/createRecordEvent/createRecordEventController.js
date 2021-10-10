({
    createRecord : function(component, event, helper) {
        
        var createAcountContactEvent = $A.get("e.force:createRecord");
        createAcountContactEvent.setParams({
            "entityApiName": "Contact",
            "defaultFieldValues": {
                'Phone' : '415-240-6590',
                'AccountId' : component.get('v.recordId')
            }
        });
        createAcountContactEvent.fire();
        
    },
    
    editRecord : function(component, event, helper) {
        
        var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
            "recordId": component.get("v.recordId")
        });
        editRecordEvent.fire();
        
    },
    
    
})