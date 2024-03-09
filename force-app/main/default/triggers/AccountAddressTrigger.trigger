trigger AccountAddressTrigger on Account (before insert , before update) 
{   
    AccountAddressClass.checkfields(trigger.new);
}