package restclient;

import haxe.Http;

/**
 * ...
 * @author TABIV
 */
class RestClient
{
    public static function post(url:String, parameters:Map<String, String> = null, onError:String->Void = null):String
    {
        var result:String;
        var r = buildHttpRequest(
            url,
            parameters,
            function(data:String)
            {
                result = data;
            },
            onError);
        r.request(true);
        
        return result;
    }
    
    public static function get(url:String, parameters:Map<String, String> = null, onError:String->Void = null):String
    {
        var result:String;
        var r = buildHttpRequest(
            url,
            parameters,
            function(data:String)
            {
                result = data;
            },
            onError);
        r.request(false);
        
        return result;
    }
    
    private static function buildHttpRequest(url:String, parameters:Map<String, String> = null, onData:String->Void = null, onError:String->Void = null):Http
    {
        var r = new Http(url);
        
        #if js
        r.async = false;
        #end
        
        if (onError != null)
        {
            r.onError = onError;
        }
        
        if (onData != null)
        {
            r.onData = onData;
        }
        
        if (parameters != null)
        {
            for (x in parameters.keys())
            {
                r.setParameter(x, parameters.get(x));
            }
        }
        
        return r;
    }
}