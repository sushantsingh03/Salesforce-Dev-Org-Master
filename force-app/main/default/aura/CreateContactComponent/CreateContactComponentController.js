({
	handleClick : function(component, event, helper) {
        var isValid = helper.validateFields(component, event, helper); 
		console.log ('Inside the handleReview method with value of isValid = ', isValid); 
        
        if (isValid)
        {
            var compEvent = component.getEvent('CreateContacts');
            component.set('v.ContactRecord.AccountId', component.get('v.accountId'))
            compEvent.setParams({
                
                'conRecord' : component.get('v.ContactRecord')
                
            });
            
            compEvent.fire();
        }
        
        else
        {
            alert('Please fill all the required details.')
        }
		
	},
    
    selectRecord : function(component, event, helper) {
        
        console.log ('In the Create Contact Component')
        var params = event.getParam('arguments');
        
        if (params)
        {
            var selectedRecord = params.contact;
            component.set('v.ContactRecord', selectedRecord)
        }
        
    }
})