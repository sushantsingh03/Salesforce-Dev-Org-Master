({
    updateCart : function(component, event, helper) {
        
        var params = event.getParam('arguments');
        //alert('Header component controller');
        //console.log(params);
        if (params)
        {
            var beerRecord = params.beerRecord;
            var existingRecord = component.get('v.cartList');
            if (existingRecord)
            {
                existingRecord.push(beerRecord);
                component.set('v.cartList',existingRecord);
            }
            else
            {
                existingRecord = [];  
                existingRecord.push(beerRecord);
                component.set('v.cartList',existingRecord);
            }
            
        }
        
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": beerRecord.Name +" has been successfully added to the Cart.",
            "type" : "success"
        });
        toastEvent.fire();
        
        
    }
})