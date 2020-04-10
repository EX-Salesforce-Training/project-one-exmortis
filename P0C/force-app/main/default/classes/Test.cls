public class Test {
    public static void run(){
        Contact c = [SELECT ID, Name FROM Contact WHERE ID = '003P000001L6G2dIAF'];
        
        System.Debug(c);
    }
}