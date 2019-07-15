public class case_handler {
    public void redirect(){
        openPopUp();
    }
    public pagereference openPopUp(){
        PageReference pageRef = new PageReference('http://www.google.com');
        return pageRef;
    }
}