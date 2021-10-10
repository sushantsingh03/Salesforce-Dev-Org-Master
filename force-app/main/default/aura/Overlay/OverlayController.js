({
    createModal : function(component, event, helper) {
        
        component.find('overlayLib').showCustomModal({
            
            header: "Application Confirmation",
            body: 'This is the modalbody',
            footer: 'This is the modal footer',
            showCloseButton: true,
            cssClass: "mymodal",
            closeCallback: function() {
                alert('You closed the alert!');
            }          
        });
        
    },
    
    navigateCustom : function(component, event, helper) {
        
        var pageReference = component.find("navigation");
        
        var pageReferenceNav = {    
            "type": "standard__component",
            "attributes": {
                "componentName": "c__BeerExplorer"    
            },    
            "state": {
                "c__myAttr": "attrValue"    
            }
        };
        
        pageReference.navigate(pageReferenceNav);
        
    },
    
    createButton : function (component, event, helper)
    {
        $A.createComponent ('lightning:button',
                            {
                                label : "Press Me", 
                                value : "Press Me", 
                                onclick: component.getReference("c.handleSubmit")
                                
                            },
                            function (newButton, status, errorMessage){
                                
                                if (status === 'SUCCESS')
                                {
                                    var body = component.get('v.body');
                                    body.push(newButton);
                                    component.set('v.body', body);
                                    alert ('success');
                                }
                                
                            });
    },
    
    handleSubmit : function (component, event, helper)
    {
      alert ('Dynamic button click handled successfully');   
    }
})