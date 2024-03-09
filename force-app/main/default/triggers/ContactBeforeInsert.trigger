trigger ContactBeforeInsert on Contact (before Insert) {
for (Contact contact:Trigger.new)
{
 Contact.description='contact created by kiran';
}
}