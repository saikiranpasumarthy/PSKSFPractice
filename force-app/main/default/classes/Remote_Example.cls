global class Remote_Example 
{
	@RemoteAction
    global static string callme(String Lastname, String Firstname)
    {
        String result = 'Last name : '+Lastname+' Firstname : '+Firstname;
        return result;
    }
}