({
    showDetails : function(component, event, helper) {
        
        var eventSource = event.getSource();
        var id = eventSource.get('v.name');
        console.log(id);
        
        $A.createComponent ('c:BeerDetails',
                            {
                                beerId : id
                            },
                            function (beerDetails, status, errorMessage){
                                
                                if (status === 'SUCCESS')
                                {
                                    component.find('overlayLib').showCustomModal({
                                        
                                        header: "Beer Details",
                                        body: beerDetails,
                                        footer: 'This is the modal footer',
                                        showCloseButton: true,
                                        cssClass: "mymodal",
                                        closeCallback: function() {
                                            
                                        }          
                                    });
                                }
                                
                            });
        
    },
    
    addToCart : function(component, event, helper) {
        
        var eventSource = event.getSource();
        var id = eventSource.get('v.name');
        var index = eventSource.get('v.value');
        var selectedBeer = component.get('v.beerLists')[index];
        console.log ('selectedBeer', selectedBeer.Id);
        //alert ('SelectedBeer' +selectedBeer.Id);
        
        var addToCartEvent = component.getEvent('addToCart');
        
        addToCartEvent.setParams ({
            
            beerRecord : selectedBeer
            
        });
        addToCartEvent.fire();
        
    },
})