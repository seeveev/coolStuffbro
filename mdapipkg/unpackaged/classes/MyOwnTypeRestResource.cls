@RestResource(urlMapping='/myMethodRest/*')
global with sharing class MyOwnTypeRestResource {
    
    @HttpPost
    global static MyUserDefinedClassXML echoMyType(MyUserDefinedClassXML ic) {
        system.debug('****ic'+ic);
        return ic;
    }
    global class MyUserDefinedClassXML{
        global ItemList Itemlist;
    }
    global class Itemlist{
        
        global List<Item> Item;
        global Itemlist(){
            // this.Item = new Item();
        }
    }	
    global class Item{
        global String ItemId; 
    }
    
    /*

global class Item{
global String ItemID;
global PrimaryInformation PrimaryInformation;
//global list<Category> CategoryList;

global Item(){
this.ItemID = '';
this.PrimaryInformation = new PrimaryInformation();
}*/}