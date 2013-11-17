// nekotools server -p 8000 -h localhost -d ..\bin
// Adapted from http://haxe.org/manual/dispatch
import neko.Web;
import neko.Lib;

class Index
{
    static var cache = new Hash<String>();
    
    static function main()
    {
        // Don't restart the module for each request
        Web.cacheModule(run);
        run();
    }
    
    static function run()
    {
        var params = Web.getParams();
        var method = Web.getMethod();
        
        var key = params.get("key");
        
        if (key == null)
        {
            return;
        }
    
        if (method == "GET")
        {
            var value = cache.get(key);
            
            if (value == null)
            {
                return;
            }
            
            Lib.print(value);
        }
        else if (method == "POST")
        {
            var value = params.get("value");
            cache.set(key, value);
        }
    }
}