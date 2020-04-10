public class display_pastcase {
    
    public case pastcase{get;set;}
    public list<case> pastcaselist{get;set;}
    public list<case> pastcaselist1{get;set;}
    private integer off = 0;
    public boolean nextbutton{get;private set;}
    public boolean prebutton{get;private set;}
    
	public display_pastcase(){
        pastcase = new Case(status = 'Closed');
        nextButton = false;
        prebutton = true;
    }
    public void displaycase(){
        pastcaselist = [select status ,id,ClosedDate from case where status =:pastcase.Status limit 5 offset: off];
    }
    public void displaypastmonth(){
        pastcaselist1 = [select closedDate from case where closedDate < LAST_MONTH limit 5 offset: off];
    }
    public void nextpage(){
        off+=5;
        displaycase();
        prebutton = false;
        if(pastcaselist.size()<5 || pastcaselist.size() == 0){
            nextbutton = true;
        }
    }
    public void previouspage(){
        if(off != 0){
            off -= 5;
        }
        nextbutton = false;
        displaycase();
        if(pastcaselist.size() == 0 || off ==0){
            prebutton = true;
            
        }
    }
    
    
}