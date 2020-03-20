public class AccountSearchController{

    public string strAccSearchString {get; set;}

    public List<Account> lstAccount {get; set;}

    public boolean isResultDisplay {get; set;}

     

    //  constructor

    public AccountSearchController(){

        lstAccount = new List<Account>();

        isResultDisplay = false;

    }

     

    //  Search Function

    public void SearchAccountRec(){

        isResultDisplay = true;

        string strLikeString = '%'+strAccSearchString+'%';

        string strSOQL = 'select id,Name from Account where name LIKE: strLikeString order by Name asc';

        lstAccount = database.query(strSOQL);

    }

}