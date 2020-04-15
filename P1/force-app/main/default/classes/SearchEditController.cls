public class SearchEditController {
    
// 
    public Account acct {get;set;}
   
// 
    public List<Contact> cont {get;set;}
    public String name {get;set;}
    public String phone {get;set;}
    public String Street {get;set;}
    public String city {get;set;}
    public String state {get;set;}
    public String country {get;set;}
    public String postalCode {get;set;}
    public String s {get;set;}

    public SearchEditController() {
        acct = new Account();
        cont = new List<Contact>();      
    }
    
    
    public void findAccount() {
        s = '%' + s + '%';
        	acct = [SELECT Name, Phone, ID, ShippingStreet, ShippingCity, ShippingState, ShippingCountry, ShippingPostalCode, (SELECT FirstName,LastName, Email, ID FROM Contacts) FROM Account WHERE name LIKE: s LIMIT 1];
       	
        System.debug(acct);
    	System.debug(acct.Contacts.size());
        cont = new List<Contact>();
       
        for(Integer i = 0; i < acct.Contacts.Size();i++) {   
           Contact c = acct.Contacts[i];
            c.FirstName = c.FirstName;
            c.LastName = c.LastName;
            c.Email = c.Email;
           cont.add(c);
			                     
        }
		       
        	system.debug(cont);
 
    }
  
    public void upateAccountName() {
        
        if(name != null && name != ' ') {
        acct.Name = name;
        }
        if(phone != null && phone != ' ') {
        acct.Phone = phone;
        }
        if(street != null && street != ' ') {
        acct.ShippingStreet = street;
        }
        if(city != null && city != ' ') {
        acct.ShippingCity = city;
        }
        if(country != null && country != ' ') {
        acct.ShippingCountry = country;
        }
        if(state != null && state != ' ') {
        acct.ShippingState = state;
        }
        if(postalCode != null && PostalCode != ' ') {
        acct.ShippingPostalCode = postalCode;
        }
        
			update acct;
         
	}
}