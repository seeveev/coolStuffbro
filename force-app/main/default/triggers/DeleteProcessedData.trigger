trigger DeleteProcessedData on Billing_Detail_2__c (after insert) {
    
    List<Billing_Detail_2__c> BD2_TO_DELETE = new List<Billing_Detail_2__c>();
    String EmailBody='';
    Integer TotalCount=0;
    
        Set<String> BD2_ACCOUNTIDS = new Set<String>();
        for(Billing_Detail_2__c bd2 : Trigger.new){
            BD2_ACCOUNTIDS.add(bd2.Account_Id__c);
        }
        List<AggregateResult> BD2_AGGREGATERESULT = [SELECT Account_Id__c AccountId, MAX(S_E_To_Date__c) StatementEndDate FROM Billing_Detail_2__c WHERE Account_Id__c IN :BD2_ACCOUNTIDS GROUP BY Account_Id__c LIMIT 20000];
        //for(Billing_Detail_2__c bd2 : Trigger.new){
        for(Billing_Detail_2__c bd2 : [SELECT Account_Id__c, S_E_To_Date__c FROM Billing_Detail_2__c WHERE Account_Id__c IN :BD2_ACCOUNTIDS LIMIT 30000]){
            //Billing_Detail_2__c bd2 = (Billing_Detail_2__c)s;
            for(AggregateResult AR : BD2_AGGREGATERESULT){  
                if((string)AR.get('AccountId') == bd2.Account_Id__c){
                    if((date)AR.get('StatementEndDate') != bd2.S_E_To_Date__c){
                        System.debug('*** Matched ');
                     //   if(BD2_TO_DELETE.size()<10000)
                        BD2_TO_DELETE.add(bd2);
                        //EmailBody = EmailBody + '\n' + 'RecordValue = ' + bd2 + ' & MaxValue = ' + (date)AR.get('StatementEndDate');
                    }
                }
            }
        }
        System.debug('*** BD2_TO_DELETE.size( ' + BD2_TO_DELETE.size());
        if(BD2_TO_DELETE.size() > 0){
            //EmailBody = EmailBody + '\n' + BD2_TO_DELETE.size() + ' records for deletetion.';
            ///TotalCount = TotalCount + BD2_TO_DELETE.size();
            delete BD2_TO_DELETE;
            
            /*Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[]{'vijay.manimaran@ftr.com'});
            mail.setsubject('Z_Batch_BillingDetail2 has completed');
            mail.setPlainTextBody(EmailBody + '\n' + 'Total of ' + TotalCount + ' records for deletion.');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });*/
        }
}