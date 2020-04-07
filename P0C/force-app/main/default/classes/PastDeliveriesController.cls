public class PastDeliveriesController
{
    public List<Mail__c> deliveredMailList { public get; private set; }
    
    public PastDeliveriesController()
    {
        deliveredMailList = new List<Mail__c>();
    }
    
	public void GetPastDeliveries()
    {
        deliveredMailList = [SELECT Name, Address__c, DeliveryStatus__c FROM Mail__c WHERE DeliveryStatus__c = 'DELIVERED'];
        
        //System.debug(deliveredMailList);
    }
}