({
    doInit : function(component, event, helper) {
        
        var mapMarkers = [{
            
            location: {
                Street: '1600 Pennsylvania Ave NW',
                City: 'Washington',
                State: 'DC'
            },
            
            title: 'The White House',
            description: 'Landmark, historic home & office of the United States president, with tours for visitors.'
        }];
        
        component.set ('v.mapMarkers',mapMarkers );
        component.set('v.zoomLevel', 16);
        
    }
    
    
})