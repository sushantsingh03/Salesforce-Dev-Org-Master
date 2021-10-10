({
    doInit : function(component, event, helper) 
    
    {
        
        var actions = [
            {
                
                label : 'Show Details',
                name : 'show_details',
                iconname : 'action:preview'
                
            },
            {
                
                label : 'Delete',
                name : 'delete',
                iconname : 'action:delete'
                
            },
        ];
            
            component.set('v.columns', [
            {label: 'Account name', fieldName: 'Name', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text', editable : true},
            {label: 'Rating', fieldName: 'Rating', type: 'text', editable : true},
            {label: 'Phone', fieldName: 'Phone', type: 'phone'},
            {type : "action", typeAttributes : {rowActions: actions}}
        ]);
        
        
        
        var action = component.get('c.fetchAccount');
        action.setCallback(this, function(response)
                           {
                               var state = response.getState();
                               if (state === 'SUCCESS' || state === 'DRAFT')
                               {
                                   var responseValue = response.getReturnValue();
                                   component.set('v.data', responseValue);
                               }
                               
                           });
        
        $A.enqueueAction (action);
        
    },
    
    doSelectRecord : function(component, event, helper)
    {
        //alert ('An option is selected')
        var selectedRows = event.getParam('selectedRows');
        console.log ('selectedRows', selectedRows)
    },
    
    handleRowAction : function(component, event, helper)
    {
        var action = event.getParam('action');
        var row = event.getParam('row');
        console.log (action.name);
        console.log (row.Id);    
        switch (action.name)
        {
            case 'show_details' : alert (row.Id);
                break;
            case 'delete' : 
                var data = component.get ('v.data');
                var index = data.indexOf(row);
                data.splice(index,1);
                // splice takes 3 arguments 
                //  1- index  (add/remove)
                //  no of items to add/ remove
                //  optional list of items that we wanted to add
                component.set('v.data', data);
                break; 
        }
    },
    
    handleDraftValues : function(component, event, helper)
    
    {
        var draftRecords = event.getParam('draftValues');
        console.log (draftRecords);
    },
    
    
    
})