public class PDFFileMergeService {
    @AuraEnabled(cacheable=true)
    public static List<Map<String, String>> getPdfFilesWithIdsAsBase64(Id opportunityId) {
        
        List<ContentDocumentLink> contentDocumentLinks = [
            SELECT ContentDocumentId, LinkedEntityId
            FROM ContentDocumentLink
            WHERE LinkedEntityId = :opportunityId
        ];
        
        // Collect all content document IDs from the links
        Set<Id> contentDocumentIds = new Set<Id>();
        for (ContentDocumentLink cdl : contentDocumentLinks) {
            contentDocumentIds.add(cdl.ContentDocumentId);
        }
        
        // Find all content versions based on the content document IDs
        List<ContentVersion> contentVersions = [
            SELECT ContentDocumentId, VersionData, CreatedDate
            FROM ContentVersion
            WHERE ContentDocumentId IN :contentDocumentIds
            ORDER BY CreatedDate DESC
        ];
        
        // Map content document ID to its content versions
        Map<Id, List<ContentVersion>> documentVersionsMap = new Map<Id, List<ContentVersion>>();
        for (ContentVersion version : contentVersions) {
            if (!documentVersionsMap.containsKey(version.ContentDocumentId)) {
                documentVersionsMap.put(version.ContentDocumentId, new List<ContentVersion>());
            }
            documentVersionsMap.get(version.ContentDocumentId).add(version);
        }
        
        // Prepare the list of files with their IDs and base64 data
        List<Map<String, String>> pdfFilesWithIds = new List<Map<String, String>>();
                    List<ContentVersion> allVersionsForQuote = new List<ContentVersion>();
                    for (ContentDocumentLink link : contentDocumentLinks) {
                        if (link.LinkedEntityId == opportunityId && documentVersionsMap.containsKey(link.ContentDocumentId)) {
                            allVersionsForQuote.addAll(documentVersionsMap.get(link.ContentDocumentId));
                        }
                    }
                    allVersionsForQuote.sort();
                    
                    for (ContentVersion version : allVersionsForQuote) {
                        Map<String, String> pdfData = new Map<String, String>();
                        pdfData.put('ContentDocumentId', version.ContentDocumentId);
                        pdfData.put('Base64Data', EncodingUtil.base64Encode(version.VersionData));
                        pdfFilesWithIds.add(pdfData);
                    }
                
        return pdfFilesWithIds;
    }
}