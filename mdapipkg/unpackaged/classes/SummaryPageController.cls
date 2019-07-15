public with sharing class SummaryPageController {

    

    public boolean first6months    {get;set;}
    public boolean second6months    {get;set;}
    public String strButtonName    {get;set;}
    public static String strColumnName                             {get;set;}
    public static String strColumnValue                            {get;set;}
    public static String strSearchCriteria                         {get;set;}
    public static String strSearchBy                               {get;set;}
    public static String strTollTelephone                              {get;set;}
    public static String strDipositRefundTelephone                              {get;set;}
    public static String strTNInformationTelephone                              {get;set;}
    public static String strAdjustmentTelephone                              {get;set;}
    //public ObjHirarchyTemp__c objHirarchy                               {get;set;}
    public static Customer_Account__c objCustomerAccount       {get;set;}
    public static List<Customer_Account__c> lstCustomerAccount       {get;set;}
    public static Credit_History__c objCreditHistory           {get;set;}
    public static List<Credit_History__c> lstCreditHistory           {get;set;}
    public static List<Payment_Info__c> lstPaymentInfo           {get;set;}
    public static List<Treatment__c> lstTreatment           {get;set;}
    public static List<Dispute_Info__c> lstDisputeInfo           {get;set;}
    public static List<Tax_Exemption__c> lstTaxExcemption           {get;set;}
    public static List<Deposit_Refund__c> lstDepositRefund           {get;set;}
    public static List<Products__c> lstProducts  {get;set;}
    public static List<Available_Promotion__c> lstAvailablePromotions    {get;set;}
    public static List<Current_Pending_Promotions__c> lstCurrentPendingPromotions        {get;set;}
    public static Provisioning__c objProvisioning  {get;set;}  
    public static List<Provisioning__c> lstProvisioning  {get;set;}
    public static ISP__c objISP                        {get;set;}   
    public static List<ISP__c> lstISP                        {get;set;}
    public static List<Handshake_transaction_History__c> lstHandshakeTransactionHistory  {get;set;}
    public static List<Dish_Transaction_History__c> lstDishTransactionHistory            {get;set;}
    public static Special_Access_Info__c objSpecialAccessInfo          {get;set;}
    public static List<Special_Access_Info__c> lstSpecialAccessInfo          {get;set;}
    public static Equal_Access_Info__c objEqualAccess       {get;set;}
    public static List<Equal_Access_Info__c> lstEqualAccess                   {get;set;}
    public static List<Equal_Access_Info__c> lstEqualAccessType                  {get;set;}
    public static List<Memo__c> lstMemo          {get;set;}
    public static List<Toll__c> lstTool          {get;set;}
    public static Physical_Address__c objPhysicalAddress       {get;set;}
    public static List<Physical_Address__c> lstPhysicalAddress   {get;set;}
        public static List<Products__c> lstProductsTN    {get;set;}
        public static List<Equal_Access_Info__c> lstEqualAccessTN        {get;set;}
        public static List<Available_Promotion__c> lstAvailablePromotionsTN      {get;set;}
        public static List<Current_Pending_Promotions__c> lstCurrentPendingPromotionsTN  {get;set;}
        //public List<Provisioning__c> lstProvisioningTN  {get;set;}
        //public List<ISP__c> lstISPTN    {get;set;}
        public static Provisioning__c objProvisioningTN        {get;set;}
        public static List<Provisioning__c> lstProvisioningTN    {get;set;}
        public static ISP__c objISPTN  {get;set;}
        public static List<ISP__c> lstISPTN      {get;set;}
    
    //List<ARInfoForSixMonths> lstARInfoForSixMonths                              {get;set;}
    
    //public Product2 objProduct2 {get;set;}
    public static List<Adjustments__c> lstAdjustments            {get;set;}
    public static String strInterLateCarrier            {get;set;}
    public static String strInterLateDate           {get;set;}
    public static String strIntraLateCarrier            {get;set;}
    public static String strIntraLateDate           {get;set;}
    public static String strPageBlockSectionColorCode          {get;set;}
    public static String strBTNPhoneCount                              {get;set;}
    public static List<hierarchy__c> lstHierarchyCustomerNameSearch              {get;set;}
    public static String strAccId              {get;set;}
    public static String strSearchlevel                {get;set;}
        public static String disputeInfoDB     {get;set;}      //related to dashboard
        public static String treatmentDB       {get;set;}      //related to dashboard
        public static String taxExcemptionDB   {get;set;}      //related to dashboard
    public set<String> setUniqueCount                     {get;set;}
        
    //public String strSummaryViewURL           {get;set;}
    public static String strTollQuery='SELECT Account_Id__c,Adjusted_By__c,Amount__c,Billing_Number__c,Billing_RAO__c,Bill_Date__c,Bill_Format__c,Calling_Plan__c,Call_Info_Date__c,Call_Info_Time__c,Charge__c,Conversation_Time__c,CreatedById,CreatedDate,CTPOS__c,Date__c,From_RAO__c,From_TN__c,Id,Indicator_1__c,Indicator_2__c,Indicator_3__c,Indicator_4__c,Indicator_5__c,Indicator_6__c,Indicator_7__c,Indicator_8__c,Indicator_9__c,Indicator_10__c,Indicator_11__c,Indicator_12__c,Indicator_13__c,Indicator_14__c,Indicator_15__c,Indicator_16__c,Indicator_17__c,Indicator_18__c,Indicator_19__c,Indicator_20__c,Indicator_21__c,Indicator_22__c,Indicator_23__c,Indicator_24__c,Indicator_25__c,Indicator_26__c,Indicator_27__c,Indicator_28__c,Indicator_29__c,Indicator_30__c,Inter_Chnge_Cr__c,Intrchng_Car_Des__c,IOC_Code__c,IsDeleted,IXC__c,Jurisdiction__c,LastModifiedById,LastModifiedDate,LEG_Number__c,Library_Code__c,Local_Tax__c,Mins__c,MIN_SEC_Billed__c,Msg_Dscriptin__c,Msg_Type_Code__c,Name,Overflow_Digits__c,OwnerId,Phone_Number__c,Place_Called__c,Print_ref_No__c,Rate_Class_Des__c,Rate_Class__c,Rate_Period__c,Rate_Prd_Des__c,Rebate_Info__c,Recordng_Methd__c,Record_ID_Desc__c,Record_ID__c,Reference_No__c,Return_Code__c,Sequence_Number__c,Serial_Number__c,Settlement_Code__c,Split_Call__c,State_Tax__c,SystemModstamp,Time__c,TO_TN__c,Value__c FROM Toll__c ';
    public static String strDepositRefund='SELECT Account_Id__c,CreatedById,CreatedDate,Deposit_Amount__c,Deposit_Code__c,Deposit_Date__c,Deposit_Intreset__c,Deposit_Int_THRU__c,Deposit_Method__c,Dpsit_Description__c,Id,Int_amt_to_Post__c,Int_Refnd_Acct__c,Int_Refnd_Amt__c,Int_Refnd_Chk_No__c,Int_Refnd_Code__c,Int_Refnd_Lst_Date__c,Int_Refnd_ToDate__c,Int_ToDate__c,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,method_Dscriptn__c,Name,OwnerId,Phone_Number__c,Refnd_Acct__c,Refnd_chck_no__c,Refnd_ToDate__c,Refund_Amount__c,Refund_Code__c,Refund_Date__c,Ref_Amt_To_Post__c,Seq_Number__c,SystemModstamp,THRU__c FROM Deposit_Refund__c';
    public static String strMonths='January,February,March,April,May,June,July,August,September,October,November,December';
    public static String strYears='2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020';
    public static String strSelectedMonth                      {get;set;}
    public static String strSelectedYear                       {get;set;}
    public static String strServiceTN                                          {get;set;}
    public String strMonth2     {get;set;}
    public String strMonth3     {get;set;}
    public String strMonth4     {get;set;}
    public String strMonth5     {get;set;}
    public String strMonth6     {get;set;}
    public String strMonth7     {get;set;}
    public String strMonth8     {get;set;}
    public String strMonth9     {get;set;}
    public String strMonth10    {get;set;}
    public String strMonth11    {get;set;}
    public String strMonth12    {get;set;}
    
    public static Integer intMonth1DashBoard    {get;set;}
    public static Integer intMonth2DashBoard    {get;set;}
    public static Integer intMonth3DashBoard    {get;set;}
    public static Integer intMonth4DashBoard    {get;set;}
    public static Integer intMonth5DashBoard    {get;set;}
    
    
    
    public SummaryPageController(){
        //Get the Search Criteria
        strSearchlevel= Apexpages.currentPage().getParameters().get('searchLevel');
        strSearchCriteria = Apexpages.currentPage().getParameters().get('srcCriteria');
        String strCustomerName = Apexpages.currentPage().getParameters().get('custName');
        String strAccValue = Apexpages.currentPage().getParameters().get('childValue');
        System.debug('**** strAccValue ' + strAccValue + '  strSearchCriteria ' + strSearchCriteria + '  strCustomerName ' + strCustomerName + '  strAccValue ' +strAccValue);
        //if(strAccValue!=null && strAccValue!='')
        //    objCustomerAccountInfo();
        
        strServiceTN = strAccValue;             //Used on Detail Inventory Tab
        createObjectsForList();
        
        //For customer name search
        if(strCustomerName!=null && strCustomerName!='')
                getSearchOnName(strCustomerName);
        else if(strAccValue!=null && strAccValue!='')
            objCustomerAccountInfo();
        
        strPageBlockSectionColorCode='#1271F6';
        
        //Get dashoard colors
        getDashboardColors();
        
        //Get AR/Info data
        first6months =true;
        second6months=false;
        strButtonName = 'Previous 6 Months';
        //lstARInfoForSixMonths = getlstARInfoForSixMonths();
        
    }
       //the following method will get the dashboar colors
       public void getDashboardColors(){
                System.debug('**** host ' + ApexPages.currentPage().getHeaders().get('Host') + lstDisputeInfo.size() + '  ' + URL.getSalesforceBaseUrl().toExternalForm());
                String strDomain = URL.getSalesforceBaseUrl().toExternalForm() + '/resource';
                if(lstDisputeInfo.size()>0){
                        if(lstDisputeInfo[0].Status__c=='open')
                                disputeInfoDB=strDomain + '/red';
                        else if(lstDisputeInfo[0].Date__c>(date.today().addMonths(3)))
                                disputeInfoDB=strDomain + '/yellow';
                        else
                                disputeInfoDB=strDomain + '/green';
                }       
                
                if(lstTaxExcemption.size()>0){
                        if(Date.today()>lstTaxExcemption[0].Expiration__c)
                                taxExcemptionDB = strDomain + '/red';
                        if(lstTaxExcemption[0].Expiration__c>date.today().addMonths(3) && lstTaxExcemption[0].Expiration__c<date.today())
                                taxExcemptionDB = strDomain + '/yellow';
                        else
                                taxExcemptionDB = strDomain + '/green';
                                
                }
                
                System.debug('**** disputeInfoDB ' + disputeInfoDB);
       } 
       
        //The following method will create objects for all the list objects
        
        public void createObjectsForList(){
                //Create object for all the lists
        lstHierarchyCustomerNameSearch = new List<hierarchy__c>();
        lstDisputeInfo = new List<Dispute_Info__c>();
        lstCustomerAccount = new List<Customer_Account__c>();
        objCustomerAccount = new Customer_Account__c();
                lstCreditHistory = new List<Credit_History__c>();
        lstPaymentInfo = new List<Payment_Info__c>();
            lstTreatment = new List<Treatment__c>();
            //lstDisputeInfo = new List<Dispute_Info__c>();
            lstTaxExcemption = new List<Tax_Exemption__c>();
            lstDepositRefund = new List<Deposit_Refund__c>();
            lstProducts = new List<Products__c>();
            lstAvailablePromotions = new List<Available_Promotion__c>();
            lstCurrentPendingPromotions =  new List<Current_Pending_Promotions__c>();  
            lstProvisioning = new List<Provisioning__c>();
            objProvisioningTN = new Provisioning__c();
            lstISP = new List<ISP__c>();
            objISPTN = new ISP__c();
            lstHandshakeTransactionHistory = new List<Handshake_transaction_History__c>();
            lstDishTransactionHistory = new List<Dish_Transaction_History__c>();
            lstSpecialAccessInfo = new List<Special_Access_Info__c>();
            lstEqualAccess = new List<Equal_Access_Info__c>();
            lstEqualAccessType = new List<Equal_Access_Info__c>();
            lstMemo = new List<Memo__c> ();
            lstTool = new List<Toll__c>();
            lstPhysicalAddress = new List<Physical_Address__c>();
            lstAdjustments = new List<Adjustments__c>(); 
            //lstARInfoForSixMonths = new List<ARInfoForSixMonths>(); 
        }
        
    //The following method is used for custoemr name search
    public void getSearchOnName(String strCustomerName){
             setUniqueCount = new set<String>();
             System.debug('**** strCustomerName ' + strCustomerName + 'SELECT BTN_Phone__c,Circuit_Id__c FROM hierarchy__c WHERE Name__c = \'' + strCustomerName + '\'');
            lstHierarchyCustomerNameSearch = Database.query('SELECT BTN_Phone__c,Circuit_Id__c FROM hierarchy__c WHERE Name__c = \'' + strCustomerName + '\' LIMIT 999');
            for(hierarchy__c hi:lstHierarchyCustomerNameSearch){
                setUniqueCount.add(hi.BTN_Phone__c);
            }
            
            
            //strBTNPhoneCount=String.valueOf(lstHierarchyCustomerNameSearch.size());
            strBTNPhoneCount=String.valueOf(setUniqueCount.size());
            System.debug('**** lstHierarchyCustomerNameSearch.size() ' + lstHierarchyCustomerNameSearch.size());
    }
    
    
    public static void objCustomerAccountInfo(){
        //try{
        String strSelRecordName = Apexpages.currentPage().getParameters().get('childValue');
        System.debug('**** strSelRecordName ' + strSelRecordName);
        //Look for Search Location
        //String strAccId = getAccountID(strSelRecordName);
        strAccId = getAccountID(strSelRecordName);
        System.debug('**** strAccId ' + strAccId);
        
       //get the Customer Account Information
       //objCustomerAccount = [SELECT Accept_3rd_Party__c,Accept_Col_Calls__c,Account_Id__c,Account_Number__c,Account_Pwd__c,Address_Line_1__c,Address_Line_2__c,Address_Line_3__c,Amt_Due_Ovr_60__c,Auto_Pay__c,Bank_Ac_Number__c,Bank_Ac_Type__c,Bank_Draft__c,Bank_Name__c,Bank_Number__c,Bank_Rt_Number__c,Billed_Thr_Date__c,Billing_Number__c,Billing_Sq_No__c,Bill_Cycle__c,Bill_Method__c,Bill_Mtd_Des__c,Block_EBPP__c,Block_OBP__c,B_Stly_Lst_Period__c,Circuit_ID__c,City_Abbreviation__c,City__c,Company_Name__c,Company_Number__c,Connect_Date__c,County_Code__c,County_C_Des__c,CreatedById,CreatedDate,Credit_Rating__c,Credit_Rtg_Des__c,Current_Balance__c,Current_Due_Date__c,Customer_Type__c,Cust_OwnM_Eq__c,Date_o_Lst_pro_Demo__c,Detail_Bills__c,Disconnect_Date__c,Dish_Ac_No__c,EBPP_Customer__c,Enrolled_OBP__c,ExternalID__c,Federal_Tax_ID__c,Federal_Tax_Y_N__c,Fictitious_Flag__c,First_Name__c,Handling_Code__c,Handling_C_Des__c,Id,Interlata_Carrier__c,Intralata_Carrier__c,IsDeleted,LastModifiedById,LastModifiedDate,Last_Adst_Amt__c,Last_Bill_Cycle__c,Last_Bill_Method__c,Last_Bill_Period__c,Last_Credit_Rtg__c,Last_Name__c,Last_Pmt_Amt__c,Last_Pmt_Date__c,Last_St_Due_Date__c,Library_ID__c,Lst_Mtd_Cyc_Per__c,Lst_Smt_Isue_Amt__c,Lst_St_Isue_Date__c,Lst_Tmt_Date__c,M_f_b_ur_flg_Y_N__c,Name,Name_Format__c,Nine_D_Zip_Code__c,No_Of_Prior_Dcs__c,No_Of_Pr_R_Chks__c,No_Of_Pr_S_Ntc__c,Ol_Bill_Pay_Cust__c,OwnerId,Past_Due_Info__c,Pbl_Non_Pbls__c,Phone_Number__c,PIC_Frfeeze__c,PIN__c,PLOC_Freeze__c,Print_Off__c,Priv_Line_Type__c,Quantity_Of_Bills__c,Ref_To_Pay_Tax__c,School_Code__c,Sch_Code_Des__c,Seq_Number__c,Service_Type__c,Serv_Area_Contl__c,Ser_Type_Des__c,Source_Code__c,State_Abbreviation__c,State_Tax_Code__c,State_Tax_Exempt__c,State__c,Status__c,SystemModstamp,S_O_A_S_Lst_Bill__c,Tariff__c,Taxing_District__c,Tax_Exempt_Cat__c,Toll_Limit_Code__c,Toll_Limit_Des__c,Ttl_A_S_Lst_Bill__c,Tx_Dist_Des__c FROM Customer_Account__c WHERE Account_Id__c =:strAccId LIMIT 1];
       lstCustomerAccount = [SELECT Accept_3rd_Party__c,Accept_Col_Calls__c,Account_Id__c,Account_Number__c,Account_Pwd__c,Address_Line_1__c,Address_Line_2__c,Address_Line_3__c,Amt_Due_Ovr_60__c,Auto_Pay__c,Bank_Ac_Number__c,Bank_Ac_Type__c,Bank_Draft__c,Bank_Name__c,Bank_Number__c,Bank_Rt_Number__c,Billed_Thr_Date__c,Billing_Number__c,Billing_Sq_No__c,Bill_Cycle__c,Bill_Method__c,Bill_Mtd_Des__c,Block_EBPP__c,Block_OBP__c,B_Stly_Lst_Period__c,Circuit_ID__c,City_Abbreviation__c,City__c,Company_Name__c,Company_Number__c,Connect_Date__c,County_Code__c,County_C_Des__c,CreatedById,CreatedDate,Credit_Rating__c,Credit_Rtg_Des__c,Current_Balance__c,Current_Due_Date__c,Customer_Type__c,Cust_OwnM_Eq__c,Date_o_Lst_pro_Demo__c,Detail_Bills__c,Disconnect_Date__c,Dish_Ac_No__c,EBPP_Customer__c,Enrolled_OBP__c,ExternalID__c,Federal_Tax_ID__c,Federal_Tax_Y_N__c,Fictitious_Flag__c,First_Name__c,Handling_Code__c,Handling_C_Des__c,Id,Interlata_Carrier__c,Intralata_Carrier__c,IsDeleted,LastModifiedById,LastModifiedDate,Last_Adst_Amt__c,Last_Bill_Cycle__c,Last_Bill_Method__c,Last_Bill_Period__c,Last_Credit_Rtg__c,Last_Name__c,Last_Pmt_Amt__c,Last_Pmt_Date__c,Last_St_Due_Date__c,Library_ID__c,Lst_Mtd_Cyc_Per__c,Lst_Smt_Isue_Amt__c,Lst_St_Isue_Date__c,Lst_Tmt_Date__c,M_f_b_ur_flg_Y_N__c,Name,Name_Format__c,Nine_D_Zip_Code__c,No_Of_Prior_Dcs__c,No_Of_Pr_R_Chks__c,No_Of_Pr_S_Ntc__c,Ol_Bill_Pay_Cust__c,OwnerId,Past_Due_Info__c,Pbl_Non_Pbls__c,Phone_Number__c,PIC_Frfeeze__c,PIN__c,PLOC_Freeze__c,Print_Off__c,Priv_Line_Type__c,Quantity_Of_Bills__c,Ref_To_Pay_Tax__c,School_Code__c,Sch_Code_Des__c,Seq_Number__c,Service_Type__c,Serv_Area_Contl__c,Ser_Type_Des__c,Source_Code__c,State_Abbreviation__c,State_Tax_Code__c,State_Tax_Exempt__c,State__c,Status__c,SystemModstamp,S_O_A_S_Lst_Bill__c,Tariff__c,Taxing_District__c,Tax_Exempt_Cat__c,Toll_Limit_Code__c,Toll_Limit_Des__c,Ttl_A_S_Lst_Bill__c,Tx_Dist_Des__c FROM Customer_Account__c WHERE Account_Id__c =:strAccId LIMIT 999];
       if(lstCustomerAccount.size()>0) objCustomerAccount = lstCustomerAccount[0];
       
       //lstPhysicalAddress = Database.query('SELECT Building_Name__c,City_Abbreviation__c,CLLI_A__c,CLLI_B__c,CreatedById,CreatedDate,CUST_INC_INDIC_1__c,CUST_INC_INDIC_2__c,DSL_Cable__c,ExternalID__c,External_Tax_Loc__c,Fbr_Drp_In_P_Flg__c,FTTP_Flag__c,GEO_Block__c,H_Ows_Identifi__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Last_Update_Date__c,Last_Update_Time__c,Last_Update_User__c,Lattitude__c,Library_id__c,Location_Id__c,Loc_Fran_Agmt__c,Longitude__c,MAP_Number__c,Message_Zone__c,Name,Over_Tax_Loc__c,OwnerId,Region__c,SAM_Flag__c,SAM_Seq_No__c,Ser_Cntl_No__c,Ser_Loc_ID__c,State_Abbre__c,Status_Code__c,Street_Direction__c,Street_Name__c,Street_Number__c,Street_Subtitle__c,Str_Sub_Des__c,SubDiv_Abbre__c,SystemModstamp,S_O_L_C_Asg__c,TAX_District__c,Video_Flag__c,Wire_Center__c,Zipcode__c FROM Physical_Address__c WHERE Ser_Cntl_No__c = \''+ objCustomerAccount.Serv_Area_Contl__c +'\' AND Library_id__c = \''+ objCustomerAccount.Library_ID__c +'\'');
       lstPhysicalAddress = [SELECT Building_Name__c,City_Abbreviation__c,CLLI_A__c,CLLI_B__c,CreatedById,CreatedDate,CUST_INC_INDIC_1__c,CUST_INC_INDIC_2__c,DSL_Cable__c,ExternalID__c,External_Tax_Loc__c,Fbr_Drp_In_P_Flg__c,FTTP_Flag__c,GEO_Block__c,H_Ows_Identifi__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Last_Update_Date__c,Last_Update_Time__c,Last_Update_User__c,Lattitude__c,Library_id__c,Location_Id__c,Loc_Fran_Agmt__c,Longitude__c,MAP_Number__c,Message_Zone__c,Name,Over_Tax_Loc__c,OwnerId,Region__c,SAM_Flag__c,SAM_Seq_No__c,Ser_Cntl_No__c,Ser_Loc_ID__c,State_Abbre__c,Status_Code__c,Street_Direction__c,Street_Name__c,Street_Number__c,Street_Subtitle__c,Str_Sub_Des__c,SubDiv_Abbre__c,SystemModstamp,S_O_L_C_Asg__c,TAX_District__c,Video_Flag__c,Wire_Center__c,Zipcode__c FROM Physical_Address__c WHERE Ser_Cntl_No__c =: objCustomerAccount.Serv_Area_Contl__c AND Library_id__c =: objCustomerAccount.Library_ID__c  LIMIT 999];
       if(lstPhysicalAddress.size()>0) objPhysicalAddress = lstPhysicalAddress[0];
                
       lstCreditHistory = [SELECT Account_DOB__c,Account_Id__c,Assigned_Ac_Rep__c,Audit_User_ID__c,Authorized_DOB__c,Authorized_Name__c,Authorized_user_SS__c,Bandruptcy_Flag__c,Billing_Contact__c,Business_Owner_1__c,Business_Owner_2__c,Busi_Owner_1_Ph__c,Busi_Owner_2_Ph__c,CBR__c,Contact_Phone__c,CPNI_Y_N__c,CreatedById,CreatedDate,Customer_DL__c,Customer_SSN__c,Cust_Auth_ID__c,Employer_Address__c,Employer_Name__c,Employer_Phone__c,Guarantors_Name__c,Guarantors_Phone__c,Hire_Date__c,Hotspot_HSI_Info__c,Id,IsDeleted,Landlord_Name__c,Landlord_Phone__c,LastModifiedById,LastModifiedDate,Library_Id__c,Managers_Name__c,Managers_Phone__c,Misc_Info_1B__c,Misc_Info_1__c,Misc_Info_2B__c,Misc_Info_2__c,Misc_Info_3B__c,Misc_Info_3__c,Name,Nearest_Relative__c,Oth_Adlt_Rmate_1__c,Oth_Adlt_Rmate_2__c,Oth_Adlt_Rmate_3__c,Oth_Adlt_Rmate_4__c,OwnerId,Phone_Number__c,Previous_Phone__c,Red_Flag__c,Related_Hotspot_No__c,Relatives_Address__c,Relative_Phone__c,Residence_Info__c,Rnship_To_Sub__c,Sequence_Number__c,Spouse_DL__c,Spouse_DOB__c,Spouse_Emp_Add__c,Spouse_Emp_Nme__c,Spouse_Nme_Frst__c,Spouse_Nme_Lst__c,Spouse_SSN__c,Ssn__c,SystemModstamp,Type_Of_Business__c,Vacation_React_Code__c,x3rd_Party_Code__c FROM Credit_History__c WHERE Account_Id__c =:strAccId  LIMIT 999];
       if(lstCreditHistory.size()>0) objCreditHistory = lstCreditHistory[0];
       
       lstPaymentInfo = [SELECT Account_Id__c,Bank_Deposit_ID__c,Batch_Name__c,Billing_Account_Id__c,Billing_Number__c,Billing_Seq_No__c,CreatedById,CreatedDate,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_id__c,Name,OwnerId,Payement_Rcvd_Date__c,Payment_Batch__c,Payment_Date__c,payment_seq_no__c,Pending_Batch_ID__c,pending_cc_mem__c,Pending_Pay_Amt__c,Pending_Pay_Type__c,Pending_Ref_No__c,Phone_Number__c,Posted_Bill_with__c,Posted_By__c,posted_cc_mno__c,Posted_Pay_Amt__c,Posted_Pay_Date__c,Posted_pay_type__c,Posted_Ref_No1__c,Post_Time__c,sequence_Number__c FROM Payment_Info__c  WHERE Account_Id__c =:strAccId  LIMIT 999];
       lstTreatment = [SELECT Account_Id__c,Balance_Details__c,Cmitmnt_Status__c,CreatedById,CreatedDate,Date_of_trtmnt__c,Date__c,Details__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Last_Bill_Cycle__c,Library_id__c,Lst_Crdit_Rtng__c,Min_Cutoff_Amt__c,Name,Notice_Amt__c,Notice_Due_Date__c,NSF_Chck_No__c,NSF_Post_Date__c,NSF_Reference__c,OwnerId,Past_Due_trtmnt__c,Phone_Number__c,Seq_Number__c,Service_Rep__c,SystemModstamp,Treatmnt_Amt__c,Type__c FROM Treatment__c WHERE Account_Id__c =:strAccId LIMIT 999];
       //lstDisputeInfo = new List<Dispute_Info__c>();
       lstDisputeInfo =[SELECT Account_Id__c,Amount__c,Category__c,Closed_User__c,Close_Date__c,CreatedById,CreatedDate,Create_Time__c,Date__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Last_Mod_Date__c,Last_Mod_Time__c,Library_Id__c,Name,Open_User__c,OwnerId,Phone_Number__c,Seq_Number__c,Status__c FROM Dispute_Info__c WHERE Account_Id__c =:strAccId LIMIT 999];
       lstTaxExcemption = [SELECT Account_Id__c,Charge__c,CreatedById,CreatedDate,Expiration__c,From_Date__c,Id,IsDeleted,Item__c,LastModifiedById,LastModifiedDate,Library_Id__c,Name,OwnerId,Phone_Number__c,Sequence_Number__c,SystemModstamp,Tax_Author__c,Tax_Certi_No__c,Tax_Type__c,To_Date__c FROM Tax_Exemption__c WHERE Account_Id__c =:strAccId LIMIT 999];
       //lstDepositRefund =[SELECT Account_Id__c,CreatedById,CreatedDate,Deposit_Amount__c,Deposit_And_Interest_Refund_Account__c,Deposit_And_Interest_Refund_Check_Number__c,Deposit_And_Interest_Refund_Code__c,Deposit_And_Interest_Refund_Last_Date__c,Deposit_And_Interest_Refund_ToDate__c,Deposit_And_Interest_ToDate__c,Deposit_Code__c,Deposit_Date__c,Deposit_Description__c,Deposit_Interest_THRU__c,Deposit_Intreset__c,Deposit_method_and_Description__c,Deposit_Refund_Account__c,Deposit_Refund_Amount__c,Deposit_Refund_check_number__c,Deposit_Refund_Code__c,Deposit_Refund_Date__c,Deposit_Refund_ToDate__c,Deposit_Ref_Amount_To_Post__c,Id,Interest_amount_to_Post__c,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Name,OwnerId,Phone_Number__c,Sequence_Number__c,SystemModstamp,THRU__c FROM Deposit_Refund__c  WHERE Account_Id__c =:strAccId];
       lstDepositRefund =Database.query(strDepositRefund + ' WHERE Account_Id__c =\'' + strAccId + '\' LIMIT 999');
       
       lstProducts = [SELECT Account_Id__c,Active_Flag_A__c,Bundle_Name__c,Charge_Code__c,Charge_Rate__c,Circuit_Id__c,CreatedById,CreatedDate,Cust_Owned_Maint_Equipment__c,DC__c,Description__c,Disconnect_Date__c,Generic_SKU__c,Grouping_Name__c,ICB_Code_Flag__c,Id,InDATE__c,IN_Service_Order__c,IsDeleted,Item_Number__c,Item_Sequence_Number__c,I_HSI_WIFI__c,LastModifiedById,LastModifiedDate,Library_id__c,MRC_NRC_FLag__c,Name,NO_Flag_Tax_T__c,Order_Number__c,Out_Date__c,OUT_Service_Order__c,OwnerId,Package_Code__c,Package_Description__c,Package_Name__c,Phone_Number__c,Prefix_P__c,ProductGroupingSequence__c,Product_GroupId__c,Product_Group__c,Product_Rate__c,Quantity__c,Sequence_Number__c,Sequence__c,Service_Location__c,Service_Type_ST__c,Service_Type__c,Status_S__c,SystemModstamp,S_E_Type_Flag__c,S_E__c,Vacation_Reactivation_Date__c FROM Products__c WHERE Account_Id__c =:strAccId LIMIT 999];
       //objProduct2 = [SELECT Account_Id__c,Active_Flag_A__c,Bundle_Name__c,Charge_Code__c,Charge_Rate__c,Circuit_Id__c,Connect_date__c,CreatedById,CreatedDate,Cust_Owened_Maint_Equipment__c,Date__c,DC_Disconnect_Reason_Code__c,Description,Description__c,Disconnect_Date__c,Family,Generic_SKU__c,Group__c,ICB_Code_Flag__c,Id,In_Date__c,In_Service_Order__c,IsActive,IsDeleted,item_code__c,Item_Number__c,Item_Sequence_Number__c,I_HISI_WIFI__c,LastModifiedById,LastModifiedDate,Library_Id__c,MRC_NRC_Flag__c,Name,Non_Reaccuring_Charges__c,No_Tax_Flag__c,Order_Number__c,Out_Date__c,Out_Service_Order__c,Package_Code__c,Package_Description__c,Package_Name__c,Phone_Number__c,Prefix_P__c,ProductCode,product_description__c,Product_Grouping_Sequence__c,Product_Group_Id__c,Product_Group__c,Product_Rate__c,Quantity__c,Reaccuring_Charges__c,Sequence_Number__c,Sequence__c,Service_Location__c,Service_Type_ST__c,Service_Type__c,SiebelRowID__c,SnEcode__c,SnEtype__c,Status_S__c,SystemModstamp,S_E_Code__c,S_E_Type_Flag__c,Tariff_Code__c,Tariff_name__c,Vacation_Reactivation_Date__c FROM Product2 WHERE Account_Id__c =:strAccId LIMIT 1];
       lstAvailablePromotions=[SELECT Account_Id__c,CreatedById,CreatedDate,Descriptions__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Name,OwnerId,Promotions__c FROM Available_Promotion__c WHERE Account_Id__c =:strAccId LIMIT 999];
       lstCurrentPendingPromotions=[SELECT Account_Id__c,Auto_Renewal__c,Billing_Number__c,Billing_Seq_No__c,Cancel_Amount__c,Cancel_Date__c,CreatedById,CreatedDate,Credit_END__c,DISC_ITEM__c,Id,InDATE__c,IsDeleted,LastModifiedById,LastModifiedDate,library_Id__c,Name,Order_Item__c,Override__c,OwnerId,Promotion_Key__c,Promotion__c,Promo_ID__c,Pr_Contr_StrtDte__c,Pr_Exp_Date__c,Pr_Sequence__c,Status__c FROM Current_Pending_Promotions__c WHERE Account_Id__c =:strAccId LIMIT 999];
       lstProvisioning = [SELECT Account_Id__c,CF_Busy_Fixed__c,CF_No_Ans_Fixed__c,CF_Rmt_Acc_PIN__c,CreatedById,CreatedDate,Cut_Thru_Attendant__c,Cut_Thru_To_Pager__c,Distinctive_Ring_Main__c,DRING_Line_1_CF_Chce__c,DRING_Line_1_Patrn__c,DRING_Line_1__c,DRING_Line_2_CF_Choice__c,DRING_Line_2_Patrn__c,DRING_Line_2__c,DRING_Line_3_CF_Choice__c,DRING_Line_3_Patrn__c,DRING_Line_3__c,Hunt_Group_Number__c,Hunt_Member__c,Hunt_Pilot__c,Hunt_Sequence__c,Hunt_Seq_Or_Circle__c,Id,Intercept_Rml_Date__c,IsDeleted,LastModifiedById,LastModifiedDate,Last_SO_Postdate__c,Last_SO_To_Update__c,Library_Id__c,Msg_Routing_Boxes__c,Name,Of_Paths__c,Opt_Intercept_No__c,OwnerId,Pager_Company__c,Pager_PIN__c,Pager__c,Phone_Number__c,Primary_Fax__c,Rmt_Call_Fwd_To__c,Sequence_Number__c,SystemModstamp,Type_Of_Hunting__c,VM_CF_No_Of_Rings__c,VM_Fmly_Sub_Mailbox__c,VM_Remark__c,Weekday_Wake_up__c,Weekend_Wake_up__c FROM Provisioning__c WHERE Account_Id__c =:strAccId LIMIT 999];
       if(lstProvisioning.size()>0) objProvisioning = lstProvisioning[0];
       
       lstISP = [SELECT Account_Id__c,Contact_Phone_Number__c,CreatedById,CreatedDate,Domain_Name__c,Filter_In_Line__c,Frontiernet_Lookout__c,Full_Install_Y_N__c,Id,IsDeleted,LAN_Network__c,LastModifiedById,LastModifiedDate,Library_id__c,Modem_Type__c,Modem_Vendor__c,Name,Network_Size__c,OPS_System__c,OwnerId,Password__c,Product_Plan__c,Security_Info__c,Security_Type__c,sequence_Number__c,Splitter_Y_N__c,SystemModstamp,User_Name__c,Wall_Mount__c,WAN_Static_IP__c FROM ISP__c WHERE Account_Id__c =:strAccId LIMIT 999];
       if(lstISP.size()>0) objISP = lstISP[0];
       
       lstHandshakeTransactionHistory = [SELECT Account_Id__c,Activity__c,ACT__c,Core__c,CreatedById,CreatedDate,Customer_Name__c,Date_Time__c,Dish_Account_Number__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_id__c,Name,OwnerId,Phone_Number__c,Sequence_Number__c FROM Handshake_transaction_History__c WHERE Account_Id__c =:strAccId LIMIT 999];
       lstDishTransactionHistory =[SELECT Account_Id__c,Changed_By__c,Change_date__c,CreatedById,CreatedDate,Dish_S_E_Act__c,Dish_S_E__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_id__c,Name,Nw_Dish_Acct_No__c,Old_Dish_Acct_No__c,OwnerId,Phone_Number__c,Seq_Number__c,SO_Number__c FROM Dish_Transaction_History__c WHERE Account_Id__c =:strAccId LIMIT 999];
       lstSpecialAccessInfo=[SELECT ABC__c,Account_Id__c,AID1__c,AID2__c,ATN__c,AT_T_CR_No__c,BEST__c,CIR_Number__c,CRDD__c,CreatedById,CreatedDate,CRO__c,Customer__c,DIGT__c,Due_Date__c,FDR__c,FRQ__c,HCUT__c,HI_CAP__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_id__c,Name,NCI__c,NC_Code__c,OA01__c,OCC_CIR_No__c,OLOC__c,OwnerId,Phone_Number__c,PIU__c,PON__c,PRD__c,PTD__c,QC_Stage__c,RCDT__c,RO__c,SECNCI__c,Sequence_Number__c,SystemModstamp,TA01__c,Tariff__c,TG__c,TLOC__c,TSP__c,Type_SVC__c,UNE__c,USO_Number__c FROM Special_Access_Info__c WHERE Account_Id__c =:strAccId LIMIT 999];
       if(lstSpecialAccessInfo.size()>0) objSpecialAccessInfo = lstSpecialAccessInfo[0];
       
       //objEqualAccess =[SELECT Account_Id__c,Carrier_Ref_Num__c,CreatedById,CreatedDate,Customer_Notify_Date__c,Effective_Date__c,Effective_Time__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Name,OwnerId,Phone_Number__c,Preffered_CCode__c,Preffered_Description__c,RRN__c,SAC__c,Sequence_Number__c,Seq__c,Service_Order_Number__c,Source_Code__c,Source_Descrition__c,SystemModstamp,Type__c FROM Equal_Access_Info__c WHERE Account_Id__c =:strAccId and Seq__c='1' limit 1];
       lstEqualAccess =[SELECT Account_Id__c,Carrier_Ref_Num__c,CreatedById,CreatedDate,Customer_Notify_Date__c,Effective_Date__c,Effective_Time__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Name,OwnerId,Phone_Number__c,Preffered_CCode__c,Preffered_Description__c,RRN__c,SAC__c,Sequence_Number__c,Seq__c,Service_Order_Number__c,Source_Code__c,Source_Descrition__c,SystemModstamp,Type__c FROM Equal_Access_Info__c WHERE Account_Id__c =:strAccId and Seq__c!='1' LIMIT 999];
       if(lstEqualAccess.size()>0) objEqualAccess = lstEqualAccess[0];
       
       lstEqualAccessType =[SELECT Account_Id__c,Carrier_Ref_Num__c,CreatedById,CreatedDate,Customer_Notify_Date__c,Effective_Date__c,Effective_Time__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Name,OwnerId,Phone_Number__c,Preffered_CCode__c,Preffered_Description__c,RRN__c,SAC__c,Sequence_Number__c,Seq__c,Service_Order_Number__c,Source_Code__c,Source_Descrition__c,SystemModstamp,Type__c FROM Equal_Access_Info__c WHERE Account_Id__c =:strAccId and Seq__c='1' LIMIT 999];
       if(lstEqualAccessType.size()>0){
                for(Equal_Access_Info__c objEqualAccessTemp:lstEqualAccessType){
                        if(objEqualAccessTemp.Type__c=='E'){
                                strInterLateCarrier = objEqualAccessTemp.Preffered_CCode__c + ' ' + objEqualAccessTemp.Preffered_Description__c;
                                strInterLateDate =  strIntraLateDate =  objEqualAccessTemp.Effective_Date__c.month()+'/'+objEqualAccessTemp.Effective_Date__c.day()+'/'+objEqualAccessTemp.Effective_Date__c.year();// String.valueOf(objEqualAccessTemp.Effective_Date__c);
                        }else if(objEqualAccessTemp.Type__c=='A'){
                                strIntraLateCarrier = objEqualAccessTemp.Preffered_CCode__c + ' '+ objEqualAccessTemp.Preffered_Description__c ;
                                strIntraLateDate =  objEqualAccessTemp.Effective_Date__c.month()+'/'+objEqualAccessTemp.Effective_Date__c.day()+'/'+objEqualAccessTemp.Effective_Date__c.year();    //String.valueOf(objEqualAccessTemp.Effective_Date__c);
                        }
                }
       }
       
       
       lstMemo = [SELECT Account_Id__c,Category__c,CreatedById,CreatedDate,Date__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Memo_Context__c,Memo__c,Name,Order_Id__c,OwnerId,Phone_Number__c,Row__c,Sequence_Number__c,SystemModstamp,Template_Id__c,Time__c,Type__c FROM Memo__c WHERE Account_Id__c =:strAccId LIMIT 999];
       lstAdjustments = [SELECT Account_Id__c,Account_Number__c,Amount__c,Batch_Name__c,Billing_Number__c,Billing_Seq_No__c,Charge_Code__c,CreatedById,CreatedDate,Date_Posted__c,Date__c,Description__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Month__c,Name,OwnerId,Phone_Number__c,Posted_By__c,Reference_Number__c,Sequence_Number__c,Sequence__c,SystemModstamp,Tax_been_Appled__c,Type__c,Year__c FROM Adjustments__c WHERE Account_Id__c =:strAccId LIMIT 999];
       //lstTool = [SELECT Account_Id__c,Adjusted_By__c,Amount__c,Billing_Number__c,Billing_RAO__c,Bill_Format__c,Calling_Plan__c,Call_Info_Date__c,Call_Info_Time__c,Charge__c,CILL_Date__c,Conversation_Time__c,CreatedById,CreatedDate,CTPOS__c,Date__c,EMR_Indicator__c,From_RAO__c,From_TN__c,Id,Inter_Change_Carrier__c,IOC_Code__c,IsDeleted,IXC__c,Juridiction__c,LastModifiedById,LastModifiedDate,LEG_Number__c,Library_Code__c,Local_Tax__c,Message_Type_Code_And_Description__c,Mins__c,MIN_SEC_Billed__c,Name,Overflow_Digits__c,OwnerId,Phone_Number__c,Place_Called__c,Print_reference_Number__c,Rate_Class__c,Rate_Period__c,Rebate_Info__c,Recording_Method__c,Record_ID_and_Description__c,Reference_Number__c,Return_Code__c,Sequence_Number__c,Serial_Number__c,Settlement_Code__c,Split_Call__c,State_Tax__c,SystemModstamp,Time_Mins__c,Time__c,TO_TN__c,Value__c FROM Toll__c WHERE Account_Id__c =:strAccId];
       lstTool = Database.query(strTollQuery + ' WHERE Account_Id__c =\'' + strAccId + '\'');
       //return null;
       
        lstProductsTN = [SELECT Account_Id__c,Active_Flag_A__c,Bundle_Name__c,Charge_Code__c,Charge_Rate__c,Circuit_Id__c,CreatedById,CreatedDate,Cust_Owned_Maint_Equipment__c,DC__c,Description__c,Disconnect_Date__c,Generic_SKU__c,Grouping_Name__c,ICB_Code_Flag__c,Id,InDATE__c,IN_Service_Order__c,IsDeleted,Item_Number__c,Item_Sequence_Number__c,I_HSI_WIFI__c,LastModifiedById,LastModifiedDate,Library_id__c,MRC_NRC_FLag__c,Name,NO_Flag_Tax_T__c,Order_Number__c,Out_Date__c,OUT_Service_Order__c,OwnerId,Package_Code__c,Package_Description__c,Package_Name__c,Phone_Number__c,Prefix_P__c,ProductGroupingSequence__c,Product_GroupId__c,Product_Group__c,Product_Rate__c,Quantity__c,Sequence_Number__c,Sequence__c,Service_Location__c,Service_Type_ST__c,Service_Type__c,Status_S__c,SystemModstamp,S_E_Type_Flag__c,S_E__c,Vacation_Reactivation_Date__c FROM Products__c WHERE Account_Id__c =:strAccId LIMIT 999];
                lstEqualAccessTN =[SELECT Account_Id__c,Carrier_Ref_Num__c,CreatedById,CreatedDate,Customer_Notify_Date__c,Effective_Date__c,Effective_Time__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Name,OwnerId,Phone_Number__c,Preffered_CCode__c,Preffered_Description__c,RRN__c,SAC__c,Sequence_Number__c,Seq__c,Service_Order_Number__c,Source_Code__c,Source_Descrition__c,SystemModstamp,Type__c FROM Equal_Access_Info__c WHERE Account_Id__c =:strAccId and Seq__c!='1' LIMIT 999];
                lstAvailablePromotionsTN=[SELECT Account_Id__c,CreatedById,CreatedDate,Descriptions__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Name,OwnerId,Promotions__c FROM Available_Promotion__c WHERE Account_Id__c =:strAccId LIMIT 999];
                lstCurrentPendingPromotionsTN=[SELECT Account_Id__c,Auto_Renewal__c,Billing_Number__c,Billing_Seq_No__c,Cancel_Amount__c,Cancel_Date__c,CreatedById,CreatedDate,Credit_END__c,DISC_ITEM__c,Id,InDATE__c,IsDeleted,LastModifiedById,LastModifiedDate,library_Id__c,Name,Order_Item__c,Override__c,OwnerId,Promotion_Key__c,Promotion__c,Promo_ID__c,Pr_Contr_StrtDte__c,Pr_Exp_Date__c,Pr_Sequence__c,Status__c FROM Current_Pending_Promotions__c WHERE Account_Id__c =:strAccId LIMIT 999];
                lstProvisioningTN = [SELECT Account_Id__c,CF_Busy_Fixed__c,CF_No_Ans_Fixed__c,CF_Rmt_Acc_PIN__c,CreatedById,CreatedDate,Cut_Thru_Attendant__c,Cut_Thru_To_Pager__c,Distinctive_Ring_Main__c,DRING_Line_1_CF_Chce__c,DRING_Line_1_Patrn__c,DRING_Line_1__c,DRING_Line_2_CF_Choice__c,DRING_Line_2_Patrn__c,DRING_Line_2__c,DRING_Line_3_CF_Choice__c,DRING_Line_3_Patrn__c,DRING_Line_3__c,Hunt_Group_Number__c,Hunt_Member__c,Hunt_Pilot__c,Hunt_Sequence__c,Hunt_Seq_Or_Circle__c,Id,Intercept_Rml_Date__c,IsDeleted,LastModifiedById,LastModifiedDate,Last_SO_Postdate__c,Last_SO_To_Update__c,Library_Id__c,Msg_Routing_Boxes__c,Name,Of_Paths__c,Opt_Intercept_No__c,OwnerId,Pager_Company__c,Pager_PIN__c,Pager__c,Phone_Number__c,Primary_Fax__c,Rmt_Call_Fwd_To__c,Sequence_Number__c,SystemModstamp,Type_Of_Hunting__c,VM_CF_No_Of_Rings__c,VM_Fmly_Sub_Mailbox__c,VM_Remark__c,Weekday_Wake_up__c,Weekend_Wake_up__c FROM Provisioning__c WHERE Account_Id__c =:strAccId LIMIT 999];
                if(lstProvisioningTN.size()>0) objProvisioningTN = lstProvisioningTN[0];
                lstISPTN = [SELECT Account_Id__c,Contact_Phone_Number__c,CreatedById,CreatedDate,Domain_Name__c,Filter_In_Line__c,Frontiernet_Lookout__c,Full_Install_Y_N__c,Id,IsDeleted,LAN_Network__c,LastModifiedById,LastModifiedDate,Library_id__c,Modem_Type__c,Modem_Vendor__c,Name,Network_Size__c,OPS_System__c,OwnerId,Password__c,Product_Plan__c,Security_Info__c,Security_Type__c,sequence_Number__c,Splitter_Y_N__c,SystemModstamp,User_Name__c,Wall_Mount__c,WAN_Static_IP__c FROM ISP__c WHERE Account_Id__c =:strAccId limit 999];
        if(lstISPTN.size()>0) objISPTN = lstISPTN[0];
        
        //}catch(Exception ae){
        //       ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'No Data Available (' + ae + ')'));
        //}
    }
    
    //the followoing method will populate on Deposit Refund tab
    public Deposit_Refund__c getDepositRefund(){
        String strSelTool = Apexpages.currentPage().getParameters().get('selDepRefPhone');
        if(strSelTool!=null)
            return Database.query(strDepositRefund + ' WHERE ID =\'' + strSelTool + '\'');      
        
        return null;
    }
    
    //The following method will get the Picklist Values
    public List<selectOption> getMonths() {
        //Get the List Values
        List<String> lstSelValues=strMonths.split(',');
        Integer intMonthVal=0;
        List<selectOption> options = new List<selectOption>(); 
        options.add(new selectOption('', '- None -')); 
        for(String strVal:lstSelValues){
                options.add(new selectOption('' + ++intMonthVal, strVal)); 
        }
        return options; //return the picklist options
    }
    
    //The following method will get the Picklist Values
    public List<selectOption> getYears() {
        //Get the List Values
        List<String> lstSelValues=strYears.split(',');
        
        List<selectOption> options = new List<selectOption>(); 
        options.add(new selectOption('', '- None -')); 
        for(String strVal:lstSelValues){
                options.add(new selectOption(strVal, strVal)); 
        }
        return options; //return the picklist options
    }
    
    //the following method will filter Depositi Refund information based on Phone Number
    public void searchDepositInfoOnTelephone(){
        //System.debug('**** searchDepositInfoOnTelephone ' + strDipositRefundTelephone);
        //if(strDipositRefundTelephone!=null && strDipositRefundTelephone!=''){
        //        lstDepositRefund = Database.query(strDepositRefund + ' WHERE Phone_Number__c LIKE \''+ strDipositRefundTelephone + '%\'');                    
        //}
        System.debug('**** strAdjustmentTelephone ' + strAdjustmentTelephone);
        if(strAdjustmentTelephone!=null && strAdjustmentTelephone!=''){
                
                strAdjustmentTelephone = strAdjustmentTelephone.replace('(', '');
                strAdjustmentTelephone = strAdjustmentTelephone.replace(')', '');
                strAdjustmentTelephone = strAdjustmentTelephone.replace('-', '');
                strAdjustmentTelephone = strAdjustmentTelephone.replace(' ', '');
                System.debug('***** strAdjustmentTelephone len ' + strAdjustmentTelephone.length());
                
                if(strAdjustmentTelephone.length()==1)
                        strAdjustmentTelephone='('+strAdjustmentTelephone.substring(0,1);
                else if(strAdjustmentTelephone.length()==2)
                        strAdjustmentTelephone='('+strAdjustmentTelephone.substring(0,2);
                else if(strAdjustmentTelephone.length()==3)
                        strAdjustmentTelephone='('+strAdjustmentTelephone.substring(0,3);
                else if(strAdjustmentTelephone.length()==4)
                        strAdjustmentTelephone='('+strAdjustmentTelephone.substring(0, 3) + ') ' +strAdjustmentTelephone.substring(3, 4);
                else if(strAdjustmentTelephone.length()==5)
                        strAdjustmentTelephone='('+strAdjustmentTelephone.substring(0, 3) + ') ' +strAdjustmentTelephone.substring(3, 5);
                else if(strAdjustmentTelephone.length()==6)
                        strAdjustmentTelephone='('+strAdjustmentTelephone.substring(0, 3) + ') ' +strAdjustmentTelephone.substring(3, 6);
                else if(strAdjustmentTelephone.length()==7)
                        strAdjustmentTelephone='('+strAdjustmentTelephone.substring(0, 3) + ') ' +strAdjustmentTelephone.substring(3, 6) + '-' + strAdjustmentTelephone.substring(6, 7);
                else if(strAdjustmentTelephone.length()==8)
                        strAdjustmentTelephone='('+strAdjustmentTelephone.substring(0, 3) + ') ' +strAdjustmentTelephone.substring(3, 6) + '-' + strAdjustmentTelephone.substring(6, 8);
                else if(strAdjustmentTelephone.length()==9)
                        strAdjustmentTelephone='('+strAdjustmentTelephone.substring(0, 3) + ') ' +strAdjustmentTelephone.substring(3, 6) + '-' + strAdjustmentTelephone.substring(6, 9);                        
                else if(strAdjustmentTelephone.length()==10){ //7566706754
                        strAdjustmentTelephone = '('+strAdjustmentTelephone.substring(0, 3) + ') ' +strAdjustmentTelephone.substring(3, 6) + '-' + strAdjustmentTelephone.substring(6, 10);
                }
                        //updated view
                        IF(strSelectedMonth!='' && strSelectedYear!='' && strSelectedMonth!=null && strSelectedYear!=null){
                        String dtFrom = String.valueOf(Date.valueOf(strSelectedYear + '-' + strSelectedMonth + '-1'));
                                String dtTo = String.valueOf(Date.valueOf(strSelectedYear + '-' + strSelectedMonth + '-' + Date.daysInMonth(Integer.valueof(strSelectedYear), Integer.valueof(strSelectedMonth)) + ''));
                                
                                System.debug('dtFrom ' + dtFrom + '  dtTo ' + dtTo);
                        lstAdjustments = Database.query('SELECT Account_Id__c,Account_Number__c,Amount__c,Batch_Name__c,Billing_Number__c,Billing_Seq_No__c,Charge_Code__c,CreatedById,CreatedDate,Date_Posted__c,Date__c,Description__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Month__c,Name,OwnerId,Phone_Number__c,Posted_By__c,Reference_Number__c,Sequence_Number__c,Sequence__c,SystemModstamp,Tax_been_Appled__c,Type__c,Year__c FROM Adjustments__c WHERE Account_Id__c =\''+strAccId + '\' AND Phone_Number__c LIKE \'%' + strAdjustmentTelephone + '%\' AND Date_Posted__c >=' + dtFrom.replace('00:00:00','') + ' AND Date_Posted__c<='+dtTo.replace('00:00:00','') +' LIMIT 999' );
                        }else
                        lstAdjustments = Database.query('SELECT Account_Id__c,Account_Number__c,Amount__c,Batch_Name__c,Billing_Number__c,Billing_Seq_No__c,Charge_Code__c,CreatedById,CreatedDate,Date_Posted__c,Date__c,Description__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Month__c,Name,OwnerId,Phone_Number__c,Posted_By__c,Reference_Number__c,Sequence_Number__c,Sequence__c,SystemModstamp,Tax_been_Appled__c,Type__c,Year__c FROM Adjustments__c WHERE Account_Id__c =\''+strAccId + '\' AND Phone_Number__c LIKE \'%' + strAdjustmentTelephone + '%\' LIMIT 999');                    
       }
    }
    
    //the following method will filter TN information based on Phone Number
    public void searchTNInfoOnTelephone(){
                String strUpatedAccID;
        System.debug('**** strAdjustmentTelephone ' + strTNInformationTelephone);
        if(strTNInformationTelephone!=null && strTNInformationTelephone!=''){
                String strTNInfoNumberWithoutBrackets='';
                strTNInformationTelephone = strTNInformationTelephone.replace('(', '');
                strTNInformationTelephone = strTNInformationTelephone.replace(')', '');
                strTNInformationTelephone = strTNInformationTelephone.replace('-', '');
                strTNInformationTelephone = strTNInformationTelephone.replace(' ', '');
                System.debug('***** strAdjustmentTelephone len ' + strAdjustmentTelephone.length());
                strTNInfoNumberWithoutBrackets = strTNInformationTelephone;
                
                if(strTNInformationTelephone.length()==10){ //7566706754
                        strTNInformationTelephone = '('+strTNInformationTelephone.substring(0, 3) + ') ' +strTNInformationTelephone.substring(3, 6) + '-' + strTNInformationTelephone.substring(6, 10);
                        strServiceTN = strTNInformationTelephone;       
                }
                //updated view
                //hierarchy__c objAccHir = [SELECT Account_Id__c, WTN_ID__c, Summary_Id__c, billing_id__c FROM hierarchy__c WHERE WTN__c =:strTNInformationTelephone limit 1];
                hierarchy__c objAccHir = [SELECT Account_Id__c, WTN_ID__c, Summary_Id__c, billing_id__c FROM hierarchy__c WHERE WTN__c =:strTNInformationTelephone OR WTN__c =:strTNInfoNumberWithoutBrackets limit 1];
                System.debug('**** objAccHir ' + objAccHir);
                
                if(objAccHir!=null){
                        strUpatedAccID=objAccHir.WTN_ID__c;
                        lstProductsTN = [SELECT Account_Id__c,Active_Flag_A__c,Bundle_Name__c,Charge_Code__c,Charge_Rate__c,Circuit_Id__c,CreatedById,CreatedDate,Cust_Owned_Maint_Equipment__c,DC__c,Description__c,Disconnect_Date__c,Generic_SKU__c,Grouping_Name__c,ICB_Code_Flag__c,Id,InDATE__c,IN_Service_Order__c,IsDeleted,Item_Number__c,Item_Sequence_Number__c,I_HSI_WIFI__c,LastModifiedById,LastModifiedDate,Library_id__c,MRC_NRC_FLag__c,Name,NO_Flag_Tax_T__c,Order_Number__c,Out_Date__c,OUT_Service_Order__c,OwnerId,Package_Code__c,Package_Description__c,Package_Name__c,Phone_Number__c,Prefix_P__c,ProductGroupingSequence__c,Product_GroupId__c,Product_Group__c,Product_Rate__c,Quantity__c,Sequence_Number__c,Sequence__c,Service_Location__c,Service_Type_ST__c,Service_Type__c,Status_S__c,SystemModstamp,S_E_Type_Flag__c,S_E__c,Vacation_Reactivation_Date__c FROM Products__c WHERE Account_Id__c =:strUpatedAccID LIMIT 999];
                        lstEqualAccessTN =[SELECT Account_Id__c,Carrier_Ref_Num__c,CreatedById,CreatedDate,Customer_Notify_Date__c,Effective_Date__c,Effective_Time__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Name,OwnerId,Phone_Number__c,Preffered_CCode__c,Preffered_Description__c,RRN__c,SAC__c,Sequence_Number__c,Seq__c,Service_Order_Number__c,Source_Code__c,Source_Descrition__c,SystemModstamp,Type__c FROM Equal_Access_Info__c WHERE Account_Id__c =:strUpatedAccID and Seq__c!='1' LIMIT 999];
                        lstAvailablePromotionsTN=[SELECT Account_Id__c,CreatedById,CreatedDate,Descriptions__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Name,OwnerId,Promotions__c FROM Available_Promotion__c WHERE Account_Id__c =:strUpatedAccID LIMIT 999];
                        lstCurrentPendingPromotionsTN=[SELECT Account_Id__c,Auto_Renewal__c,Billing_Number__c,Billing_Seq_No__c,Cancel_Amount__c,Cancel_Date__c,CreatedById,CreatedDate,Credit_END__c,DISC_ITEM__c,Id,InDATE__c,IsDeleted,LastModifiedById,LastModifiedDate,library_Id__c,Name,Order_Item__c,Override__c,OwnerId,Promotion_Key__c,Promotion__c,Promo_ID__c,Pr_Contr_StrtDte__c,Pr_Exp_Date__c,Pr_Sequence__c,Status__c FROM Current_Pending_Promotions__c WHERE Account_Id__c =:strUpatedAccID LIMIT 999];
                        lstProvisioningTN = [SELECT Account_Id__c,CF_Busy_Fixed__c,CF_No_Ans_Fixed__c,CF_Rmt_Acc_PIN__c,CreatedById,CreatedDate,Cut_Thru_Attendant__c,Cut_Thru_To_Pager__c,Distinctive_Ring_Main__c,DRING_Line_1_CF_Chce__c,DRING_Line_1_Patrn__c,DRING_Line_1__c,DRING_Line_2_CF_Choice__c,DRING_Line_2_Patrn__c,DRING_Line_2__c,DRING_Line_3_CF_Choice__c,DRING_Line_3_Patrn__c,DRING_Line_3__c,Hunt_Group_Number__c,Hunt_Member__c,Hunt_Pilot__c,Hunt_Sequence__c,Hunt_Seq_Or_Circle__c,Id,Intercept_Rml_Date__c,IsDeleted,LastModifiedById,LastModifiedDate,Last_SO_Postdate__c,Last_SO_To_Update__c,Library_Id__c,Msg_Routing_Boxes__c,Name,Of_Paths__c,Opt_Intercept_No__c,OwnerId,Pager_Company__c,Pager_PIN__c,Pager__c,Phone_Number__c,Primary_Fax__c,Rmt_Call_Fwd_To__c,Sequence_Number__c,SystemModstamp,Type_Of_Hunting__c,VM_CF_No_Of_Rings__c,VM_Fmly_Sub_Mailbox__c,VM_Remark__c,Weekday_Wake_up__c,Weekend_Wake_up__c FROM Provisioning__c WHERE Account_Id__c =:strUpatedAccID LIMIT 999];
                        if(lstProvisioningTN.size()>0) objProvisioningTN = lstProvisioningTN[0];
                        lstISPTN = [SELECT Account_Id__c,Contact_Phone_Number__c,CreatedById,CreatedDate,Domain_Name__c,Filter_In_Line__c,Frontiernet_Lookout__c,Full_Install_Y_N__c,Id,IsDeleted,LAN_Network__c,LastModifiedById,LastModifiedDate,Library_id__c,Modem_Type__c,Modem_Vendor__c,Name,Network_Size__c,OPS_System__c,OwnerId,Password__c,Product_Plan__c,Security_Info__c,Security_Type__c,sequence_Number__c,Splitter_Y_N__c,SystemModstamp,User_Name__c,Wall_Mount__c,WAN_Static_IP__c FROM ISP__c WHERE Account_Id__c =:strUpatedAccID LIMIT 999];
                        if(lstISPTN.size()>0) objISPTN = lstISPTN[0];
                }
                
                //lstAdjustments = Database.query('SELECT Account_Id__c,Account_Number__c,Amount__c,Batch_Name__c,Billing_Number__c,Billing_Seq_No__c,Charge_Code__c,CreatedById,CreatedDate,Date_Posted__c,Date__c,Description__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Library_Id__c,Month__c,Name,OwnerId,Phone_Number__c,Posted_By__c,Reference_Number__c,Sequence_Number__c,Sequence__c,SystemModstamp,Tax_been_Appled__c,Type__c,Year__c FROM Adjustments__c WHERE Account_Id__c =\''+strAccId + '\' AND Phone_Number__c LIKE \'%' + strAdjustmentTelephone + '%\'');
                                    
       }
    }
    //Get the Selected Tool Info
    public Toll__c getTollDetails(){
        
        String strSelTool = Apexpages.currentPage().getParameters().get('selToll');
        if(strSelTool!=null)
                return Database.query(strTollQuery + ' WHERE ID =\'' + strSelTool + '\'');      
        
        return null;
    }
    //the following method will filter Toll information based on Phone Number
    public void searchTollOnTelephone(){
        if(strTollTelephone!=null && strTollTelephone!=''){
                lstTool = Database.query(strTollQuery + ' WHERE Phone_Number__c LIKE \''+ strTollTelephone + '%\'');                    
        }
    }
    
    public static String getAccountID(String strSelectedVal){
        
        if(strSearchCriteria=='Account'){
                        
                hierarchy__c objAccHir = [SELECT Account_Id__c, Summary_Id__c, billing_id__c FROM hierarchy__c WHERE Name__c =:strSelectedVal OR Summary_master_phone__c =:strSelectedVal OR BTN_Phone__c =:strSelectedVal OR Circuit_id__c =:strSelectedVal limit 1];
                if(objAccHir!=null){
                    //Based on search level, the field value will be updated.
                    if(strSearchlevel=='1')
                        return objAccHir.Account_Id__c;
                    else if(strSearchlevel=='2'){
                        if(objAccHir.Summary_Id__c!=null&&objAccHir.Summary_Id__c!='')
                                return objAccHir.Summary_Id__c;
                        else
                                return objAccHir.billing_id__c;
                    }
                    else if(strSearchlevel=='3')
                        return objAccHir.billing_id__c;
                }
                       // return objAccHir.Account_Id__c;
                else
                        return null;
        }
        return null;
    }
        //**************************************************
        public List<Data> getData() {
        return SummaryPageController.getChartData();
    }
    
    // Make the chart data available via JavaScript remoting 
    
   // @RemoteAction
    public static List<Data> getRemoteData() {
        return SummaryPageController.getChartData();
    }

    // The actual chart data; needs to be static to be 
    
    // called by a @RemoteAction method 
    
    public static List<Data> getChartData() {
        Date dt = System.today();

        List<Data> data = new List<Data>();
        data.add(new Data(getMonth(dt.addMonths(-1).month()), 10, 10, intMonth1DashBoard));
        data.add(new Data(getMonth(dt.addMonths(-2).month()), 44, 100, intMonth2DashBoard));
        data.add(new Data(getMonth(dt.addMonths(-3).month()), 25, 80, intMonth3DashBoard));
        data.add(new Data(getMonth(dt.addMonths(-4).month()), 74, 60, intMonth4DashBoard));
        data.add(new Data(getMonth(dt.addMonths(-5).month()), 65, 51, intMonth5DashBoard));
        return data;
    }
    public static String getMonth(Integer intMonth){
        if(intMonth==1) return 'Jan';
        if(intMonth==2) return 'Feb';
        if(intMonth==3) return 'Mar';
        if(intMonth==4) return 'Apr';
        if(intMonth==5) return 'May';
        if(intMonth==6) return 'Jun';
        if(intMonth==7) return 'Jul';
        if(intMonth==8) return 'Aug';
        if(intMonth==9) return 'Sep';
        if(intMonth==10) return 'Oct';
        if(intMonth==11) return 'Nov';
        if(intMonth==12) return 'Dec';
        
        return null;
    }
    // Wrapper class 
    
    public class Data {
        public String name { get; set; }
        public Integer data1 { get; set; }
        public Integer data2 { get; set; }
        public Integer data3 { get; set; }
        public Data(String name, Integer data1, Integer data2, Integer data3) {
            this.name = name;
            this.data1 = data1;
            this.data2 = data2;
            this.data3 = data3;
        }
    }
    //AR Info Tab details Started----------------
    public class ARInfoForSixMonths{
        public String strTitle                  {get;set;}
        public String strCurrent                {get;set;}
        public String strPrev1Month     {get;set;}
        public String strPrev2Month     {get;set;}
        public String strPrev3Month     {get;set;}
        public String strPrev4Month     {get;set;}
        public String strPrev5Month     {get;set;}
        public String strPrev6Month     {get;set;}
        public String strPrev7Month     {get;set;}
        public String strPrev8Month     {get;set;}
        public String strPrev9Month     {get;set;}
        public String strPrev10Month    {get;set;}
        public String strPrev11Month    {get;set;}
    }
    public List<ARInfoForSixMonths> getlstARInfoForSixMonths(){
        List<ARInfoForSixMonths> lstARInfoForSixMonths = new List<ARInfoForSixMonths>();
        //ARInfoForSixMonths objARInfoForSixMonths = new ARInfoForSixMonths();
        
        //Calcualte the Dates
        /*objARInfoForSixMonths.strTitle ='Bill Date';
        objARInfoForSixMonths.strCurrent = 'Current'; 
        objARInfoForSixMonths.strPrev1Month = strGetDate(-1);//System.today().format('MM/DD/YYYY');
        objARInfoForSixMonths.strPrev2Month = strGetDate(-2);
        objARInfoForSixMonths.strPrev3Month = strGetDate(-3);
        objARInfoForSixMonths.strPrev4Month = strGetDate(-4);
        objARInfoForSixMonths.strPrev5Month = strGetDate(-5);
        objARInfoForSixMonths.strPrev6Month = strGetDate(-6);
        objARInfoForSixMonths.strPrev7Month = strGetDate(-7);
        objARInfoForSixMonths.strPrev8Month = strGetDate(-8);
        objARInfoForSixMonths.strPrev9Month = strGetDate(-9);
        objARInfoForSixMonths.strPrev10Month = strGetDate(-10);
        objARInfoForSixMonths.strPrev11Month = strGetDate(-11);
        lstARInfoForSixMonths.add(objARInfoForSixMonths);*/
        
        //Column titles
        strMonth2 = strGetDate(-1);
        strMonth3 = strGetDate(-2);
        strMonth4 = strGetDate(-3);
        strMonth5 = strGetDate(-4);
        strMonth6 = strGetDate(-5);
        strMonth7 = strGetDate(-6);
        strMonth8 = strGetDate(-7);
        strMonth9 = strGetDate(-8);
        strMonth10 = strGetDate(-9);
        strMonth11 = strGetDate(-10);
        strMonth12 = strGetDate(-11);

        
        
        
        ARInfoForSixMonths obj1stRow = new ARInfoForSixMonths();
        ARInfoForSixMonths obj2stRow = new ARInfoForSixMonths();
        ARInfoForSixMonths obj3stRow = new ARInfoForSixMonths();
        ARInfoForSixMonths obj4stRow = new ARInfoForSixMonths();
        ARInfoForSixMonths obj5stRow = new ARInfoForSixMonths();
        ARInfoForSixMonths obj6stRow = new ARInfoForSixMonths();
        ARInfoForSixMonths obj7stRow = new ARInfoForSixMonths();
        ARInfoForSixMonths obj8stRow = new ARInfoForSixMonths();
        ARInfoForSixMonths obj9stRow = new ARInfoForSixMonths();
        ARInfoForSixMonths obj10stRow = new ARInfoForSixMonths();
        ARInfoForSixMonths obj11stRow = new ARInfoForSixMonths();
        ARInfoForSixMonths obj12stRow = new ARInfoForSixMonths();

                //Get all Tweleve Months Data
                List<Integer> intVal = new List<Integer>();
                intVal.add(0);intVal.add(1);intVal.add(2);intVal.add(3);intVal.add(4);intVal.add(5);intVal.add(6);intVal.add(7);intVal.add(8);
                intVal.add(9);intVal.add(10);intVal.add(11);
                
                //GEt all the values into List and move to Map
                List<A_R_info__c> lstARInfo = [SELECT Account_Id__c,AdjC_LocalSvc__c,Adjustments__c,Balance__c,Billing_Number__c,Billing_Seq_No__c,Bill_Cycle__c,Bill_Date__c,CreatedById,CreatedDate,Id,IsDeleted,LastModifiedById,LastModifiedDate,Last_Pay_Date__c,Library_id__c,Name,Net_Bill__c,OwnerId,Payment__c,Phone_Number__c,Prior_Bill__c,P_P_O_C_C__c,Seq_No__c,SystemModstamp,Toll_Charges__c,Total_Taxes__c FROM A_R_info__c WHERE Billing_Number__c=:Apexpages.currentPage().getParameters().get('childValue') limit 999];
                Map<String, A_R_info__c> objARMap = new Map<String, A_R_info__c>();
                for(A_R_info__c temp:lstARInfo){
                    objARMap.put(temp.Bill_Date__c+'',temp);
                }
                
                
                for(Integer intTemp:intVal){
                        //Get the Data
                        A_R_info__c objARInfo = new A_R_info__c();
                       // List<A_R_info__c> lstARInfo = [SELECT Account_Id__c,AdjC_LocalSvc__c,Adjustments__c,Balance__c,Billing_Number__c,Billing_Seq_No__c,Bill_Cycle__c,Bill_Date__c,CreatedById,CreatedDate,Id,IsDeleted,LastModifiedById,LastModifiedDate,Last_Pay_Date__c,Library_id__c,Name,Net_Bill__c,OwnerId,Payment__c,Phone_Number__c,Prior_Bill__c,P_P_O_C_C__c,Seq_No__c,SystemModstamp,Toll_Charges__c,Total_Taxes__c FROM A_R_info__c WHERE Bill_Date__c =:System.today().addMonths(-intTemp) AND Billing_Number__c=:Apexpages.currentPage().getParameters().get('childValue') limit 999];
                        //if(lstARInfo.size()>0)
                        //        objARInfo= lstARInfo[0];
                        objARInfo=objARMap.get(System.today().addMonths(-intTemp)+'');
                        
                        if(objARInfo==null)
                            objARInfo = new A_R_info__c();
                        
                        ARInfoForSixMonths objARTemp = new ARInfoForSixMonths();
                        //objARTemp.strCurrent = objARInfo.Phone_Number__c;
                        if(intTemp==0){
                                obj1stRow.strTitle='Phone Number';
                                obj1stRow.strCurrent = objARInfo.Phone_Number__c;
                                obj2stRow.strCurrent=objARInfo.Bill_Cycle__c;
                               // obj3stRow.strCurrent= objArInfo.Last_Pay_Date__c.month()+'/';
                               If(objArInfo.Last_Pay_Date__c!=null){
                                String strDate =objArInfo.Last_Pay_Date__c.month()+'/'+objArInfo.Last_Pay_Date__c.day()+'/'+objArInfo.Last_Pay_Date__c.year();
                                System.debug('*** da ' + strDate);
                                obj3stRow.strCurrent= strDate;
                                }                              
                                obj4stRow.strCurrent=String.valueOf(objArinfo.Prior_Bill__c);
                                obj5stRow.strCurrent=String.valueOf(objarinfo.Payment__c);
                                obj6stRow.strCurrent=String.valueOf(objarinfo.Adjustments__c);
                                obj7stRow.strCurrent=String.valueOf(objARInfo.Net_Bill__c);
                                obj8stRow.strCurrent=String.valueOf(objARInfo.AdjC_LocalSvc__c);
                                obj9stRow.strCurrent=String.valueOf(objARInfo.P_P_O_C_C__c);
                                obj10stRow.strCurrent=String.valueOf(objARInfo.Toll_Charges__c);
                                obj11stRow.strCurrent=String.valueOf(objARInfo.Total_Taxes__c);
                                obj12stRow.strCurrent=String.valueOf(objARInfo.Balance__c);
                        }
                        if(intTemp==1){
                                obj2stRow.strTitle='Bill Cycle';
                                obj1stRow.strPrev1Month = objARInfo.Phone_Number__c;
                                obj2stRow.strPrev1Month=objARInfo.Bill_Cycle__c;
                                //obj3stRow.strPrev1Month= String.valueOf(objArInfo.Last_Pay_Date__c);
                                If(objArInfo.Last_Pay_Date__c!=null)
                                    obj3stRow.strPrev1Month=objArInfo.Last_Pay_Date__c.month()+'/'+objArInfo.Last_Pay_Date__c.day()+'/'+objArInfo.Last_Pay_Date__c.year();

                                obj4stRow.strPrev1Month=String.valueOf(objArinfo.Prior_Bill__c);
                                obj5stRow.strPrev1Month=String.valueOf(objarinfo.Payment__c);
                                obj6stRow.strPrev1Month=String.valueOf(objarinfo.Adjustments__c);
                                obj7stRow.strPrev1Month=String.valueOf(objARInfo.Net_Bill__c);
                                obj8stRow.strPrev1Month=String.valueOf(objARInfo.AdjC_LocalSvc__c);
                                obj9stRow.strPrev1Month=String.valueOf(objARInfo.P_P_O_C_C__c);
                                obj10stRow.strPrev1Month=String.valueOf(objARInfo.Toll_Charges__c);
                                obj11stRow.strPrev1Month=String.valueOf(objARInfo.Total_Taxes__c);
                                obj12stRow.strPrev1Month=String.valueOf(objARInfo.Balance__c);
                                
                                //This variable is use for Dashboard Graph populate
                                if(objARInfo.Balance__c!=null && objARInfo.Net_Bill__c!=null)
                                    intMonth1DashBoard = Integer.valueOf(objARInfo.Balance__c-objARInfo.Net_Bill__c);
                        }
                        if(intTemp==2){
                                obj3stRow.strTitle='Last Pay Date';
                                obj1stRow.strPrev2Month = objARInfo.Phone_Number__c;
                                obj2stRow.strPrev2Month=objARInfo.Bill_Cycle__c;
                                //obj3stRow.strPrev2Month= String.valueOf(objArInfo.Last_Pay_Date__c);
                                If(objArInfo.Last_Pay_Date__c!=null)
                                    obj3stRow.strPrev2Month=objArInfo.Last_Pay_Date__c.month()+'/'+objArInfo.Last_Pay_Date__c.day()+'/'+objArInfo.Last_Pay_Date__c.year();
                                obj4stRow.strPrev2Month=String.valueOf(objArinfo.Prior_Bill__c);
                                obj5stRow.strPrev2Month=String.valueOf(objarinfo.Payment__c);
                                obj6stRow.strPrev2Month=String.valueOf(objarinfo.Adjustments__c);
                                obj7stRow.strPrev2Month=String.valueOf(objARInfo.Net_Bill__c);
                                obj8stRow.strPrev2Month=String.valueOf(objARInfo.AdjC_LocalSvc__c);
                                obj9stRow.strPrev2Month=String.valueOf(objARInfo.P_P_O_C_C__c);
                                obj10stRow.strPrev2Month=String.valueOf(objARInfo.Toll_Charges__c);
                                obj11stRow.strPrev2Month=String.valueOf(objARInfo.Total_Taxes__c);
                                obj12stRow.strPrev2Month=String.valueOf(objARInfo.Balance__c);
                                
                                //This variable is use for Dashboard Graph populate
                                if(objARInfo.Balance__c!=null && objARInfo.Net_Bill__c!=null)
                                    intMonth2DashBoard = Integer.valueOf(objARInfo.Balance__c-objARInfo.Net_Bill__c);
                        }
                        if(intTemp==3){
                                obj4stRow.strTitle='Prior Bill';
                                obj1stRow.strPrev3Month = objARInfo.Phone_Number__c;
                                obj2stRow.strPrev3Month=objARInfo.Bill_Cycle__c;
                               // obj3stRow.strPrev3Month= String.valueOf(objArInfo.Last_Pay_Date__c);
                                If(objArInfo.Last_Pay_Date__c!=null)
                                    obj3stRow.strPrev3Month=objArInfo.Last_Pay_Date__c.month()+'/'+objArInfo.Last_Pay_Date__c.day()+'/'+objArInfo.Last_Pay_Date__c.year();

                                obj4stRow.strPrev3Month=String.valueOf(objArinfo.Prior_Bill__c);
                                obj5stRow.strPrev3Month=String.valueOf(objarinfo.Payment__c);
                                obj6stRow.strPrev3Month=String.valueOf(objarinfo.Adjustments__c);
                                obj7stRow.strPrev3Month=String.valueOf(objARInfo.Net_Bill__c);
                                obj8stRow.strPrev3Month=String.valueOf(objARInfo.AdjC_LocalSvc__c);
                                obj9stRow.strPrev3Month=String.valueOf(objARInfo.P_P_O_C_C__c);
                                obj10stRow.strPrev3Month=String.valueOf(objARInfo.Toll_Charges__c);
                                obj11stRow.strPrev3Month=String.valueOf(objARInfo.Total_Taxes__c);
                                obj12stRow.strPrev3Month=String.valueOf(objARInfo.Balance__c);
                                
                                //This variable is use for Dashboard Graph populate
                                if(objARInfo.Balance__c!=null && objARInfo.Net_Bill__c!=null)
                                    intMonth3DashBoard = Integer.valueOf(objARInfo.Balance__c-objARInfo.Net_Bill__c);
                        }
                        if(intTemp==4){
                                obj5stRow.strTitle='Payments';
                                obj1stRow.strPrev4Month = objARInfo.Phone_Number__c;
                                obj2stRow.strPrev4Month=objARInfo.Bill_Cycle__c;
                                //obj3stRow.strPrev4Month= String.valueOf(objArInfo.Last_Pay_Date__c);
                                If(objArInfo.Last_Pay_Date__c!=null)
                                    obj3stRow.strPrev4Month=objArInfo.Last_Pay_Date__c.month()+'/'+objArInfo.Last_Pay_Date__c.day()+'/'+objArInfo.Last_Pay_Date__c.year();
                                obj4stRow.strPrev4Month=String.valueOf(objArinfo.Prior_Bill__c);
                                obj5stRow.strPrev4Month=String.valueOf(objarinfo.Payment__c);
                                obj6stRow.strPrev4Month=String.valueOf(objarinfo.Adjustments__c);
                                obj7stRow.strPrev4Month=String.valueOf(objARInfo.Net_Bill__c);
                                obj8stRow.strPrev4Month=String.valueOf(objARInfo.AdjC_LocalSvc__c);
                                obj9stRow.strPrev4Month=String.valueOf(objARInfo.P_P_O_C_C__c);
                                obj10stRow.strPrev4Month=String.valueOf(objARInfo.Toll_Charges__c);
                                obj11stRow.strPrev4Month=String.valueOf(objARInfo.Total_Taxes__c);
                                obj12stRow.strPrev4Month=String.valueOf(objARInfo.Balance__c);
                                
                                //This variable is use for Dashboard Graph populate
                                if(objARInfo.Balance__c!=null && objARInfo.Net_Bill__c!=null)
                                    intMonth4DashBoard = Integer.valueOf(objARInfo.Balance__c-objARInfo.Net_Bill__c);
                                
                        }
                        if(intTemp==5){
                                obj6stRow.strTitle='Adjustments';
                                obj1stRow.strPrev5Month = objARInfo.Phone_Number__c;
                                obj2stRow.strPrev5Month=objARInfo.Bill_Cycle__c;
                               // obj3stRow.strPrev5Month= String.valueOf(objArInfo.Last_Pay_Date__c);
                                If(objArInfo.Last_Pay_Date__c!=null)
                                    obj3stRow.strPrev5Month=objArInfo.Last_Pay_Date__c.month()+'/'+objArInfo.Last_Pay_Date__c.day()+'/'+objArInfo.Last_Pay_Date__c.year();
                                obj4stRow.strPrev5Month=String.valueOf(objArinfo.Prior_Bill__c);
                                obj5stRow.strPrev5Month=String.valueOf(objarinfo.Payment__c);
                                obj6stRow.strPrev5Month=String.valueOf(objarinfo.Adjustments__c);
                                obj7stRow.strPrev5Month=String.valueOf(objARInfo.Net_Bill__c);
                                obj8stRow.strPrev5Month=String.valueOf(objARInfo.AdjC_LocalSvc__c);
                                obj9stRow.strPrev5Month=String.valueOf(objARInfo.P_P_O_C_C__c);
                                obj10stRow.strPrev5Month=String.valueOf(objARInfo.Toll_Charges__c);
                                obj11stRow.strPrev5Month=String.valueOf(objARInfo.Total_Taxes__c);
                                obj12stRow.strPrev5Month=String.valueOf(objARInfo.Balance__c);
                                
                                //This variable is use for Dashboard Graph populate
                                if(objARInfo.Balance__c!=null && objARInfo.Net_Bill__c!=null)
                                    intMonth5DashBoard = Integer.valueOf(objARInfo.Balance__c-objARInfo.Net_Bill__c);
                        }
                        if(intTemp==6){
                                obj7stRow.strTitle='Net Bill';
                                obj1stRow.strPrev6Month = objARInfo.Phone_Number__c;
                                obj2stRow.strPrev6Month=objARInfo.Bill_Cycle__c;
                               // obj3stRow.strPrev6Month= String.valueOf(objArInfo.Last_Pay_Date__c);
                                If(objArInfo.Last_Pay_Date__c!=null)
                                    obj3stRow.strPrev6Month=objArInfo.Last_Pay_Date__c.month()+'/'+objArInfo.Last_Pay_Date__c.day()+'/'+objArInfo.Last_Pay_Date__c.year();
                                obj4stRow.strPrev6Month=String.valueOf(objArinfo.Prior_Bill__c);
                                obj5stRow.strPrev6Month=String.valueOf(objarinfo.Payment__c);
                                obj6stRow.strPrev6Month=String.valueOf(objarinfo.Adjustments__c);
                                obj7stRow.strPrev6Month=String.valueOf(objARInfo.Net_Bill__c);
                                obj8stRow.strPrev6Month=String.valueOf(objARInfo.AdjC_LocalSvc__c);
                                obj9stRow.strPrev6Month=String.valueOf(objARInfo.P_P_O_C_C__c);
                                obj10stRow.strPrev6Month=String.valueOf(objARInfo.Toll_Charges__c);
                                obj11stRow.strPrev6Month=String.valueOf(objARInfo.Total_Taxes__c);
                                obj12stRow.strPrev6Month=String.valueOf(objARInfo.Balance__c);
                                
                        }
                        if(intTemp==7){
                                obj8stRow.strTitle='AdjC/LocalSvc';
                                obj1stRow.strPrev7Month = objARInfo.Phone_Number__c;
                                obj2stRow.strPrev7Month=objARInfo.Bill_Cycle__c;
                               // obj3stRow.strPrev7Month= String.valueOf(objArInfo.Last_Pay_Date__c);
                                If(objArInfo.Last_Pay_Date__c!=null)
                                    obj3stRow.strPrev7Month=objArInfo.Last_Pay_Date__c.month()+'/'+objArInfo.Last_Pay_Date__c.day()+'/'+objArInfo.Last_Pay_Date__c.year();
                                obj4stRow.strPrev7Month=String.valueOf(objArinfo.Prior_Bill__c);
                                obj5stRow.strPrev7Month=String.valueOf(objarinfo.Payment__c);
                                obj6stRow.strPrev7Month=String.valueOf(objarinfo.Adjustments__c);
                                obj7stRow.strPrev7Month=String.valueOf(objARInfo.Net_Bill__c);
                                obj8stRow.strPrev7Month=String.valueOf(objARInfo.AdjC_LocalSvc__c);
                                obj9stRow.strPrev7Month=String.valueOf(objARInfo.P_P_O_C_C__c);
                                obj10stRow.strPrev7Month=String.valueOf(objARInfo.Toll_Charges__c);
                                obj11stRow.strPrev7Month=String.valueOf(objARInfo.Total_Taxes__c);
                                obj12stRow.strPrev7Month=String.valueOf(objARInfo.Balance__c);
                                
                        }
                        if(intTemp==8){
                                obj9stRow.strTitle='P.P./O.C.C.';
                                obj1stRow.strPrev8Month = objARInfo.Phone_Number__c;
                                obj2stRow.strPrev8Month=objARInfo.Bill_Cycle__c;
                               // obj3stRow.strPrev8Month= String.valueOf(objArInfo.Last_Pay_Date__c);
                                If(objArInfo.Last_Pay_Date__c!=null)
                                    obj3stRow.strPrev8Month=objArInfo.Last_Pay_Date__c.month()+'/'+objArInfo.Last_Pay_Date__c.day()+'/'+objArInfo.Last_Pay_Date__c.year();
                                obj4stRow.strPrev8Month=String.valueOf(objArinfo.Prior_Bill__c);
                                obj5stRow.strPrev8Month=String.valueOf(objarinfo.Payment__c);
                                obj6stRow.strPrev8Month=String.valueOf(objarinfo.Adjustments__c);
                                obj7stRow.strPrev8Month=String.valueOf(objARInfo.Net_Bill__c);
                                obj8stRow.strPrev8Month=String.valueOf(objARInfo.AdjC_LocalSvc__c);
                                obj9stRow.strPrev8Month=String.valueOf(objARInfo.P_P_O_C_C__c);
                                obj10stRow.strPrev8Month=String.valueOf(objARInfo.Toll_Charges__c);
                                obj11stRow.strPrev8Month=String.valueOf(objARInfo.Total_Taxes__c);
                                obj12stRow.strPrev8Month=String.valueOf(objARInfo.Balance__c);
                                
                        }
                        if(intTemp==9){
                                obj10stRow.strTitle='Toll Charges';
                                obj1stRow.strPrev9Month = objARInfo.Phone_Number__c;
                                obj2stRow.strPrev9Month=objARInfo.Bill_Cycle__c;
                               // obj3stRow.strPrev9Month= String.valueOf(objArInfo.Last_Pay_Date__c);
                                If(objArInfo.Last_Pay_Date__c!=null)
                                    obj3stRow.strPrev9Month=objArInfo.Last_Pay_Date__c.month()+'/'+objArInfo.Last_Pay_Date__c.day()+'/'+objArInfo.Last_Pay_Date__c.year();
                                obj4stRow.strPrev9Month=String.valueOf(objArinfo.Prior_Bill__c);
                                obj5stRow.strPrev9Month=String.valueOf(objarinfo.Payment__c);
                                obj6stRow.strPrev9Month=String.valueOf(objarinfo.Adjustments__c);
                                obj7stRow.strPrev9Month=String.valueOf(objARInfo.Net_Bill__c);
                                obj8stRow.strPrev9Month=String.valueOf(objARInfo.AdjC_LocalSvc__c);
                                obj9stRow.strPrev9Month=String.valueOf(objARInfo.P_P_O_C_C__c);
                                obj10stRow.strPrev9Month=String.valueOf(objARInfo.Toll_Charges__c);
                                obj11stRow.strPrev9Month=String.valueOf(objARInfo.Total_Taxes__c);
                                obj12stRow.strPrev9Month=String.valueOf(objARInfo.Balance__c);

                        }
                        if(intTemp==10){
                                obj11stRow.strTitle='Total Taxes';
                                obj1stRow.strPrev10Month = objARInfo.Phone_Number__c;
                                obj2stRow.strPrev10Month=objARInfo.Bill_Cycle__c;
                               // obj3stRow.strPrev10Month= String.valueOf(objArInfo.Last_Pay_Date__c);
                                If(objArInfo.Last_Pay_Date__c!=null)
                                    obj3stRow.strPrev10Month=objArInfo.Last_Pay_Date__c.month()+'/'+objArInfo.Last_Pay_Date__c.day()+'/'+objArInfo.Last_Pay_Date__c.year();
                                obj4stRow.strPrev10Month=String.valueOf(objArinfo.Prior_Bill__c);
                                obj5stRow.strPrev10Month=String.valueOf(objarinfo.Payment__c);
                                obj6stRow.strPrev10Month=String.valueOf(objarinfo.Adjustments__c);
                                obj7stRow.strPrev10Month=String.valueOf(objARInfo.Net_Bill__c);
                                obj8stRow.strPrev10Month=String.valueOf(objARInfo.AdjC_LocalSvc__c);
                                obj9stRow.strPrev10Month=String.valueOf(objARInfo.P_P_O_C_C__c);
                                obj10stRow.strPrev10Month=String.valueOf(objARInfo.Toll_Charges__c);
                                obj11stRow.strPrev10Month=String.valueOf(objARInfo.Total_Taxes__c);
                                obj12stRow.strPrev10Month=String.valueOf(objARInfo.Balance__c);
                                
                        }
                        if(intTemp==11){
                                obj12stRow.strTitle='Balance';
                                obj1stRow.strPrev11Month = objARInfo.Phone_Number__c;
                                obj2stRow.strPrev11Month=objARInfo.Bill_Cycle__c;
                                //obj3stRow.strPrev11Month= String.valueOf(objArInfo.Last_Pay_Date__c);
                                If(objArInfo.Last_Pay_Date__c!=null)
                                    obj3stRow.strPrev11Month=objArInfo.Last_Pay_Date__c.month()+'/'+objArInfo.Last_Pay_Date__c.day()+'/'+objArInfo.Last_Pay_Date__c.year();
                                obj4stRow.strPrev11Month=String.valueOf(objArinfo.Prior_Bill__c);
                                obj5stRow.strPrev11Month=String.valueOf(objarinfo.Payment__c);
                                obj6stRow.strPrev11Month=String.valueOf(objarinfo.Adjustments__c);
                                obj7stRow.strPrev11Month=String.valueOf(objARInfo.Net_Bill__c);
                                obj8stRow.strPrev11Month=String.valueOf(objARInfo.AdjC_LocalSvc__c);
                                obj9stRow.strPrev11Month=String.valueOf(objARInfo.P_P_O_C_C__c);
                                obj10stRow.strPrev11Month=String.valueOf(objARInfo.Toll_Charges__c);
                                obj11stRow.strPrev11Month=String.valueOf(objARInfo.Total_Taxes__c);
                                obj12stRow.strPrev11Month=String.valueOf(objARInfo.Balance__c);
                        }
                }
                
        lstARInfoForSixMonths.add(obj1stRow);
        lstARInfoForSixMonths.add(obj2stRow);
        lstARInfoForSixMonths.add(obj3stRow);
        lstARInfoForSixMonths.add(obj4stRow);
        lstARInfoForSixMonths.add(obj5stRow);
        lstARInfoForSixMonths.add(obj6stRow);
        lstARInfoForSixMonths.add(obj7stRow);
        lstARInfoForSixMonths.add(obj8stRow);
        lstARInfoForSixMonths.add(obj9stRow);
        lstARInfoForSixMonths.add(obj10stRow);
        lstARInfoForSixMonths.add(obj11stRow);
        lstARInfoForSixMonths.add(obj12stRow);

        //************* AR indo tab ended-----------------
        
        return lstARInfoForSixMonths;
    }
    public String strGetDate(Integer intMonth){
        System.debug('Months   ' + intMonth);
        Date dt = system.today();
        System.debug('dt ' + dt);
        dt = dt.addMonths(intMonth);
        System.debug('dt2 ' + dt);
        String strDate = dt.month() + '/' + dt.day() + '/' + dt.year();
        return strDate;
    }
    
    //AR Info Tab details ended----------------
        //*************************************************
    public PageReference prevSixMonths() {
        System.debug('*** months ' + first6months + '   ' + second6months);
        if(first6months ==false){ 
            first6months =true;
            second6months=false;
            strButtonName='Previous 6 Months';
            //return null;
        }else{
            first6months =false;
            second6months=true;
            strButtonName='Latest 6 Months';
        }
        
/*        if(first6months =true){
            first6months =false;
            second6months=true;
        }*/
        System.debug('*** months after ' + first6months + '   ' + second6months);
            
        return null;
    }
}