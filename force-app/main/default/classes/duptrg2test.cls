@isTest
private class duptrg2test 
{
	
    static testMethod void myUnitTest() {
        try{
	        Account a = new Account(name = 'Kiran'); 
    	    insert a;
    	    System.assert(False); //this line should not be executed due to exception
        }
        catch(Exception ex){
        	System.assert(ex.getMessage().contains('test error'), TRUE);  
        } 
    }
}