# Phriak
Phriak is a Smalltalk client for the [Riak NoSQL database](http://basho.com/riak/) (primarily for [Pharo Smalltalk](http://pharo.org/)).

This is a GitHub mirror of [Phriak's SmalltalkHub Monticello repository](http://smalltalkhub.com/#!/~gokr/Phriak).

Phriak started as a friendly fork from Runar's original EpigentRiakInterface. Riak is a screamingly cool NoSQL database that scales like crazy. This Riak interface implementation uses Zinc HTTP and the JSON package.

## Installing the Package
The easiest way to load it into a Pharo 2.0+ image is via Metacello:

```smalltalk
(ConfigurationOfPhriak project version: '0.7') load
```
