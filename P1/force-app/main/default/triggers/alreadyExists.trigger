trigger alreadyExists on Contact (before insert) {

    TriggerHelperClass.Helper(trigger.new);
}