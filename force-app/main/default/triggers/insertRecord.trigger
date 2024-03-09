trigger insertRecord on Account (before insert)
{
    if(trigger.isinsert)
    { 
         for(account insAcc: trigger.new)
         { 
             system.assertequals('KiranAccins', insAcc.Name);
             system.assertequals('12345678', insAcc.accountnumber);
             system.assertequals(100, insAcc.numberofemployees);
             system.assertequals(2000, insAcc.annualrevenue);
         }
         
         
         
    }
}