public class LeadTest {
/*Apex script unhandled exception by user/organization: 00530000006dQ5G/00D30000000iiHs

Failed to process batch for class 'Lead_Conversion_Batch' for job id '7071B00002zcSeW'

caused by: System.DmlException: ConvertLead failed. First exception on row 14; first error: UNKNOWN_EXCEPTION, System.LimitException: Too many SOQL queries: 201

Class.Opportunity.convertOpportunities: line 746, column 1
Class.LeadTrigger.AfterUpsertLead: line 197, column 1
Trigger.HM_Lead_Upsert_After: line 31, column 1: []

Class.Lead_Conversion_Batch.execute: line 157, column 1
*/
    /*
     /**************************************************************************
/* Opportunity.cls
/* 
/* This class contains custom Opportunity specific methods. It is used in the new/existing Opportunity check that occurs
/*  in various save events in the system. 
/*  Additionally, telesales scripting calls a getter method to return an applicable Opportunity id (either new or existing).  
/*
/*  Who Date        Description
/*  --- ----------  --------------------------------------------------------
/*  SJD 08/22/2014  Initial Implementation
/*  SJD 09/03/2014  Fix to handle multiple Leads being converted to the same Account
/*  SJD 09/16/2014  Fix to Assign Opportunity when created by Retail User    
/*  LD  07/14/2017  Changes to the Over 65 Opportunity Creation Process for Telesales
/* 
/**************************************************************************/
/*public class Opportunity {
    
    //Custom Settings - Over and Under 65
    //CUSTOM SETTINGS TO DETERMINE OPPORTUNITY CREATION
    private static OpportunitySettings__c EnrollmentPeriodU65{
        get{
            if ( EnrollmentPeriodU65 == null ){
                EnrollmentPeriodU65 = OpportunitySettings__c.getInstance('CurrentU65');
                EnrollmentPeriodU65.Opportunity_Default_Owner__c = HM_Queue_Utils.getQueueId(EnrollmentPeriodU65.Opportunity_Default_Owner__c);
                EnrollmentPeriodU65.Hacker_Positive_Default_Owner__c = HM_Queue_Utils.getQueueId(EnrollmentPeriodU65.Hacker_Positive_Default_Owner__c);
                EnrollmentPeriodU65.Hacker_Negative_Default_Owner__c = HM_Queue_Utils.getQueueId(EnrollmentPeriodU65.Hacker_Negative_Default_Owner__c); 
                EnrollmentPeriodU65.Opportunity_Won_Owner__c = HM_Queue_Utils.getQueueId(EnrollmentPeriodU65.Opportunity_Won_Owner__c);
            }
            return EnrollmentPeriodU65;
        }
    }
    private static OpportunitySettings__c EnrollmentPeriodO65{
        get{
            if ( EnrollmentPeriodO65 == null ){
                EnrollmentPeriodO65 = OpportunitySettings__c.getInstance('CurrentO65');
                EnrollmentPeriodO65.Opportunity_Default_Owner__c = HM_Queue_Utils.getQueueId(EnrollmentPeriodO65.Opportunity_Default_Owner__c);
                EnrollmentPeriodO65.Hacker_Positive_Default_Owner__c = HM_Queue_Utils.getQueueId(EnrollmentPeriodO65.Hacker_Positive_Default_Owner__c);
                EnrollmentPeriodO65.Hacker_Negative_Default_Owner__c = HM_Queue_Utils.getQueueId(EnrollmentPeriodO65.Hacker_Negative_Default_Owner__c);
                EnrollmentPeriodO65.Opportunity_Won_Owner__c = HM_Queue_Utils.getQueueId(EnrollmentPeriodO65.Opportunity_Won_Owner__c);
            }
            return EnrollmentPeriodO65;
        }
    }
    
    private static List<String> lStageNames{
        get{
            if ( lStageNames == null){
                lStageNames = HM_Utils.getPicklistValues('Opportunity__c', 'Stage__c');
            }
            return lStageNames;
        }
    }
    
    private static String sO65Priority{
        get{
            if ( sO65Priority == null ){
                sO65Priority = HM_Queue_Utils.getQueueId('O65WebStaging');
            }
            return sO65Priority;
        }
        set;
    }
    
    private static User u;
    private static String sQueueIdCheck;
    
    private static Boolean knownUser = false;
    
    // --------------------------------------------------------------------------------
    // OPPORTUNITY CREATE
    // --------------------------------------------------------------------------------
    public static List<Opportunity__c> OPCreateCheck(Lead newLead, Lead oldLead, Boolean isInsert, User curUser, String sQueueId, OpportunitySettings__c opSettings){
        
        List<Opportunity__c> opList = new List<Opportunity__c>{};
        
        String sEnrollmentPeriod, sOwnerId, sOppType, sDefaultStage, Assigned;
        if ( newLead.DirectPayIndividual__c == 'Under 65' ){
            if ( opSettings != null ){
                sEnrollmentPeriod = opSettings.Enrollment_Period__c;
                //If Retail Employee - Set Owner to Store Queue
                if ( sQueueId != null ){
                    sOwnerId = sQueueId;
                    Assigned = curUser.Id;
                }
                else{
                    // Leads with Negative Call Permission will be owned by Do Not Call Queue
                    if ( newLead.CallPermission__c == 'No' ){
                        sOwnerId = opSettings.Hacker_Negative_Default_Owner__c;
                    }
                    // Leads with Positive or Unknown Call Permission will be owned by Permission to Call Queue
                    else{
                        sOwnerId = opSettings.Opportunity_Default_Owner__c;
                    }
                }               
                sOppType = opSettings.Default_Opportunity_Type__c;
                sDefaultStage = opSettings.Default_Stage__c;
            }
            else{
                sEnrollmentPeriod = EnrollmentPeriodU65.Enrollment_Period__c;
                //If Retail Employee - Set Owner to Store Queue
                if ( sQueueId != null ){
                    sOwnerId = sQueueId;
                    Assigned = curUser.Id;
                }
                else{
                    // Leads with Negative Call Permission will be owned by Do Not Call Queue
                    if ( newLead.CallPermission__c == 'No' ){
                        sOwnerId = EnrollmentPeriodU65.Hacker_Negative_Default_Owner__c;
                    }
                    // Leads with Positive or Unknown Call Permission will be owned by Permission to Call Queue
                    else{
                        sOwnerId = EnrollmentPeriodU65.Opportunity_Default_Owner__c;
                    }
                }   
                sOppType = EnrollmentPeriodU65.Default_Opportunity_Type__c;
                sDefaultStage = EnrollmentPeriodU65.Default_Stage__c;
            }
        } 
        else if ( newLead.DirectPayIndividual__c == 'Over 65'){
            if ( opSettings != null ){
                sEnrollmentPeriod = opSettings.Enrollment_Period__c;
                //If Retail Employee - Set Owner to Store Queue
                if ( sQueueId != null ){
                    sOwnerId = sQueueId;
                    Assigned = curUser.Id;
                }
                //If Over 65 with Source of Web - Set to O65 Priority
                //These are leads generated from the Web-to-Lead Portal
                else if ( newLead.LeadSource == 'Web' ){
                    sOwnerid = sO65Priority;
                }
                else{
                    //360 created Leads should be owned by Permission to Call if they have a Positive Call Permission
                    if ( (curUser.Name.contains('API')) && (newLead.Call_Permission__c) ){
                        sOwnerId = opSettings.Hacker_Positive_Default_Owner__c;
                    }
                    //360 created Leads should be owned by Do Not Call Queue if they have a Negative Call Permission
                    else if ( (curUser.Name.contains('API')) && (!(newLead.Call_Permission__c)) ){
                        sOwnerId = opSettings.Hacker_Negative_Default_Owner__c;
                    }
                    else{
                        sOwnerId = opSettings.Opportunity_Default_Owner__c;
                    }
                }
                sOppType = opSettings.Default_Opportunity_Type__c;
                sDefaultStage = opSettings.Default_Stage__c;
            }
            else{
                sEnrollmentPeriod = EnrollmentPeriodO65.Enrollment_Period__c;
                //If Retail Employee - Set Owner to Store Queue
                if ( sQueueId != null ){
                    sOwnerId = sQueueId;
                    Assigned = curUser.Id;
                }
                //If Over 65 with Source of Web - Set to O65 Priority
                //These are leads generated from the Web-to-Lead Portal
                else if ( newLead.LeadSource == 'Web' ){
                    sOwnerid = sO65Priority;
                }
                else{
                    //360 created Leads should be owned by Permission to Call if they have a Positive Call Permission
                    if ( (curUser.Name.contains('API')) && (newLead.Call_Permission__c) ){
                        sOwnerId = EnrollmentPeriodO65.Hacker_Positive_Default_Owner__c;
                    }
                    //360 created Leads should be owned by Do Not Call Queue if they have a Negative Call Permission
                    else if ( (curUser.Name.contains('API')) && (!(newLead.Call_Permission__c)) ){
                        sOwnerId = EnrollmentPeriodO65.Hacker_Negative_Default_Owner__c;
                    }
                    else{
                        sOwnerId = EnrollmentPeriodO65.Opportunity_Default_Owner__c;
                    }
                }
                sOppType = EnrollmentPeriodO65.Default_Opportunity_Type__c;
                sDefaultStage = EnrollmentPeriodO65.Default_Stage__c;
            }
        }
        
        //Leads created new will always have an Opportunity created, unless it's determined they should be hidden from the downstream systems
        if ( isInsert ){
            
            Opportunity__c op = new Opportunity__c();
                op.Lead__c = newLead.Id;
                
                op.Name = newLead.FirstName + ' ' + newLead.LastName;
                //Set the Stage to the Default value in the Settings
                // If this is null set to first in the picklist - defined by the picklist order
                if ( sDefaultStage != null ){
                    op.Stage__c = sDefaultStage;
                }
                else{
                    if ( lStageNames.size() > 0){
                        op.Stage__c = lStageNames[0];
                    }
                }           
                op.Stage_Type__c = 'Open';
                if ( sOppType != null ){
                    op.Type__c = sOppType;
                }
                else{
                    op.Type__c = 'Open Enrollment';
                }
                if ( sEnrollmentPeriod != null ){
                    op.Enrollment_Period__c = sEnrollmentPeriod;
                    //Format is yyyy-mm-dd
                    op.Enrollment_Period_Date__c = Date.valueOf(sEnrollmentPeriod + '-01-01');
                }
                else{
                    op.Enrollment_Period__c = String.valueOf(System.today().year());
                    //Format is yyyy-mm-dd
                    op.Enrollment_Period_Date__c = Date.valueOf(System.today().year() + '-01-01');
                }
                
                //Mark Unread on creation
                op.Unread__c = true;
                
                //Add Enrollment Period Date & Type to Opportunity Name
                op.Name = op.Name + ' - ' + op.Enrollment_Period__c + ' - ' + op.Type__c;
                
                //Default Owner
                if ( sOwnerId != null ){
                    op.OwnerId = sOwnerId;
                    if ( Assigned != null ){
                        op.Assigned__c = Assigned;
                    }                      
                }
                
                op.Member_Flow__c = newLead.Member_Flow__c;
                 
            opList.add(op);
        }
        
        return opList;      
    }
    
    // ----------------------------------------------------------------------------------
    // OPPORTUNITY CHECK - DETERMINES IF OPEN OPPORTUNITY EXISTS - IF NOT ONE IS CREATED
    // THIS METHOD IS CALLED FROM OUTSIDE THE LEAD OR ACCOUNT TRIGGERS
    // ----------------------------------------------------------------------------------
    public static Set<Id> checkOpportunity(Set<Id> sOpportunities, Id iAgentCall){
        
        Set<Id> sReturnIds = new Set<Id>{};
        
        Map<Id,Integer> mOpenOpportunitiesCount = new Map<Id,Integer>{};
        Map<Id,Opportunity__c> mOpenOpportunities = new Map<Id,Opportunity__c>{};
        Map<Id,String> mOpportunities = new Map<Id,String>{};
        
        Set<Id> sContactIds = new Set<Id>{};
        Map<Id,Id> mContact2Account = new Map<Id,Id>{};
        Map<Id,Lead> mLeads = new Map<Id,Lead>{};
        Map<Id,Account> mMembers = new Map<Id,Account>{};
        
        Map<Id,String> mObjectType = new Map<Id,String>{};
        List<Opportunity__c> lOpUpdate = new List<Opportunity__c>{};
        List<Opportunity__c> lOpInsert = new List<Opportunity__c>{};
        List<FeedItem> lFeedInsert = new List<FeedItem>{};
        
        u = getCurrentUser();
        
        String sEnrollmentPeriod, sOwnerId, sOppType, sDefaultStage, Assigned;
        
        System.debug('All Ids :: ' + sOpportunities);
        
        //Determine Object Breakdown
        for (Id ID : sOpportunities){
            
            //Lead
            if ( String.valueOf(ID).startsWith('00Q') ){
                mObjectType.put(ID,'Lead');
            }
            //Account
            else if ( String.valueOf(ID).startsWith('001') ){
                mObjectType.put(ID,'Account');
            }
            else if ( String.valueOf(ID).startsWith('003') ){
                sContactIds.add(ID);
            }
        }
        
        List<Account> lAccounts = new List<Account>{};
        
        //Used to determine the applicable Account Id from the WhoId which corresponds to the ContactId in the Person Account model
        if (! sContactIds.isEmpty() ){
            System.debug('Account animation --->');
            lAccounts = [Select Id, PersonContactId
                            from Account
                          where PersonContactId in : sContactIds];
            
            //Populate Map to determine Account Id from Contact Id            
            for (Account a : lAccounts){
                mContact2Account.put(a.PersonContactId,a.Id);
                mObjectType.put(a.Id,'Account');
            }
        }
                
        List<Opportunity__c> lOpportunity = [Select Id, Type__c, Stage__c, Stage_Type__c, Enrollment_Period__c,
                                               Lead__c, Lead__r.Name, 
                                               Member_Contact__c, Member_Contact__r.Name
                                              from Opportunity__c
                                             where ((Lead__c in : sOpportunities)
                                                //Campaign Check
                                                OR (Member_Contact__c in : sOpportunities)
                                                //Task Check
                                                OR (Member_Contact__r.PersonContactId in : sOpportunities))];
        
        //Reanimate Lead and Member records                                     
        List<Account> lMembers = [Select Id, Call_Permission__c, CallPermission__c, Direct_Pay_Individual__c, Name 
                                    from Account
                                  where Id in : sOpportunities
                                   OR PersonContactId in : sOpportunities];
                                  
        List<Lead> lLeads = [Select Id, Call_Permission__c, CallPermission__c, DirectPayIndividual__c, Name, Hide_Lead_Record__c 
                                    from Lead
                                  where Id in : sOpportunities];                                                                
        //Popluate Maps
        for (Lead l : lLeads){
            mLeads.put(l.Id,l);
        }
        
        for (Account a : lMembers){
            mMembers.put(a.Id,a);
        }
                                             
        for (Opportunity__c o : lOpportunity){
            //Track Leads/Members with an Open Status & Exclude Special Enrollment records
            if ( (o.Stage_Type__c == 'Open') && (o.Type__c != 'Special Enrollment') ){
                //Lead
                if ( o.Member_Contact__c == null ){
                    mOpenOpportunitiesCount.put(o.Lead__c, 1);
                    mOpenOpportunities.put(o.Lead__c,o);
                }
                //Member
                else{
                    mOpenOpportunitiesCount.put(o.Member_Contact__c, 1);
                    mOpenOpportunities.put(o.Member_Contact__c,o);
                }
            }
            
            //Lead
            if ( o.Member_Contact__c == null ){
                mOpportunities.put(o.Lead__c,o.Lead__r.Name);
            }
            //Member
            else{
                mOpportunities.put(o.Member_Contact__c,o.Member_Contact__r.Name);
            }
        }
        
        Set<Id> sReturnIdsTempInsert = new Set<Id>{};
        Set<Id> sReturnIdsTempUpdate = new Set<Id>{};
        
        for (Id o : sOpportunities){
            
            System.debug('Id :: ' + o);
            
            //Convert ContactId to Account Id if applicable
            if ( mContact2Account.get(o) != null ){
                o = mContact2Account.get(o);
                System.debug('Converted Id ---> :: ' + o);
            }
            
            //Check if Open Opportunity Exists
            // If no Opportunity exists, create one
            System.debug(mOpenOpportunities.get(o));
            if ( mOpenOpportunitiesCount.get(o) == null ){
                Opportunity__c op = new Opportunity__c();
                    
                    sEnrollmentPeriod = null;
                    sOwnerId = null;
                    sOppType = null;
                    
                    if ( mObjectType.get(o) == 'Lead' ){
                        op.Lead__c = o;
                        Lead l = new Lead();
                        l = mLeads.get(o);
                        
                        if ( l.id != null ){
                            
                            //Ignore check on Lead records identified as part of the Hacker process for conversion
                            if ( l.Hide_Lead_Record__c ){
                                continue;
                            }
                            
                            op.Name = l.Name;
                            
                            if ( l.DirectPayIndividual__c == 'Under 65' ){
                                sEnrollmentPeriod = EnrollmentPeriodU65.Enrollment_Period__c;
                                //If Retail Employee - Set Owner to Store Queue
                                if ( sQueueIdCheck != null ){
                                    sOwnerId = sQueueIdCheck;
                                    Assigned = u.Id;
                                }
                                else{
                                    // Leads with Negative Call Permission will be owned by Do Not Call Queue
                                    if ( l.CallPermission__c == 'No' ){
                                        sOwnerId = EnrollmentPeriodU65.Hacker_Negative_Default_Owner__c;
                                    }
                                    // Leads with Positive or Unknown Call Permission will be owned by Permission to Call Queue
                                    else{
                                        sOwnerId = EnrollmentPeriodU65.Opportunity_Default_Owner__c;
                                    }
                                }
                                //Telesales creates Special Enrollment when not Open Enrollment
                                if ( !(EnrollmentPeriodU65.Active__c) && (iAgentCall != null) ){
                                    sOppType = 'Special Enrollment';
                                }
                                else{
                                    sOppType = EnrollmentPeriodU65.Default_Opportunity_Type__c;
                                }
                                sDefaultStage = EnrollmentPeriodU65.Default_Stage__c;
                            }
                            else if ( l.DirectPayIndividual__c == 'Over 65' ){
                                sEnrollmentPeriod = EnrollmentPeriodO65.Enrollment_Period__c;
                                //If Retail Employee - Set Owner to Store Queue
                                if ( sQueueIdCheck != null ){
                                    sOwnerId = sQueueIdCheck;
                                    Assigned = u.Id;
                                }
                                else{
                                    //360 created should be owned by Permission to Call if they have a Positive Call Permission
                                    if ( (u.Name.contains('API')) && (l.Call_Permission__c) ){
                                        sOwnerId = EnrollmentPeriodO65.Hacker_Positive_Default_Owner__c;
                                    }
                                    //360 created should be owned by Do Not Call Queue if they have a Negative Call Permission
                                    else if ( (u.Name.contains('API')) && (!(l.Call_Permission__c)) ){
                                        sOwnerId = EnrollmentPeriodO65.Hacker_Negative_Default_Owner__c;
                                    }
                                    else{
                                        sOwnerId = EnrollmentPeriodO65.Opportunity_Default_Owner__c;
                                    }
                                }
                                sOppType = EnrollmentPeriodO65.Default_Opportunity_Type__c;
                                sDefaultStage = EnrollmentPeriodO65.Default_Stage__c;
                            }
                            //Enrollment Period Determination
                            if ( sEnrollmentPeriod != null ){
                                op.Enrollment_Period__c = sEnrollmentPeriod;
                                //Format is yyyy-mm-dd
                                op.Enrollment_Period_Date__c = Date.valueOf(sEnrollmentPeriod + '-01-01');
                            }
                            else{
                                op.Enrollment_Period__c = String.valueOf(System.today().year());
                                //Format is yyyy-mm-dd
                                op.Enrollment_Period_Date__c = Date.valueOf(System.today().year() + '-01-01');
                            }
                            if ( sOwnerId != null ){
                                op.OwnerId = sOwnerId;
                                if ( Assigned != null ){
                                    op.Assigned__c = Assigned;
                                }                       
                            }
                        }
                    }
                    else if ( mObjectType.get(o) == 'Account' ){
                        System.debug('Account Creation');
                        op.Member_Contact__c = o;
                        Account a = new Account();
                        a = mMembers.get(o);
                        
                        if ( a.Id != null){
                            op.Name = a.Name;
                            
                            if ( a.Direct_Pay_Individual__c == 'Under 65' ){
                                sEnrollmentPeriod = EnrollmentPeriodU65.Enrollment_Period__c;
                                //If Retail Employee - Set Owner to Store Queue
                                if ( sQueueIdCheck != null ){
                                    sOwnerId = sQueueIdCheck;
                                    Assigned = u.Id;
                                }
                                else{
                                    // Members with Negative Call Permission will be owned by Do Not Call Queue
                                    if ( a.CallPermission__c == 'No' ){
                                        sOwnerId = EnrollmentPeriodU65.Hacker_Negative_Default_Owner__c;
                                    }
                                    // Leads with Positive or Unknown Call Permission will be owned by Permission to Call Queue
                                    else{
                                        sOwnerId = EnrollmentPeriodU65.Opportunity_Default_Owner__c;
                                    }
                                }
                                //Telesales creates Special Enrollment when not Open Enrollment
                                if ( !(EnrollmentPeriodU65.Active__c) && (iAgentCall != null) ){
                                    sOppType = 'Special Enrollment';
                                }
                                else{
                                    sOppType = EnrollmentPeriodU65.Default_Opportunity_Type__c;
                                }
                                sDefaultStage = EnrollmentPeriodU65.Default_Stage__c;
                            }
                            else if ( a.Direct_Pay_Individual__c == 'Over 65' ){
                                sEnrollmentPeriod = EnrollmentPeriodO65.Enrollment_Period__c;
                                //If Retail Employee - Set Owner to Store Queue
                                if ( sQueueIdCheck != null ){
                                    sOwnerId = sQueueIdCheck;
                                    Assigned = u.Id;
                                }
                                else{
                                    //360 created should be owned by Permission to Call if they have a Positive Call Permission
                                    if ( (u.Name.contains('API')) && (a.Call_Permission__c) ){
                                        sOwnerId = EnrollmentPeriodO65.Hacker_Positive_Default_Owner__c;
                                    }
                                    //360 created should be owned by Do Not Call Queue if they have a Negative Call Permission
                                    else if ( (u.Name.contains('API')) && (!(a.Call_Permission__c)) ){
                                        sOwnerId = EnrollmentPeriodO65.Hacker_Negative_Default_Owner__c;
                                    }
                                    else{
                                        sOwnerId = EnrollmentPeriodO65.Opportunity_Default_Owner__c;
                                    }
                                    sDefaultStage = EnrollmentPeriodO65.Default_Stage__c;
                                }
                                sOppType = EnrollmentPeriodO65.Default_Opportunity_Type__c;
                            }
                            //Enrollment Period Determination
                            if ( sEnrollmentPeriod != null ){
                                op.Enrollment_Period__c = sEnrollmentPeriod;
                                //Format is yyyy-mm-dd
                                op.Enrollment_Period_Date__c = Date.valueOf(sEnrollmentPeriod + '-01-01');
                            }
                            else{
                                op.Enrollment_Period__c = String.valueOf(System.today().year());
                                //Format is yyyy-mm-dd
                                op.Enrollment_Period_Date__c = Date.valueOf(System.today().year() + '-01-01');
                            }
                            if ( sOwnerId != null ){
                                op.OwnerId = sOwnerId;
                                if ( Assigned != null ){
                                    op.Assigned__c = Assigned;
                                }                       
                            }
                        } 
                    }
                    
                    //Set the Stage to the Default value in the Settings
                    // If this is null set to first in the picklist - defined by the picklist order
                    if ( sDefaultStage != null ){
                        op.Stage__c = sDefaultStage;
                    }
                    else{
                        if ( lStageNames.size() > 0){
                            op.Stage__c = lStageNames[0];
                        }
                    }               
                    op.Stage_Type__c = 'Open';
                    if ( sOppType != null ){
                        op.Type__c = sOppType;
                    }
                    else{
                        op.Type__c = 'Open Enrollment';
                    }
                    
                    //Mark Unread on creation
                    op.Unread__c = true;
                    
                    //Add Enrollment Period Date & Type to Opportunity Name
                    op.Name = op.Name + ' - ' + op.Enrollment_Period__c + ' - ' + op.Type__c;
                                        
                lOpInsert.add(op);
            }
            else{
                //Opportunity Exists
                sReturnIdsTempUpdate.add(mOpenOpportunities.get(o).Id);
            }
        }
        
        //Should probably use Database.Insert to handle exceptions
        if ( lOpInsert.size() > 0 ){
            insert lOpInsert;
            
            sReturnIdsTempInsert = (new Map<Id,SObject>(lOpInsert)).keySet();
        }
        
        sReturnIds.addAll(sReturnIdsTempInsert);
        sReturnIds.addAll(sReturnIdsTempUpdate);
        System.debug(sReturnIds);
        return sReturnIds;      
    }
    
    //-----------------------------------------------------------------------------------------------
    //METHOD TO CREATE OPPORTUNITIES FOR SENIOR TELESALES. OPPORTUNITY NEEDS TO BE CREATED WITH 
    //APPLICABLE ENROLLMENT PERIOD, NOT BASED ON THE CUSTOM SETTING -- LD
    //-----------------------------------------------------------------------------------------------
    public static Id O65TeleOpportunityCreate(Id LdorMemId, Id iAgentCall){
        
        Agent_Call_Session__c acs = [SELECT Enrollment_Period__c, Election_Period_Type__c from Agent_Call_Session__c where Id = :iAgentCall];
        String enrollPd = acs.Enrollment_Period__c;
        String electionType = acs.Election_Period_Type__c;
        Opportunity__c op = new Opportunity__c();
        
        //Lead
        if ( String.valueOf(LdorMemId).startsWith('00Q') ){
            Lead l = [SELECT Name from Lead where Id = :LdorMemId];
            op.Name = l.Name;
            op.Lead__c = LdorMemId;
        }
        //Account
        else if ( String.valueOf(LdorMemId).startsWith('001') ){
            Account a = [SELECT Name from Account where Id = :LdorMemId];
            op.Name = a.Name;
            op.Member_Contact__c = LdorMemId;
        }
        
        op.Enrollment_Period__c = String.valueOf(System.today().year());
        //Format is yyyy-mm-dd
        op.Enrollment_Period_Date__c = Date.valueOf(System.today().year() + '-01-01');
        
        if(electionType != null){
            op.Type__c = electionType;
        }
        else{
            op.Type__c = enrollPd;
        }
        
        op.Name = op.Name + ' - ' + op.Enrollment_Period__c + ' - ' + enrollPd;
        
        //IF IT'S NOT AEP, ONLY SEP AND IEP CALLS SHOULD CREATE OPPORTUNITIES THAT WILL ROUTE
        if(EnrollmentPeriodO65.Special_Enrollment_Active__c){
            if(enrollPd == 'SEP' || enrollPd == 'IEP' || enrollPd == 'ICEP' || enrollPd == 'Current'){
                op.Stage__c = 'Open - Not Assigned';
                op.Stage_Type__c = 'Open';
            }
            //OPPS FOR N2M AND AEP GET SENT TO THE FUTURE ENROLLMENT QUEUE DURING SEP
            else{
                op.Stage__c = 'Open - Future Enrollment';
                op.Stage_Type__c = 'Open';
                op.OwnerId = '00G1B0000042dmN';
            }
        }
        //DURING AEP EVERYTHING GETS ROUTED AS USUAL
        else{
        	if(enrollPd == 'Future'){
        		op.Stage__c = 'Open - Future Enrollment';
                op.Stage_Type__c = 'Open';
                op.OwnerId = '00G1B0000042dmN';
        	}
        	else{
            	op.Stage__c = 'Open - Not Assigned';
            	op.Stage_Type__c = 'Open';
        	}
        }
        
        insert op;
        return op.Id;
        
    }
    // --------------------------------------------------------------------------------
    // TELESALES SCRIPTING OPPORTUNITY CHECK
    // --------------------------------------------------------------------------------
    public static String getOpportunityId(Id iLeadOrMember, Id iAgentCall){
        
        String OpportunityId = '';
        
        List<Opportunity__c> lOpps = new List<Opportunity__c>{};
        Boolean O65 = false;
        if(iAgentCall != null){
        	Agent_Call_Session__c acs = [SELECT O65__c from Agent_Call_Session__c where Id = :iAgentCall];
        	if(acs != null){
        		O65 = acs.O65__c;
        	}
        }
        
        
        //LD Update - Difference between Over and Under 65
        if(!O65){
        
            //Determine if it is Open Enrollment for Under 65
            if ( EnrollmentPeriodU65.Active__c ){
                
                lOpps = [Select Id, Enrollment_Period_Date__c
                           from Opportunity__c
                          Where ( (Lead__c = : iLeadOrMember)
                               OR (Member_Contact__c = : iLeadOrMember)
                                )
                            and Stage_Type__c = 'Open'
                            and Type__c = 'Open Enrollment'
                            order by Opportunity__c.Enrollment_Period_Date__c DESC ];
            }
            //Search for any Special Enrollment Open Opportunities
            else{
                lOpps = [Select Id, Enrollment_Period_Date__c
                           from Opportunity__c
                          Where ( (Lead__c = : iLeadOrMember)
                               OR (Member_Contact__c = : iLeadOrMember)
                                )
                            and Opportunity__c.Stage_Type__c = 'Open'
                            and Type__c = 'Special Enrollment'
                            order by Opportunity__c.Enrollment_Period_Date__c DESC ];
            }
        }
        //LD - Find any open opps that match the desired enrollment period (SEP, AEP, IEP, N2M)
        else{
            Agent_Call_Session__c acs = [SELECT Id, Enrollment_Period__c from Agent_Call_Session__c where Id = :iAgentCall];
            lOpps = [Select Id, Enrollment_Period_Date__c
                           from Opportunity__c
                          Where ( (Lead__c = : iLeadOrMember)
                               OR (Member_Contact__c = : iLeadOrMember)
                                )
                            and Opportunity__c.Stage_Type__c = 'Open'
                            and Type__c = :acs.Enrollment_Period__c
                            order by Opportunity__c.Enrollment_Period_Date__c DESC ];
        }
                                            
        if ( lOpps.size() > 0 ){
            OpportunityId = lOpps[0].Id;
        }
        else if(O65){
            OpportunityId = Opportunity.O65TeleOpportunityCreate(iLeadorMember, iAgentCall);
        }
        else{
            Set<Id> sOpportunities = new Set<Id>{ iLeadOrMember };
            Set<Id> sNewOpportunities = Opportunity.checkOpportunity(sOpportunities, iAgentCall);
            
            //Select first Opportunity Id
            for (Id i : sNewOpportunities){
                OpportunityId = i;
                break;
            }
        }                           
        
        return OpportunityId;
        
    }
    
    // --------------------------------------------------------------------------------
    // LEAD CONVERSION METHOD - REPARENTS ALL LEAD RECORDS TO APPLICABLE MEMBER
    // --------------------------------------------------------------------------------
    public static void convertOpportunities(Set<Id> sIds){
        
        Map<Id,Id> mLead2Account = new Map<Id,Id>{};
        Map<Id,Map<Id,HM_Products__c>> mAcctProducts = new Map<Id,Map<Id,HM_Products__c>>{};
        List<Opportunity__c> lUpdate = new List<Opportunity__c>{};
        List<HM_Products__c> lProdUpdate = new List<HM_Products__c>{};
        Set<Id> sAccountIds = new Set<Id>{};
        
        String sOwnerId;
        
        List<Lead> lLead = [Select Id, ConvertedAccountId 
                              from Lead 
                             where Id in : sIds];
        
        
        for (Lead l : lLead){
            mLead2Account.put(l.id,l.ConvertedAccountId);
            sAccountIds.add(l.ConvertedAccountId);
            System.debug('Lead :: ' + l.Id);
            System.debug('Member Account :: ' + l.ConvertedAccountId);
        }
        
        List<Opportunity__c> lLeadOpps = [Select Id, Lead__c, Member_Contact__c, Member_Contact__r.Direct_Pay_Individual__c
                                            from Opportunity__c 
                                           where Lead__c in : sIds];
                                           
        List<Account> lAccounts = [Select Id, (Select Id, Product_Selected__c 
                                                 from HM_Products__r 
                                                where LastModifiedDate = Today
                                               order by Enrollment_Effective_Date__c ASC)
                                    from Account
                                   where Id in : sAccountIds];
        
        if (lLeadOpps.size() == 0) return;
        
        for(Account a: lAccounts){
            Map<Id,HM_Products__c> mHold = new Map<Id,HM_Products__c>{};
            if ( mAcctProducts.get(a.Id) != null){
                mHold = mAcctProducts.get(a.Id);
            }
            
            //Populate Product Map with all the Account Products that were created today
            // Note: This likely will only ever be 1 record but is built for more than 1
            for (HM_Products__c hp : a.HM_Products__r){
                mHold.put(hp.Id,hp);
            }
            if ( mHold != null ){
                mAcctProducts.put(a.Id,mHold);
            }           
            
        }
        
        Set<Id> sHMProducts = new Set<Id>{};
        
        for(Opportunity__c op : lLeadOpps){
            Id iAccount = mLead2Account.get(op.Lead__c);
            if ( iAccount != null){
                op.Member_Contact__c = iAccount;
                //Default to Existing Member Queue
                /*if ( op.Member_Contact__r.Direct_Pay_Individual__c == 'Under 65' ){
                    sOwnerId = EnrollmentPeriodU65.Opportunity_Won_Owner__c;
                }
                else if ( op.Member_Contact__r.Direct_Pay_Individual__c == 'Over 65' ){
                    sOwnerId = EnrollmentPeriodO65.Opportunity_Won_Owner__c;
                }
                if ( sOwnerId != null ){
                    op.OwnerId = sOwnerId;
                }*/               
               /* if ( mAcctProducts.get(iAccount) != null){
                    HM_Products__c hp = new HM_Products__c();
                    Map<Id,HM_Products__c> mHold = new Map<Id,HM_Products__c>{};
                    mHold = mAcctProducts.get(iAccount);
                    
                    for (Id i : mHold.keyset()){
                        hp = mHold.get(i);
                        if ( hp != null ){
                            //This logic needs expanded to check the product to determine short term vs open enrollment
                            op.Stage__c = 'Closed - Converted';
                            op.Stage_Type__c = 'Closed/Won';
                            op.Product__c = hp.Id;
                            hp.New_Today__c = false;
                            //Prevent Product from being updated more than 1x
                            if (! sHMProducts.contains(hp.Id) ){
                                lProdUpdate.add(hp);
                                sHMProducts.add(hp.Id);
                            }
                            //Break out of inner loop
                            //Only will process first product until a XREF can be built
                            break;
                        }
                    }
                }
                lUpdate.add(op);
            }                       
        }
        
        if (lUpdate.size() > 0) update lUpdate;
        if (lProdUpdate.size() > 0) update lProdUpdate;    
    
    }
    
    // --------------------------------------------------------------------------------
    // SEND EMAIL TEMPLATES - JEH 7/17/17
    // --------------------------------------------------------------------------------
    
    public static void sendTemplate(String ids, String opid){ 
        
        system.debug('THIS IS SELECTED------------->' + ids);
        system.debug('THIS IS THE RECORD ID-------------->' + opid);
        
        EmailTemplate emailTemplatebody = [Select id, subject, body from EmailTemplate where id=: ids];
                                           
        Opportunity__c lOp = [Select Id, Name, Lead__c, Member_Contact__c
                from Opportunity__c where id = : opid]; 
              
         if(lOp.Member_Contact__c != null){
            Account a = [Select id, FirstName, LastName, PersonEmail, OpportunityEmailPermission__c From Account where id =:lOP.Member_Contact__c];
            Contact c = [Select id, FirstName, LastName, email from Contact where Accountid =: a.Id];
            if(a.OpportunityEmailPermission__c == true){
            //User u = [Select id, email, FirstName From User where alias=: 'dtemp'];
            system.debug('----------->' + a.FirstName);
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();  
            message.setTemplateId(emailTemplatebody.Id);
            //message.setToAddresses(new List<String>{a.personemail});
            message.setTargetObjectId(c.id); 
            message.saveAsActivity = false; 
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { message }); 
            }
         }
         
         if(lOp.Lead__c != null){ 
            Lead l = [Select id, FirstName, LastName, Email, OpportunityEmailPermission__c From Lead where id=: lOP.Lead__c]; 
            if(l.OpportunityEmailPermission__c == true){
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.setTemplateId(emailTemplatebody.Id);
            message.setTargetObjectId(l.Id); 
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { message });
            }
         }
 
    }
    
    public static void unsubscribeTemplate(String contactid, String leadid){
        system.debug('THIS IS THE RECORD ID-------------->' + contactid);
        system.debug('THIS IS THE RECORD ID-------------->' + leadid);                                   
        /*Opportunity__c lOp = [Select Id, Name, Lead__c, Member_Contact__c
                //from Opportunity__c where id = : opid];
        
         if(lOp.Member_Contact__c != null){
            Account a = [Select id, FirstName, LastName, PersonEmail, OpportunityEmailPermission__c From Account where id =:lOP.Member_Contact__c];
            a.OpportunityEmailPermission__c = false;
            update a;
         }
         
         if(lOp.Lead__c != null){ 
            Lead l = [Select id, FirstName, LastName, Email, OpportunityEmailPermission__c From Lead where id=: lOP.Lead__c]; 
            l.OpportunityEmailPermission__c = false;
            update l;
         }*/
         
         /*if(contactid != null && contactid != ''){
             Contact c = [SELECT AccountId from Contact where Id = :contactid];
             Account a = [Select id, FirstName, LastName, PersonEmail, OpportunityEmailPermission__c From Account where id =:c.AccountId];
             a.OpportunityEmailPermission__c = false;
             update a;
         }
         
         if(leadid != null && leadid != ''){ 
            Lead l = [Select id, FirstName, LastName, Email, OpportunityEmailPermission__c From Lead where id=: leadid]; 
            l.OpportunityEmailPermission__c = false;
            update l;
         }
    }
    
    // --------------------------------------------------------------------------------
    // GET CURRENT USER INFORMATION
    // --------------------------------------------------------------------------------
    public static User getCurrentUser(){
        
        if (knownUser){
            return u; 
        }
        else{
            u = [Select Id, Retail_Store__c, System_User__c, Name, Profile.Name from User where Id =: UserInfo.getUserId()];
            
            sQueueIdCheck = HM_Queue_Utils.getQueueId(u.Retail_Store__c);
                        
            knownUser = true;
            return u;
            */
        }