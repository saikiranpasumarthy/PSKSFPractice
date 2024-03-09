trigger DeleteAccount on Account (before delete)
{
        if(Trigger.isBefore)
        {     
            if(Trigger.isDelete)
            { 
                for(account acc: Trigger.old)
                { 
                    
                    if(acc.name!='okTOelete')
                    { 
                        acc.addError('You cannot delete this record');
                    }
                }
            }
        }
}