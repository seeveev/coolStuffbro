public class CombineTableController {
    
    public List<Products__c> lstProducts    {get;set;}
    public List<Directory__c> lstDirectory    {get;set;}
    public boolean displayPopup {get; set;} 
    
    public CombineTableController(){
        //String strAccountID=apexpages.currentpage().getparameters().get('accID');
        
        //lstProducts = [SELECT Account_Id__c,Active_Flag_A__c,Bundle_Name__c,Charge_Code__c,Charge_Rate__c,Circuit_Id__c,Connect_Date__c,CreatedById,CreatedDate,Cust_Owned_Maint_Equipment__c,DC__c,Description__c,Disconnect_Date__c,Generic_SKU__c,Grouping_Name__c,ICB_Code_Flag__c,Id,InDATE__c,IN_Service_Order__c,IsDeleted,Item_Number__c,Item_Sequence_Number__c,I_HSI_WIFI__c,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Library_id__c,MRC_NRC_FLag__c,Name,Non_Reaccuring_Charges__c,NO_Flag_Tax_T__c,Order_Number__c,Out_Date__c,OUT_Service_Order__c,OwnerId,Package_Code__c,Package_Description__c,Package_Name__c,Phone_Number__c,Prefix_P__c,ProductGroupingSequence__c,Product_GroupId__c,Product_Group__c,Product_Rate__c,Quantity__c,Reacuuring_Charges__c,Sequence_Number__c,Sequence__c,Service_Location__c,Service_Type_ST__c,Service_Type__c,Status_S__c,SystemModstamp,S_E_Type_Flag__c,S_E__c,Vacation_Reactivation_Date__c FROM Products__c limit 1000];
        //lstDirectory = [SELECT Account_Id__c,CreatedById,CreatedDate,Description_Line__c,Description__c,Directory_Code_1__c,Directory_Code_2__c,Directory_Code_3__c,Directory_Code_4__c,Directory_Code_5__c,Directory_Listing_Code__c,Directory_Mailing_Address__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Last_Sequence_Number__c,Library_id__c,Line_number__c,Listing_Sequence__c,List_With_Phone_Number__c,Name,OwnerId,Phone_Number__c,Reference_Number__c,Sequence_Number__c,SystemModstamp FROM Directory__c limit 1000];
    }
    
        
    
    public void closePopup() {        
        displayPopup = false;    
    }     
    public void showPopup() {        
        displayPopup = true;  
        
        String strAccountID=apexpages.currentpage().getparameters().get('accID');
        
        lstProducts = [SELECT Account_Id__c,Active_Flag_A__c,Bundle_Name__c,Charge_Code__c,Charge_Rate__c,Circuit_Id__c,Connect_Date__c,CreatedById,
                    CreatedDate,Cust_Owned_Maint_Equipment__c,DC__c,Description__c,Disconnect_Date__c,Generic_SKU__c,Grouping_Name__c,ICB_Code_Flag__c,
                    Id,InDATE__c,IN_Service_Order__c,IsDeleted,Item_Number__c,Item_Sequence_Number__c,I_HSI_WIFI__c,LastModifiedById,LastModifiedDate,
                    LastReferencedDate,LastViewedDate,Library_id__c,MRC_NRC_FLag__c,Name,Non_Reaccuring_Charges__c,NO_Flag_Tax_T__c,Order_Number__c,
                    Out_Date__c,OUT_Service_Order__c,OwnerId,Package_Code__c,Package_Description__c,Package_Name__c,Phone_Number__c,Prefix_P__c,
                    ProductGroupingSequence__c,Product_GroupId__c,Product_Group__c,Product_Rate__c,Quantity__c,Reacuuring_Charges__c,
                    Sequence_Number__c,Sequence__c,Service_Location__c,Service_Type_ST__c,Service_Type__c,Status_S__c,SystemModstamp,S_E_Type_Flag__c,
                    S_E__c,Vacation_Reactivation_Date__c FROM Products__c WHERE Account_Id__c=:strAccountID limit 1000];
                    
        lstDirectory = [SELECT Account_Id__c,CreatedById,CreatedDate,Description_Line__c,Description__c,Directory_Code_1__c,Directory_Code_2__c,
                    Directory_Code_3__c,Directory_Code_4__c,Directory_Code_5__c,Directory_Listing_Code__c,Directory_Mailing_Address__c,Id,IsDeleted,
                    LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Last_Sequence_Number__c,Library_id__c,Line_number__c,
                    Listing_Sequence__c,List_With_Phone_Number__c,Name,OwnerId,Phone_Number__c,Reference_Number__c,Sequence_Number__c,SystemModstamp 
                    FROM Directory__c WHERE Account_Id__c=:strAccountID limit 1000];
      
    }
    
}