public class TEZ_AC_pageblocktablecolumn{  
    public list<contact> con{get;set;}  
    public TEZ_AC_pageblocktablecolumn (){  
        con=[select id, name from contact limit 1000];  
    }  
}