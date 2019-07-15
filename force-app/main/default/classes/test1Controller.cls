public with sharing class test1Controller {
    public List<Account>  lstAcc {get;set;}
    public List<Account> getAccountVal(){
         list<Account> acc = [select name, description from Account];
     return acc;
       // return [select name, description from Account];
    }
}