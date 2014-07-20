# Haxe rest-client
A REST-ish wrapper around Haxe's built-in HTTP functionality

## Motivation
This library grew out of a logging client I created for another Haxe project. I could not find an existing haxelib that handled REST client functionality (most likely because Haxe's HTTP library is missing so much) so I threw together my own.

I am aware of haxe.web.Dispatch but find it cumbersome for free-form REST calls (a good discussion about this can be found [here](https://groups.google.com/forum/#!topic/haxelang/eQtf--1_tpo)).

## Features

Both synchronous and asynchronous requests are supported (with some restrictions depending on platform, see below).

The interface is designed to be clean and readable as well as symmetric between sync and async requests:

```
    var result = RestClient.get(
        "http://localhost:8000/item/1",
        ["testParam" => "asdf"]);
    trace(result;

    var result = RestClient.getAsync(
        "http://localhost:8000/item/1",
        function(result)
        {
            trace(result);
        }
        ["testParam" => "asdf"]);
```

## Platforms
This has been tested on Neko, Flash, and CPP (on Android) targets. Flash is the only platform (that I know of) that doesn't support some form of synchronous requests/sockets. For all other platforms Http.customRequest is used.

If you find any issues using this library with your platform of choice, feel free to open an issue/make a pull request.

## Limitations
* Currently only GET and POST are supported (similar to Http.request, which is used in cases where sys is not available).

## Future
* SSL support
* More verbs
* Unit tests for more platforms
