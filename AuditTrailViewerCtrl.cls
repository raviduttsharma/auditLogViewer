public class AuditTrailViewerCtrl {
    
    @AuraEnabled(cacheable = true)
    public static SetupAuditTrailInfo getRecords(Integer queryLimit, Integer queryOffset) {
        return new SetupAuditTrailInfo([SELECT count() FROM SetupAuditTrail],
        [SELECT Action, CreatedBy.Name, Display, Section, CreatedDate 
                FROM SetupAuditTrail 
                ORDER BY CreatedDate DESC 
                LIMIT :queryLimit 
                OFFSET :queryOffset]);
    }
    
    public class SetupAuditTrailInfo{

        @AuraEnabled
        public Integer totalRecordCount {get;set;}

        @AuraEnabled
        public List<SetupAuditTrail> auditTrailRecords{get;set;}

        public SetupAuditTrailInfo(Integer totalRecordCount, List<SetupAuditTrail> auditTrailRecords){
            this.totalRecordCount = totalRecordCount;
            this.auditTrailRecords = auditTrailRecords;
        }
    }

}