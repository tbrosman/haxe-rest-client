import restclient.RestClient;
import neko.Sys;

class ClientMain
{
    static function main()
    {
        var inParams = new Hash<String>();
        inParams.set("key", "test");
        inParams.set("value", "asdf");
        RestClient.post("http://localhost:8000", inParams);
        
        var outParams = new Hash<String>();
        outParams.set("key", "test");
        var result = RestClient.get(
            "http://localhost:8000",
            outParams);
            
        Sys.println("Returned from server: " + result);
        
        Sys.println("Press Enter to close the client...");
        Sys.stdin().readLine();
    }
}