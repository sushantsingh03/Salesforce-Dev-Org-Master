({
	doRemove : function(component, event, helper) {
        
        var index = event.currentTarget.id;
        var existingRecord = component.get('v.ContactRecords');
        
        existingRecord.splice(index,1);
        component.set('v.ContactRecords',existingRecord);
        
		
	},
    
    doEdit : function(component, event, helper) {
        
        var index = event.currentTarget.id;
        var existingRecord = component.get('v.ContactRecords');
        
       var selectedRecord = existingRecord[index];
       console.log('Selected Record', selectedRecord);
        
       var selRecordEvent = component.getEvent ('SelectRecordEvent');
        
        selRecordEvent.setParams ({
            
            Contact : selectedRecord
            
        });
        
        selRecordEvent.fire();
        
        
		
	}
})