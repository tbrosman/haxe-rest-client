package restclient;

import haxe.Http;

/**
 * ...
 * @author TABIV
 */
class RestClient
{
	public function new() 
	{
	}
	
	public static function post(url:String, parameters:Hash<String> = null, onData:String->Void = null, onError:String->Void = null):Void
	{
		var r = buildHttpRequest(url, parameters, onData, onError);
		r.request(true);
	}
	
	public static function get(url:String, parameters:Hash<String> = null, onData:String->Void = null, onError:String->Void = null):Void
	{
		var r = buildHttpRequest(url, parameters, onData, onError);
		r.request(false);
	}
	
	private static function buildHttpRequest(url:String, parameters:Hash<String> = null, onData:String->Void = null, onError:String->Void = null):Http
	{
		var r = new Http(url);
		
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