({
    handleActive : function(component, event, helper) {
        
        var tab = event.getSource();
        var id = tab.get('v.id');
        //alert ('tabId ' +id );
        switch(id)
        {
            case 'acc' : 
                component.set('v.tabInfo','In the Account Information Section');
                alert (component.get('v.tabInfo'));
                break;
            case 'con' : 
                component.set('v.tabInfo','In the Contact Information Section');
                alert (component.get('v.tabInfo'));
                break;
            case 'opp' : 
                component.set('v.tabInfo','In the Opportunity Information Section');
                alert (component.get('v.tabInfo'));
                break;
            case 'case' : 
                component.set('v.tabInfo','In the Cases Information Section');
                alert (component.get('v.tabInfo'));
                break;
        }
        
    }
})