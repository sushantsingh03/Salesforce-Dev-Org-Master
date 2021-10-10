({
    
    handleAddition : function(component, event, helper) {
        
        var num1 = component.get('v.numberOne');
        var num2 = component.get('v.numberTwo');
       	component.set('v.output', parseInt(num1) + parseInt(num2));		
	},
    
    handleSub : function(component, event, helper) {
        
        var num1 = component.get('v.numberOne');
        var num2 = component.get('v.numberTwo');
        
        if (num1 > num2)
        {
             alert(num1 - num2);
        }
       	else
            alert (num2 - num1);        
	}
    
})