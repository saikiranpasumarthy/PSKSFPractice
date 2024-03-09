public class AccountAddressClass 
{
    public static void checkfields(list<account> newacc)
    {
        
        for(account na:newacc)
        {
            
            if(na.BillingPostalCode!=null && na.Match_Billing_Address__c==true)
            {
                
                na.ShippingPostalCode = na.BillingPostalCode;
                na.Hello__c='hi';
                
            }
        }
        
    }
}