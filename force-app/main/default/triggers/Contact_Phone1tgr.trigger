trigger Contact_Phone1tgr on Contact (before update) 
{
    Contact_Phone1.beforeupdatem(trigger.newmap, trigger.oldmap);
}