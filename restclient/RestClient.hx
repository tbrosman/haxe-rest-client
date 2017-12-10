package restclient;

import haxe.Http;
import haxe.io.BytesOutput;

/**
 * ...
 * @author TABIV
 */
class RestClient
{
    public static function postAsync(url:String, onData:String->Void = null, parameters:Map<String, String> = null, onError:String->Void = null):Void
    {
        var httpRequest:Http = RestClient.buildHttpRequest(
            url,
            parameters,
            true,
            onData,
            onError);
        httpRequest.request(true);
    }
    
    // No synchronous requests/sockets on Flash
    #if !flash
    public static function post(url:String, parameters:Map<String, String> = null, onError:String->Void = null):String
    {
        var result:String;
        var httpRequest:Http = RestClient.buildHttpRequest(
            url,
            parameters,
            false,
            function(data:String)
            {
                result = data;
            },
            onError);

        // Use the existing http.request only if sys isn't present
        #if sys
            return makeSyncRequest(httpRequest, "POST");
        #else
            httpRequest.request(true);
            return result;
        #end
    }
    #end
    
    public static function getAsync(url:String, onData:String->Void = null, parameters:Map<String, String> = null, onError:String->Void = null):Void
    {
        var httpRequest:Http = RestClient.buildHttpRequest(
            url,
            parameters,
            true,
            onData,
            onError);
        httpRequest.request(false);
    }
    
    // No synchronous requests/sockets on Flash
    #if !flash
    public static function get(url:String, parameters:Map<String, String> = null, onError:String->Void = null):String
    {
        var result:String;

        var httpRequest:Http = RestClient.buildHttpRequest(
            url,
            parameters,
            false,
            function(data:String)
            {
                result = data;
            },
            onError);
        
        // Use the existing http.request only if sys isn't present
        #if sys
            return makeSyncRequest(httpRequest, "GET");
        #else
            httpRequest.request(false);
            return result;
        #end
    }
    #end
    
    #if sys
    private static function makeSyncRequest(httpRequest:Http, method:String = "GET"):String
    {
        // TODO: SSL for HTTPS URLs
        var output = new BytesOutput();
        httpRequest.customRequest(false, output, null, method);
        return output.getBytes()
            .toString();
    }
    #end
    
    private static function buildHttpRequest(url:String, parameters:Map<String, String> = null, async:Bool = false, onData:String->Void = null, onError:String->Void = null):Http
    {
        var httpRequest = new Http(url);
            
        #if js
        httpRequest.async = async;
        #end
        
        if (onError != null)
        {
            httpRequest.onError = onError;
        }
        
        if (onData != null)
        {
            httpRequest.onData = onData;
        }
        
        if (parameters != null)
        {
            for (x in parameters.keys())
            {
                httpRequest.setParameter(x, parameters.get(x));
            }
        }
        
        return httpRequest;
    }
}