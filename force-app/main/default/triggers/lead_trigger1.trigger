trigger lead_trigger1 on Lead (after insert, after update) 
{
    Lead_helperclas.afterinsertm(trigger.oldmap, trigger.newmap);
}