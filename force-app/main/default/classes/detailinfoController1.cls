public class detailinfoController1 {

    public LIST<hierarchy__c> Lsthier1 { get; set;}
    public static A_R_info__c objarinfo{get;set;}
    Public List<A_R_info__c> lstarinfo{get;set;}

        public detailinfoController1(){
 String strID = Apexpages.currentPage().getParameters().get('detailID');
        System.debug('**** strBTNValue ' + strID);
                      if(lsthier1.size()>0)

   // List<Hierarchy__c> lsthir = new List<hierarchy__c>();
     lsthier1 =[SELECT Account_id__c,billing_id__c,BTN_Phone__c,Circuit_Id__c,City__c,CLLI__c,Company_ID__c,Company_name__c,CreatedById,CreatedDate,GAN__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Level__c,Location_Id__c,Name,Name__c,OwnerId,Region__c,Service_Location__c,State__c,Summary_Id__c,Summary_master_phone__c,SystemModstamp,WTN_ID__c,WTN__c FROM hierarchy__c where id=:strID ];
              if(lstarinfo.size()>0){
            lstarinfo= [SELECT Account_Id__c,AdjC_LocalSvc__c,Adjustments__c,Balance__c,Billing_Number__c,Billing_Seq_No__c,Bill_Cycle__c,Bill_Date__c,count__c,CreatedById,CreatedDate,Id,IsDeleted,LastModifiedById,LastModifiedDate,Last_Pay_Date__c,Library_id__c,Name,Net_Bill__c,OwnerId,Payment__c,Phone_Number__c,Prior_Bill__c,P_P_O_C_C__c,Seq_No__c,SystemModstamp,Toll_Charges__c,Total_Taxes__c FROM A_R_info__c where Account_Id__c=:lsthier1[0].id];
}
        

}
   
      
}