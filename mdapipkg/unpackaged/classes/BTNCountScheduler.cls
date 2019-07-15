global class BTNCountScheduler implements Schedulable 
{
   global void execute(SchedulableContext sc) 
   {
      BTNCount b = new BTNCount (); 
      database.executebatch(b,10);
   }
}