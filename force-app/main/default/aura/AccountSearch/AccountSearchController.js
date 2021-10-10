({
	doSearch : function(component, event, helper) {
        
        var searchEvent = component.getEvent("searchEvent");
        console.log('after fetching the event');
        var searchParam = component.find('accountSearchInput').get('v.value');
        console.log('Value of search param is ',searchParam);
        
        component.setParams ({
            
            searchText : searchParam
            
        });
        
        componentEvent.fire();
		
	}
})