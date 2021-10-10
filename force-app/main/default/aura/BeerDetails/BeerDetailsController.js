({
	doOrder : function(component, event, helper) {
        
        var pageReference = component.find("navigation");
        var id = component.get('v.beerId') ;
        console.log(id);
        
        
        var pageReferenceNav = {    
            "type": "standard__component",
            "attributes": {
                "componentName": "c__CreateBeerOrder"    
            },    
            "state": {
                
                 //"c__myAttr": "attrValue" 
                "c__beerId": id    
            }
            
            
        };
        
        pageReference.navigate(pageReferenceNav);
		
	}
})