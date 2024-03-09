@istest
public class TestVerifyDate 
{
    @istest
    public static void testmethod1()
    {
        
        date date1 = system.today();
        date date2 = system.today().adddays(10);
        date d=VerifyDate.CheckDates(date1, date2);
        integer totaldays = date.daysInMonth(date1.year(), date1.month());
        date endmnth = date.newInstance(date1.year(), date1.month(), totaldays);
        if( date2 < date1) { d=endmnth; }
        
        //check that date2 is within (>=) 30 days of date1
        Date date30Days = date1.addDays(30); //create a date 30 days away from date1
        if( date2 >= date30Days ) { d=endmnth;}
        else { d=date2;}
        
        
    }
    @istest
    public static void testmethod2()
    {
        
        date date1 = system.today();
        date date2 = system.today().adddays(40);
        date d=VerifyDate.CheckDates(date1, date2);
        integer totaldays = date.daysInMonth(date1.year(), date1.month());
        date endmnth = date.newInstance(date1.year(), date1.month(), totaldays);
        if( date2 < date1) { d=endmnth; }
        
        //check that date2 is within (>=) 30 days of date1
        Date date30Days = date1.addDays(30); //create a date 30 days away from date1
        if( date2 >= date30Days ) { d=endmnth;}
        else { d=date2;}
        
        
    }
    @istest
    public static void testmethod3()
    {
        
        date date1 = system.today();
        date date2 = system.today().adddays(-10);
        date d=VerifyDate.CheckDates(date1, date2);
        integer totaldays = date.daysInMonth(date1.year(), date1.month());
        date endmnth = date.newInstance(date1.year(), date1.month(), totaldays);
        if( date2 < date1) { d=endmnth; }
        
        //check that date2 is within (>=) 30 days of date1
        Date date30Days = date1.addDays(30); //create a date 30 days away from date1
        if( date2 >= date30Days ) { d=endmnth;}
        else { d=date2;}
        
        
    }
}