public class vijay
{

    public String getObjHirarchy() {
        return null;
    }


    public String objHirarchy { get; set; }

    public PageReference searchData() {
        return null;
    }

   public String getInteger()
   {
   return 'am hungry... :)';
   }
public Account getaccount()
    {
    return [select id, name from Account where id=:System.currentpagereference().getparameters().get('id')];
    }
}