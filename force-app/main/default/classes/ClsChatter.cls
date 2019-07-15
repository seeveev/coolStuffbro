public class ClsChatter {
        public List<CollaborationGroup> ChattData;
    
    public List<CollaborationGroup> getGroupNames(){
        ChattData = [Select c.OwnerId, c.Name, c.Id, c.Description From CollaborationGroup c];
        return ChattData;
    }
}