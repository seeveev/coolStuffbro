global class ClsWSChatter {
    
    webService static List<CollaborationGroup> chatGroupNames(String h) {
        List<CollaborationGroup> ChattData;
        ChattData = [Select c.OwnerId, c.Name, c.Id, c.Description From CollaborationGroup c];
        return ChattData;
    }
}