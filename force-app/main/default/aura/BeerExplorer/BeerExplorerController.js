({
	handleCompEvent : function(component, event, helper) {
        
        var searchTerm = event.getParam('searchText');
        var action = component.get('c.searchBeer');
        action.setParams({
            
            beerName : searchTerm
            
        });
        
        action.setCallback (this, function(response) {
            
            var state = response.getState();
            if (state === 'SUCCESS')
            {
                var responseValue = response.getReturnValue();
                //console.log(responseValue);
                component.set('v.beerList',responseValue);
            }
            
            else if (state === 'ERROR')
            {
                console.log(response.getError());
            }
        
        });

		$A.enqueueAction(action);
	
	},
    
    updateCart : function(component, event, helper) {
        
        var params = event.getParam('beerRecord');
        var headerComp = component.find('headerComp');
        headerComp.updateCart(params);
    },
})