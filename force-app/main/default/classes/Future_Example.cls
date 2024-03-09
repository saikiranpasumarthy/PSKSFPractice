public class Future_Example 
{
    @future
	public static void call_me()
    {
        system.debug('callme one');
        system.debug('callme Two');
        system.debug('callme Three');        
    }
    
    public static void show_me()
    {
        system.debug('showme one');
        system.debug('showme two');
        system.debug('showme three');
    }
 
    public static void invoke()
        {
            system.debug('line 1');
            system.debug('line 2');
            system.debug('line 3');
            show_me();
            system.debug('line 4');
            system.debug('line 5');
            system.debug('line 6');
            call_me();
            system.debug('line 7');
        }
}