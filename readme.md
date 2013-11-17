# Haxe restclient
A REST-ish wrapper around Haxe's built-in HTTP functionality

## Motivation
This library grew out of a logging client I created for another Haxe project. I could not find an existing haxelib that handled REST client functionality (most likely because Haxe's HTTP library is missing so much) so I threw together my own.

I am aware of haxe.web.Dispatch but find it cumbersome for free-form REST calls (a good discussion about this can be found [here](https://groups.google.com/forum/#!topic/haxelang/eQtf--1_tpo)).

## Limitations
* Async operations only
* GET and PUT verbs are the only ones supported

## Future
* Address the above limitations
* Haxe 3 support
