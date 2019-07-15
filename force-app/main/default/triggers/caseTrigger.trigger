trigger caseTrigger on Case (after insert) {
    if(trigger.isInsert){
        case_handler c = new case_handler();
        c.redirect();
    }
}