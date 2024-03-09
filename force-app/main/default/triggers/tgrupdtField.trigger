trigger tgrupdtField on Account (before insert, before update) 
{
     //List<Account> acc = Trigger.new;
    trgToUpdtField my = new trgToUpdtField();
    my.updtvalue(Trigger.new);
}