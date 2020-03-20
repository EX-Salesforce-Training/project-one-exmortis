@isTest
public class TestTrigger {
	
    @isTest
    public static void Test1(){
        
        Test.startTest();
        
        Contact c = new Contact();
        Account acc = new Account();
        
        c.LastName = 'Hulk';
        c.Phone = '(787)858-9595';
        
        acc.Name = 'Hulk';
        acc.Phone = '(787)858-9595';
        
        insert acc;
        insert c;

        Contact ca = [SELECT Id,Name,Phone,AccountId FROM Contact WHERE Id=:c.Id];
        Account a = [SELECT Id,Name,Phone FROM Account WHERE Id=:acc.Id];
        
		System.assertNotEquals(null, ca);
        System.assertNotEquals(null, a);
   
        System.assertEquals(a.Id, ca.AccountId);
        
        Test.stopTest();
    }
}