public class CaseDisplayController {
	public Case caseValue {get;set;} 
    public List<Case> caseList {get;set;}
   
    public CaseDisplayController(){
        caseValue = New Case(Priority = 'High');
    }
    public void generateCaseList(){
         caseList = [SELECT id, Subject FROM Case WHERE Priority = :caseValue.Priority];
    }
}