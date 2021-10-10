({
    deleteCartItem : function(component, event, helper) {
        
        var cartItemId = event.currentTarget.id;
        //alert(cartItemId);
        
        var action = component.get('c.deleteItem');
        
        action.setParams ({
            
            "itemId" : cartItemId
            
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            //alert (state);
            if (state === 'SUCCESS' || state === 'DRAFT')
            {
                $A.get('e.force:refreshView').fire();
            }
            else if (state === 'INCOMPLETE')
            {
                
            }
            
            else if (state === 'ERROR')
            {
                
            }
            
        });
        $A.enqueueAction(action);
        
    }
})