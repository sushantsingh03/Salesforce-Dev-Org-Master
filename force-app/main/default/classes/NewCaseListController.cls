public class NewCaseListController {
    
    public List<Case> getNewCases()
    {
        List<Case> caseList = [Select id, CaseNumber from Case where Status='New'];
        return CaseList;
    }

}