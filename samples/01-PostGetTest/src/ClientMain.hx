import restclient.RestClient;
#if sys
import Sys;
#end

class ClientMain
{
	static function testSync()
	{
		trace("Testing sync");
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
	}
	
	static function testAsync()
	{
		trace("Testing async");
		var inParams = new Map<String, String>();
        inParams.set("key", "test");
        inParams.set("value", "asdf");
        RestClient.postAsync(
            "http://localhost:8000",
			function(result)
			{
				trace("POST returned");
			},
            inParams);
        
        var outParams = new Map<String, String>();
        outParams.set("key", "test");
        RestClient.getAsync(
            "http://localhost:8000",
			function(result)
			{
				trace("Returned from server: " + result);
			},
            outParams);
	}
	
    static function main()
    {
		testSync();
		testAsync();
#if sys
		trace("Press Enter to close the client...");
        Sys.stdin().readLine();
#end
    }
}