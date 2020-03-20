public class TriggerHelperClass {

    public static void Helper(List<Contact> contacts){
        List<Account> accList = [SELECT Id,Name,Phone FROM Account];
    
        for(Contact c:contacts){
            
            for(Account acc:accList){
                         
                if(c.AccountId==null){
    
                    string contactName = c.LastName;
    
                     if(contactName == acc.Name && c.Phone == acc.Phone){
       
                        c.AccountId = acc.Id;
    					break;
              
                    } 
                }
                    
            }
        }

    }
}