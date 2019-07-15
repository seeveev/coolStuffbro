public class StearlingQuoteItemViewController {
    public SterlingQuoteItem__c objSQi    {get;set;}
    
    public StearlingQuoteItemViewController(ApexPages.StandardController controller) {
        objSQi = [SELECT AddressDescription__c,AddressText__c,AddressType__c,AdjustedMRC__c,AdjustedNRC__c,BuildingName__c,BuildingNumber__c,BuildingSubNumber__c,
            CPQLineNumber__c,CreatedById,CreatedBy__c,CreatedDate,DataRegion__c,Description__c,DiscountType__c,Discount_DiscountAmountDiscountAmount__c,
            GFItem__c,Id,IsAddressQualified__c,IsContracted__c,IsDeleted,IsNewConstruction__c,IsPromoProduct__c,IsTerm__c,IsZAddressRequired__c,ItemCode__c,
            LastModifiedBy__c,LastModifiedDate,LastReferencedDate,LastViewedDate,LineNumber__c,ListPrice__c,Locality__c,MetroEQualificationType__c,Name,
            NetworkDistance__c,NPA__c,NumInstallments__c,NXX__c,PercentageDiscountAmount__c,Postcode__c,Product2__c,ProductCode__c,ProductInterval__c,
            PromoDiscountAmount__c,PromoExpirationDate__c,PromoName__c,PromotionId__c,PSKU__c,Quantity__c,RequestedDueDate__c,ScheduleId__c,
            ServiceControlNumber__c,ServiceDate__c,ServiceSequenceNumber__c,SKU__c,StandardMRC__c,StandardNRC__c,StateOrProvince__c,Status_Date__c,Status__c,
            SterlingQuote__c,StreetDirection__c,StreetName__c,StreetNrFirst__c,StreetSubDescription__c,StreetSuffix__c,Subdivision__c,Subtotal__c,
            TermEndDateMismatch__c,TermEndDate__c,TermLength__c,TotalPrice__c,UnitPrice__c,unit_Designator__c,unit_number__c,WireCenter__c 
            FROM SterlingQuoteItem__c where id=:apexpages.currentpage().getparameters().get('id')];
    }

    
    public StearlingQuoteItemViewController (){
            /*objSQi = [SELECT AddressDescription__c,AddressText__c,AddressType__c,AdjustedMRC__c,AdjustedNRC__c,BuildingName__c,BuildingNumber__c,BuildingSubNumber__c,
            CPQLineNumber__c,CreatedById,CreatedBy__c,CreatedDate,DataRegion__c,Description__c,DiscountType__c,Discount_DiscountAmountDiscountAmount__c,
            GFItem__c,Id,IsAddressQualified__c,IsContracted__c,IsDeleted,IsNewConstruction__c,IsPromoProduct__c,IsTerm__c,IsZAddressRequired__c,ItemCode__c,
            LastModifiedBy__c,LastModifiedDate,LastReferencedDate,LastViewedDate,LineNumber__c,ListPrice__c,Locality__c,MetroEQualificationType__c,Name,
            NetworkDistance__c,NPA__c,NumInstallments__c,NXX__c,PercentageDiscountAmount__c,Postcode__c,Product2__c,ProductCode__c,ProductInterval__c,
            PromoDiscountAmount__c,PromoExpirationDate__c,PromoName__c,PromotionId__c,PSKU__c,Quantity__c,RequestedDueDate__c,ScheduleId__c,
            ServiceControlNumber__c,ServiceDate__c,ServiceSequenceNumber__c,SKU__c,StandardMRC__c,StandardNRC__c,StateOrProvince__c,Status_Date__c,Status__c,
            SterlingQuote__c,StreetDirection__c,StreetName__c,StreetNrFirst__c,StreetSubDescription__c,StreetSuffix__c,Subdivision__c,Subtotal__c,
            TermEndDateMismatch__c,TermEndDate__c,TermLength__c,TotalPrice__c,UnitPrice__c,unit_Designator__c,unit_number__c,WireCenter__c 
            FROM SterlingQuoteItem__c where id=:apexpages.currentpage().getparameters().get('id')];*/
    }
}