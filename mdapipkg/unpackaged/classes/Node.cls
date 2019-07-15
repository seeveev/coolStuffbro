global with sharing class Node implements Comparable
{
	public Id NodeId {get;set;}
	public sObject Value {get;set;}
	public String sortField {get;set;} 
	public Id ParentId {get;set;}
	
	public Map<Id, Node> SubTrees {get;set;}
	public list<Node> lstSubTree {
	 get {
	  list<Node> lstTmp = SubTrees.values();
	  lstTmp.sort();	
	  return lstTmp;
	 }
	 set;}
	
	public List<sObject> FirstLevelSObjects {get;set;}
	public list<String> FirstlevelList {get;set;}
	
	public Node(sObject s,String srtFld){
		NodeId = s.Id;
		Value = s;
		
		//srtFld must be a valid api name from sObject s of type integer for flawless sorting capability
		sortField  = srtFld;
		
		SubTrees = new Map<Id, Node>();
		lstSubTree = new list<Node>();
	}
		
	public Node(){
		SubTrees = new Map<Id, Node>();
		lstSubTree = new list<Node>();
	}
	
	public Integer compareTo(Object compareTo){
        Node oNode = (Node) compareTo;
        if (Integer.valueOf(Value.get(sortField)) == Integer.valueOf(oNode.Value.get(sortField))) return 0;
        if (Integer.valueOf(Value.get(sortField)) > Integer.valueOf(oNode.Value.get(sortField))) return 1;
        return -1;        
    }
}