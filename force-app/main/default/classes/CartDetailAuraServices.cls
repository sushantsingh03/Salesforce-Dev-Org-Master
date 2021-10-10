public class CartDetailAuraServices {
    
    @AuraEnabled
    public static String createCartItems (List<String> beerlist, String cartId)
    {
        List<Cart_Items__c> cartItemList = new List<Cart_Items__c>();
        List<Cart_Items__c> cartItemToUpdate = new List<Cart_Items__c>();
        Map<Id, Cart_Items__c> beerQntyMap = getCartItems(cartId);
        
        for (String beer : beerlist)
        {
            if (beerQntyMap != null && beerQntyMap.containsKey(beer))
            {
                Cart_Items__c existingBeer = beerQntyMap.get(beer);
                Cart_Items__c newItem = new Cart_Items__c (
                    
                    Item_Quantity__c = existingBeer.Item_Quantity__c + 1,
                    //Item_Amount__c  = existingBeer.Item_Amount__c + beer.Price__c,
                    Id = existingBeer.Id
                );
                
                cartItemToUpdate.add(newItem);
                
            }
            
            else
            {
                Integer quantity = 1;
                Cart_Items__c freshItem = new Cart_Items__c (
                    
                    Cart__c = cartId,
                    Beer__c = beer,
                    Item_Quantity__c =  quantity
                    //Item_Amount__c  = quantity * beer.Price__c
                );
                
                cartItemList.add(freshItem);
                
            }
        }
        
        insert cartItemList;
        
        if (cartItemToUpdate != null && cartItemToUpdate.size() > 0)
        {
            update cartItemToUpdate;
        }
        
        return cartId;
    }
    
    
    @AuraEnabled
    public static String getCartId (List<String> beerList)
    {
        List<Cart__c> cartList = getCart();
        if (cartList != null && cartList.size()>0)
        {
            createCartItems(beerList, cartList[0].Id);
            return cartList[0].Id;
        }
        else
        {
            Cart__c cart = new Cart__c ( 
                Coupon__c = getCoupon('Default')[0].Id,
                Cart_Id__c=String.valueOf(math.random()),
                Cart_Status__c = 'Open',
                Is_Active__c = true,
                User__c = UserInfo.getUserId()
            );
            
            insert cart;
            createCartItems(beerList, cart.Id);
            return cart.Id;
        }
        
    }
    
    private static List<Coupon__c> getCoupon (String Name)
    {
        List<Coupon__c> coupon = [Select Id, Price__c from Coupon__c where Name = : Name];
        return coupon;
    }
    
    @AuraEnabled
    public static Decimal checkCoupon (String Name, String CartId)
    {
        List<Coupon__c> couponList = getCoupon (Name);
        if (couponList.size()>0 && couponList != null)
        {
             Cart__c cart = new Cart__c( Id = CartId, Coupon__c = couponList[0].Id );
            update cart;
            return couponList[0].Price__c;
        }
        else
        {
         return null;   
        }
        
    }
    
    private static list<Cart__c> getCart()
    {
        List<Cart__c> cartList = [Select Id,Name from Cart__c where User__c =: UserInfo.getUserId() AND Is_Active__c = true ];
        return cartList;
    }
    
    @AuraEnabled
    public static Map<id, Cart_Items__c> getCartItems (String CartId)
    {
        
        List<Cart_Items__c> existingItemList = [Select id,Name,Item_Quantity__c,Beer__c,Beer__r.Name,Total_Amount__c from Cart_Items__c where Cart__c = :CartId];
        Map<Id, Cart_Items__c> beerQntyMap = new Map <Id, Cart_Items__c> ();
        
        for (Cart_Items__c item : existingItemList)
        {
            if (!beerQntyMap.containsKey(item.Beer__c))
            {
                beerQntyMap.put(item.Beer__c, item);
            }
        }
        
        return beerQntyMap;
    }
    
    @AuraEnabled
    public static void deleteItem (String itemId)
    {
        Database.delete(itemId);
    }
    
}