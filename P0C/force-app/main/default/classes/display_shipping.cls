public class display_shipping {
    private integer off = 0;

    public boolean nextbutton{get;private set;}
    public boolean prebutton{get;private set;}

    public Mail__c Mailstatus{get;set;}
    public list<Mail__c> maillist{get;set;}
    public display_shipping(){
       
        Mailstatus = new Mail__c(deliveryStatus__c = 'in transit');
        nextButton = false;
        prebutton = true;
    }
    public void showMail(){
        maillist = [ select id,name from Mail__c where deliveryStatus__c =:Mailstatus.deliveryStatus__c limit 5 OFFSET: off];
    }
    public void nextpage(){
        off+=5;
        showMail();
        prebutton = false;
        if(MailList.size()<5 || maillist.size() == 0){
            nextbutton = true;
        }
    }
    public void previouspage(){
        if(off != 0){
            off -= 5;
        }
        nextbutton = false;
        showMail();
        if(MailList.size() == 0 || off ==0){
            prebutton = true;
            
        }
    }
}