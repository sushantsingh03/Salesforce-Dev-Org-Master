({
	doInit : function(component, event, helper) {

       console.log('event firing');
       var cmpEvt = component.getEvent("CompEvent");
       cmpEvt.fire();
		
	},
    handleCapture : function(component, event, helper) {
        
        console.log ('Capture handler from Source component');
        //alert ('Capture handler from Source component');
		
	},
    handleBubble : function(component, event, helper) {
        
        console.log ('Bubble handler from Source component');
        //alert ('Bubble handler from Source component');
		
	},
    
    
})