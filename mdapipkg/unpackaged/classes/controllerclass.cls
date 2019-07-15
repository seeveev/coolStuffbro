public with sharing class controllerclass {

public controllerclass(){
		modelnumber='NNNNN';
		Numberinstock='zero';
}
public controllerclass(String themodelnumber, String thenumberinstock){
	modelnumber= themodelnumber;
	numberinstock =thenumberinstock;
	system.debug('$$$$$$$$$$'+themodelnumber);

}
public string modelnumber;
public string numberinstock;

}