trigger dupAccTrg2 on Account (before insert, before update)
{

 for(Account a:Trigger.new)

 {

 List<Account> acc=[Select id from Account where Name=:a.Name and Rating=:a.Rating];

 if(acc.size()>0)

 {
     a.name.addError('test error account already exists');

 }

 }

 }