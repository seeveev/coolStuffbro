public class product1 {
  public String strSearchByValue{ get; set;}

public static String strSearchByStandardValues='Name,Billing Id,Telephone';

  public List<selectOption> getaccts() {
        //Get the List Values

        List<String> lstSelValues=strSearchByStandardValues.split(',');
        
        List<selectOption> options = new List<selectOption>(); 
        options.add(new selectOption('', '- None -')); 
        for(String strVal:lstSelValues){
                options.add(new selectOption(strVal, strVal)); 
        }
        return options; //return the picklist options
    }

   }