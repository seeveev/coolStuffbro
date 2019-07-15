@RestResource(urlMapping='/myMethodRest111/*')
global class sampletesting{
@HttpPost
  global static types echoMyType(types ic) {
     system.debug('*****IC   '+IC);
     return null;
 }

global class types{
        global string members;
        global string name;

}

global class ResponseClass{



}

}