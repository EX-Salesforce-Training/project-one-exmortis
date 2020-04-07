public class PastDeliveriesController
{
    public List<Mail__c> deliveredMailList { public get; private set; }
    
    public Boolean previousButtonIsDisabled { public get; private set; }
    public Boolean nextButtonIsDisabled { public get; private set; }
    
    private Integer currentOffset;
    
    private static final Integer DISPLAY_LIMIT = 5;
    
    public PastDeliveriesController()
    {
        deliveredMailList = new List<Mail__c>();
        
        previousButtonIsDisabled = true;
        nextButtonIsDisabled = false;
        
        currentOffset = 0;
    }
    
	public void GetPastDeliveries()
    {
        deliveredMailList = [SELECT Name, Address__c, DeliveryStatus__c FROM Mail__c WHERE DeliveryStatus__c = 'DELIVERED' 
                             LIMIT :DISPLAY_LIMIT OFFSET :currentOffset];
        
        //System.debug(deliveredMailList);
    }
    
    public void PreviousPage()
    {
        nextButtonIsDisabled = false;
        
        if (currentOffset != 0)
        {
            currentOffset -= DISPLAY_LIMIT;
        }
        
        GetPastDeliveries();
        
        if (currentOffset == 0 || deliveredMailList.size() == 0)
        {
            previousButtonIsDisabled = true;
        }
    }
    
    public void NextPage()
    {
        previousButtonIsDisabled = false;
        
        currentOffset += DISPLAY_LIMIT;
        
        GetPastDeliveries();
        
        if (deliveredMailList.size() < DISPLAY_LIMIT || deliveredMailList.size() == 0)
        {
            nextButtonIsDisabled = true;
        }
    }
}