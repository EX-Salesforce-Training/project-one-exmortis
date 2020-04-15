public class ValidateMailID {
	@InvocableMethod(label='Is tring valid' description = 'Returns')
    public static List<String> isValid(List<String> ids){
        
        Id validId;
        Boolean result = false;

        try {
        
        validId = ids[0];
        
        result = true;
        
        } catch (Exception ex) {
        
        result = false;
        
        }
        
        if(!result){
            return null;
        }
        
        return ids;
    }
}