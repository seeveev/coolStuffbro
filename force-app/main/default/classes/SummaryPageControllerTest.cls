@isTest
private class SummaryPageControllerTest {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        Credit_History__c objCreditHistory = new Credit_History__c();
        objCreditHistory.Account_Id__c='76543278';
        objCreditHistory.Type_Of_Business__c='Resi';
        insert objCreditHistory;
       
        /*Provisioning__c objProvisioning = new Provisioning__c();
        objProvisioning.Account_Id__c='76543278';
        objProvisioning.Hunt_Group_Number__c='9213';
        insert objProvisioning;
        
        ISP__c objISP =new ISP__c();    
        objISP.Account_Id__c='76543278';
        objISP.Domain_Name__c='ghyr';
        insert objISP;
        
        Special_Access_Info__c objSpecialAccessInfo = new Special_Access_Info__c();
        objSpecialAccessInfo.Account_Id__c='76543278';
        objSpecialAccessInfo.CIR_Number__c=875.12;
        //objSpecialAccessInfo.OCC_CIR_Number__c=543.78;
        insert objSpecialAccessInfo;*/
        
        Customer_Account__c objCustomerAccount = new Customer_Account__c();
        objCustomerAccount.Account_Id__c='76543278';
        insert objCustomerAccount;
        
        hierarchy__c objHir = new hierarchy__c();
        objHir.BTN_Phone__c='123';
        objHir.Circuit_id__c='123';
        objHir.Account_Id__c='76543278';
        objHir.WTN__c ='1234567890';
        insert objHir;
        
        /*Product2 objProduct2 = new Product2();
        objProduct2.Name='TestProd';
        objProduct2.Account_Id__c='76543278';
        insert objProduct2;
        
        Available_Promotion__c objAvaPro = new Available_Promotion__c();
        objAvaPro.Account_Id__c='';
        objAvaPro.Name='AvenProd';
        insert objAvaPro;
        
        Current_Pending_Promotions__c objCurrPenPro = new Current_Pending_Promotions__c();
        objCurrPenPro.Name='currpend';
        objCurrPenPro.Account_Id__c='76543278';
        insert objCurrPenPro;
        
        Handshake_transaction_History__c objHanTrHis = new Handshake_transaction_History__c();
        objHanTrHis.Account_Id__c='76543278';
        objHanTrHis.Name='HanTrnHis';
        insert objHanTrHis;
        
        Dish_Transaction_History__c objDisTr = new Dish_Transaction_History__c();
        objDisTr.Name='distr';
        objDisTr.Account_Id__c='76543278';
        insert objDisTr;
        
        Equal_Access__c objEA = new Equal_Access__c();
        objEA.Name='eqacc';
        objEA.Account_Id__c='76543278';
        objEA.Seq__c='1';
        insert objEA;
        
        Deposit_Refund__c objDep = new Deposit_Refund__c();
        objDep.name='dep';
        objDep.Account_Id__c='76543278';
        objDep.Phone_Number__c='1234';
        insert objDep;
        
        Toll__c objToll = new Toll__c();
        objToll.Name='tool';
        objToll.Account_Id__c='76543278';
        insert objToll;*/
        
        A_R_info__c objAR = new A_R_info__c();
        objAR.Account_Id__c='76543278';
        objAR.Bill_Date__c=System.today();
        insert objAR;
        
        Apexpages.currentPage().getParameters().put('srcCriteria','Account');
        Apexpages.currentPage().getParameters().put('childValue','123');
        
        SummaryPageController objSummaryPage = new SummaryPageController();
        //objSummaryPage.objCustomerAccountInfo();
        SummaryPageController.objCustomerAccountInfo();
        
        //objSummaryPage.getDepositRefund();
        //Apexpages.currentPage().getParameters().put('selDepRefPhone',objDep.id);
        //objSummaryPage.getDepositRefund();
        
        //SummaryPageController.strAdjustmentTelephone='1234';
        //objSummaryPage.searchDepositInfoOnTelephone();
        
        //objSummaryPage.getTollDetails();
        //Apexpages.currentPage().getParameters().put('selToll',objToll.id);
        //objSummaryPage.getTollDetails();
        
        //objSummaryPage.searchTollOnTelephone();

        //SummaryPageController.strTNInformationTelephone='1234567890';
        //objSummaryPage.searchTNInfoOnTelephone();
        objSummaryPage.getData();
        SummaryPageController.getRemoteData();
        SummaryPageController.getChartData();
        objSummaryPage.getMonths();
        objSummaryPage.getYears();
        objSummaryPage.getSearchOnName('123');
        //objSummaryPage.ARInfoForSixMonths objAr = new objSummaryPage.ARInfoForSixMonths();
        objSummaryPage.getlstARInfoForSixMonths();
        objSummaryPage.prevSixMonths();
        
        
    }
}