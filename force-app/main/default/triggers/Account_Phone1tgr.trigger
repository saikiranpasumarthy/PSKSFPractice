trigger Account_Phone1tgr on Account (before update)
{
    Account_Phone1.beforeupdatem(trigger.oldmap, trigger.newmap);
}