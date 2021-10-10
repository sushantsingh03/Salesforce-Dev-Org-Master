({
	doSearch : function(component, event, helper) {
        
        var componentEvent = component.getEvent('searchEvent');
        var searchParam = component.find('beerSearchInput').get('v.value');
        
        componentEvent.setParams ({
            
            searchText : searchParam
            
        });
        
        componentEvent.fire();
		
	}
})