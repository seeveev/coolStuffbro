trigger CalculateNPS on Account (before update) {
    for (Account updatedAccount : Trigger.new) {
        updatedAccount.AccountNumber = '123455';
    }
}