//@RestResource(urlMapping='/myMethodRest5/*')
global class ItemParser_XMLStreamReader {
 //global String xml = '<?xml version="1.0" encoding="UTF-8" ?> <ItemList><Item ItemID="0919"> <PrimaryInformation ShortDescription="FiOS - Public TV of Armenia" UnitCost="0.00"/></Item></ItemList>';
 //global String xml; 
 /*ItemParser_XMLStreamReader(Item strXML){
    xml=String.valueof(strXML);
 }*/
/* 
 //@HttpPost
    global static Item echoMyType(Item ic) {
        system.debug('*****IC   '+ic);
    return ic;
    }
 */
 /*webService static ResponseClass XMLP(Item IC){
     system.debug('*****IC   '+IC);
    return null;
 }*/
 
  //webService static void parseXML(String xml){
     webService static ResponseClass parseXML(String xml){
    system.debug('#################################### xml:'+xml);
    xml = (System.Encodingutil.base64Decode(xml)).toString();
    system.debug('#################################### xml:'+xml);
     list<Item> lstItem = new list<Item>();
  //   List<List<Item>> lstlstItem = new List<List<Item>>();
     map<String, String> mapDupItem = new map<String,String>();
     List<String> lstDupItem = new List<String>();
//     try{   
       XmlStreamReader xsr = new XmlStreamReader(xml);  
       system.debug('*****xsr'+xsr);
       while(xsr.hasNext()){
            if(xsr.getEventType() == XmlTag.START_ELEMENT){
                if(xsr.getLocalName()=='Item'){
                     Item oItem = parseItem(xsr);
                     system.debug('****oitem'+oitem);
                     if(oItem != null){
                         //Find the duplicates
                         
                         PrimaryInformation objP = oItem.PrimaryInformation;
                         System.debug('*** objP ' + objP);
                         System.debug('*** objP.ShortDescription ' + objP.ShortDescription);
                         String strDE = objP.ShortDescription;
                         strDE = strDE.replace(' ', '');
                         if(strDE!=null && strDE!='')
                               lstItem.add(oItem);
                               
                          //checking for duplicates
                          if(mapDupItem.get(oItem.ItemId)==null)
                            mapDupItem.put(oItem.ItemId,oItem.ItemId);
                        else
                            lstDupItem.add(oItem.ItemId);
                            
                         system.debug('****+lstItem'+oItem);
                    }           
                }
            }
            else if(xsr.getEventType() == XmlTag.END_ELEMENT){
                if(xsr.getLocalName()=='ItemList'){
                    break;
                }
            }
        xsr.next();
      }
       
      //Add the additional to the lsit
  //    lstlstItem.add(lstItem);
 //     catch(Exception ex){
                        
      ResponseClass objRes = new ResponseClass();
        if(lstDupItem.size()>0){
            objRes.isSuccessFailure='Failure';
            objRes.Message = lstDupItem;
        }else{
            objRes.isSuccessFailure='Success';
        }
      
      System.debug('########### -->lstItem:'+lstItem);
      ItemBatch batchJob = new ItemBatch(lstItem);
       Database.executeBatch(batchJob,100);
   //   if(lstlstItem.size()>0){
   //   ItemBatch batchJob = new ItemBatch(lstlstItem);
   //   Database.executeBatch(batchJob,1); 
      
   //     system.debug('batchjob'+batchjob);
    //    }
                return objRes;
        
 }

 
 private static Item parseItem(XmlStreamReader xsr){
    //Item oItem = null;
    Item oItem = new Item();
    while(xsr.hasNext()){
        if(xsr.getEventType() == XmlTag.START_ELEMENT){
            //oItem = new Item();
            System.debug('########### -->xsr.getLocalName():'+xsr.getLocalName() );
            if (xsr.getLocalName()=='Item'){
                //oItem = new Item();
                oItem.ItemID = xsr.getAttributeValue(null, 'ItemID') ;
            }
            else if (xsr.getLocalName()=='PrimaryInformation'){
                //oItem = new Item();
                //PrimaryInformation objP = oItem.PrimaryInformation;
                System.debug('########### -->in primary ):'+xsr.getAttributeValue(null, 'ShortDescription' ) + oItem);
                //objP.ShortDescription = xsr.getAttributeValue(null, 'ShortDescription');
                oItem.PrimaryInformation.ShortDescription = xsr.getAttributeValue(null, 'ShortDescription');            
                oItem.PrimaryInformation.UnitCost = xsr.getAttributeValue(null, 'UnitCost');
            }
            
            
        }
        else if(xsr.getEventType() == XmlTag.END_ELEMENT){
                if(xsr.getLocalName()=='Item'){
                    break;
                }
        }
    xsr.next();
  }
  
  return oItem;
 }
 /*
global class ItemList{
    global List<Item> Item;

}*/

global class Item{
     webservice String ItemID{get;set;}
    webservice PrimaryInformation PrimaryInformation;
     //global list<Category> CategoryList;

 
 global Item(){
    this.ItemID = '';
 this.PrimaryInformation = new PrimaryInformation();
 }
}

global class PrimaryInformation{
     global String ShortDescription; 
     global String UnitCost;
     
 global PrimaryInformation(){
 ShortDescription = '';
 UnitCost = '';
 }
}
global class ResponseClass {
           webservice String isSuccessFailure;
           webservice List<String> Message;
       //    webservice ProductcreateClass productcreateres;
    }
}