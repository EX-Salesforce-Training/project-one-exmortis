public class display_shipping {
    private integer off = 0;
    private boolean nextbutton{get;set;}
    public Mail__c Mailstatus{get;set;}
    public list<Mail__c> maillist{get;set;}
    public display_shipping(){
        Mailstatus = new Mail__c(deliveryStatus__c = 'missing');
    }
    public void showMail(){
        maillist = [ select id from Mail__c where deliveryStatus__c =:Mailstatus.deliveryStatus__c limit 5 OFFSET: off];
    }
    public void nextpage(){
        off+=5;
        showMail();
        if(MailList.size()<5){
            nextbutton = true;
        }
    }
}