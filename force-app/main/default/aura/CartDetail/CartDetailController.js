({
    
    doInit : function(component, event, helper) {
        
        var pageReference = component.get('v.pageReference');
        
        if (pageReference)
        {
            var state = pageReference.state;
            if (state.c__cartId)
            {
                //console.log('Cart Id', state.c__cartId);
                component.set('v.IdCart', state.c__cartId);
                var action = component.get('c.getCartItems');
                
                action.setParams ({
                    
                    'CartId' :   state.c__cartId                 
                });
                
                action.setCallback (this, function(response)
                                    {
                                        var state = response.getState();
                                        //alert (state);
                                        if (state === "SUCCESS" || state === "DRAFT") 
                                        {
                                            // Alert the user with the value returned 
                                            // from the server
                                            var resultData = response.getReturnValue();
                                            console.log ('resultData', resultData)
                                            
                                            var items = [];
                                            var subTotal;
                                            for (var key in resultData)
                                            {
                                                //console.log(resultData[key]);
                                                items.push(resultData[key]);
                                                if(subTotal)
                                                {
                                                    subTotal = subTotal + resultData[key].Total_Amount__c;
                                                }
                                                else
                                                {
                                                    subTotal = resultData[key].Total_Amount__c;
                                                }
                                            }
                                            
                                            component.set('v.subTotal', subTotal);
                                            /*
                                             * for (String item : resultData.keySet())
                                             * 		Cart_Items__c = resultData.get(item);
                                             * 
                                             * 
                                             */
                                            
                                            component.set('v.cartItemList',items);
                                            
                                            // You would typically fire a event here to trigger 
                                            // client-side notification that the server-side 
                                            // action is complete
                                        }
                                        else if (state === "INCOMPLETE") 
                                        {
                                            // do something
                                        }
                                            else if (state === "ERROR") 
                                            {
                                                var errors = response.getError();
                                                if (errors) {
                                                    if (errors[0] && errors[0].message) {
                                                        console.log("Error message: " + 
                                                                    errors[0].message);
                                                    }
                                                } else {
                                                    console.log("Unknown error");
                                                }
                                            }
                                    });
                
                $A.enqueueAction(action);
            }
            else
            {
                
            }
        }
        
        
        
    },
    
    returnToBeerExplorer : function(component, event, helper) {
        
        var pageReference = component.find("navigation");
        
        var pageReferenceNav = {    
            "type": "standard__component",
            "attributes": {
                "componentName": "c__BeerExplorer"    
            },    
            "state": {
                
                //"c__myAttr": "attrValue" 
                //"c__beerId": id    
                //"c__cartItemList" : component.get('v.beerList')
            }
            
        };
        
        pageReference.navigate(pageReferenceNav);
        
    },
    
    hasCoupon : function(component, event, helper) {
        
        component.set('v.couponApplied', true);
        
    }, 
    
    applyCoupon : function(component, event, helper) {
        
        //alert('Coupon applied successfully');
        var couponNo = component.find('CouponNo').get('v.value');
        //alert (couponNo);
        if (couponNo)
        {
            var action = component.get ('c.checkCoupon');
            
            action.setParams({
                
                "Name" : couponNo,
                "CartId" : component.get('v.IdCart')
            });
                
            action.setCallback(this, function (response) {
                
                var state = response.getState();
                if (state === 'SUCCESS' || state === 'DRAFT')
                {
                    var resultData = response.getReturnValue();
                    if(resultData)
                    {
                        //alert(resultData);
                        component.set('v.discountAmount',resultData);
                    }
                    else
                    {
                        //alert('Error');
                        component.set('v.errorDiscount','Coupon is not valid or Expired');
                    }
                }
                
                else if (state === 'INCOMPLETE')
                {
                    
                }
                
                else if (state === 'ERROR')
                {
                    
                }
                
            });
            
            $A.enqueueAction (action);
            
            
        }
        
        else
        {
            component.set('v.errorDiscount', 'Coupon Code cannot be Blank')
        }
    },
})