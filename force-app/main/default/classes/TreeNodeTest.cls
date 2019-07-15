@isTest
private class TreeNodeTest {

    static testMethod void myUnitTest() {
        
        //Insert Hirarchy dta
        hierarchy__c objHierarchy = new hierarchy__c();
        objHierarchy.Name__c='HirTest';
        objHierarchy.City__c='CA';
        objHierarchy.State__c='AP';
        objHierarchy.Account_id__c='12345';
        
        insert objHierarchy;
        
        
        treenodes1 objTreeNodes = new treenodes1();
        objTreeNodes.strSearchCriteria=null;
        objTreeNodes.searchData();
        objTreeNodes.strSearchCriteria='test';
        objTreeNodes.strSearchByValue='';
        objTreeNodes.searchData();
        objTreeNodes.strSearchByValue='Customer Name';
        objTreeNodes.strColumnValue='';
        objTreeNodes.searchData();
        objTreeNodes.strColumnValue='Hir';
        objTreeNodes.searchData();
        objTreeNodes.strCity=objHierarchy.City__c;
        objTreeNodes.strState =objHierarchy.State__c;
        objTreeNodes.searchData();
        objTreeNodes.strCity=objHierarchy.City__c;
        objTreeNodes.strState ='';
        objTreeNodes.searchData();
        objTreeNodes.strCity='';
        objTreeNodes.strState =objHierarchy.State__c;
        objTreeNodes.searchData();
        
        objTreeNodes.strSearchByValue='Customer Name';
        objTreeNodes.strColumnValue='Hir';
        objTreeNodes.strCity=objHierarchy.City__c;
        objTreeNodes.strState =objHierarchy.State__c;
        objTreeNodes.searchData();
        
        objTreeNodes.strState ='yutgf';
        objTreeNodes.searchData();
        
        objTreeNodes.strSearchCriteria='Account';
        objTreeNodes.strColumnValue=objHierarchy.Name__c;
        objTreeNodes.strCity=objHierarchy.City__c;
        objTreeNodes.strState=objHierarchy.State__c;
        objTreeNodes.strSearchByValue='BTN';
        objTreeNodes.searchData();
        
        /*for(Integer i=1;i<=10;i++){
        	objTreeNodes.strColumnValue=i+'';
        	objTreeNodes.searchData();
        }*/
        objTreeNodes.strColumnValue='1';
        objTreeNodes.searchData();
        objTreeNodes.strColumnValue='12';
        objTreeNodes.searchData();
        objTreeNodes.strColumnValue='123';
        objTreeNodes.searchData();
        objTreeNodes.strColumnValue='1234';
        objTreeNodes.searchData();
        objTreeNodes.strColumnValue='12345';
        objTreeNodes.searchData();
        objTreeNodes.strColumnValue='123456';
        objTreeNodes.searchData();
        objTreeNodes.strColumnValue='1234567';
        objTreeNodes.searchData();
        objTreeNodes.strColumnValue='12345678';
        objTreeNodes.searchData();
        objTreeNodes.strColumnValue='123456789';
        objTreeNodes.searchData();
        objTreeNodes.strColumnValue='1234567890';
        objTreeNodes.searchData();
        
        objTreeNodes.getaccts();
        objTreeNodes.getItems();
        objTreeNodes.getState();
        objTreeNodes.objCustomerAccountInfo();
        
        Apexpages.currentPage().getParameters().put('recID', objHierarchy.Name__c + '~'+objHierarchy.id + '~' + objHierarchy.Name__c);
        objTreeNodes.searchSelectedUserData();
        objTreeNodes.redirectToOrderURL();
        objTreeNodes.PrepareSummaryViewURL();
        objTreeNodes.PrepareBTNViewURL();
        objTreeNodes.PrepareSummaryNameURL();
        objTreeNodes.showButtonOperation();
        objTreeNodes.getHierarchy();
        //objTreeNodes.clsHirarchy objHi = new objTreeNodes.clsHirarchy();
        //clsNodes objNodes = new clsNodes();
    }
}