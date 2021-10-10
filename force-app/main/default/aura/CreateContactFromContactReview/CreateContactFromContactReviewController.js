({
	doHandle : function(component, event, helper) {
        
        //alert('Event Handled');
        var conRecord = event.getParam('conRecord');
        console.log ('Con Record', conRecord);
        
        var contactList = component.get('v.contactList');
        if (contactList)
        {
            contactList.push(conRecord);
            component.set('v.contactList', contactList);
        }
        
        else
        {
            contactList=[];
            contactList.push(conRecord);
            component.set('v.contactList', contactList);
            //alert ('Test');
        }
		
	},
    
    doSave : function(component, event, helper) 
    {
      console.log ('inside do save')
      var action = component.get('c.saveContacts'); 
        //console.log ('after setting action', action)
        action.setParams({
            contactList : component.get('v.contactList')
        });
        action.setCallback(this, function(response){
            console.log ('inside the action.setcallback method')
            var state = response.getState();
            alert(state);
            if(state==="SUCCESS" || state==="DRAFT"){
                $A.get('e.force:refreshView').fire();
            }
            
            else if (state === "INCOMPLETE")
            {
                
            }
            
            else if (state === "ERROR")
            {
                var errors = response.getError();
                console.log ('errors', errors);
            }
        }, 'ALL');
        
        $A.enqueueAction(action);
    },
    
    handleSelectEvent : function(component, event, helper) {
        
        alert('Event Handled');
        var selectRecord = event.getParam('Contact');
        console.log ('Selected Record', selectRecord.FirstName);
        
        var createContact = component.find ('selectRecord');
        
        createContact.selectRecord(selectRecord);
		
	}, 
})