import restclient.RestClient;
#if sys
import Sys;
#end

class ClientMain
{
    static function main()
    {
        var inParams = new Map<String, String>();
        inParams.set("key", "test");
        inParams.set("value", "asdf");
        RestClient.post(
            "http://localhost:8000",
            inParams);
        
        var outParams = new Map<String, String>();
        outParams.set("key", "test");
        var result = RestClient.get(
            "http://localhost:8000",
            outParams);
            
        trace("Returned from server: " + result);
        
        trace("Press Enter to close the client...");
#if sys
        Sys.stdin().readLine();
#end
    }
}