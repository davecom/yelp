library yelp;

import "package:oauth/oauth.dart";
import "package:http/src/response.dart";
import "package:http/browser_client.dart";
import "dart:async";
import "dart:convert";

class Yelp {
  Client _client;
  
  Yelp(String consumerKey, String consumerSecret, String userKey, String userSecret, [bool fromBrowser = false]) {
    if (fromBrowser) {
      var browserClient = new BrowserClient();
      _client = new Client(new Token(consumerKey, consumerSecret), client: browserClient, userToken: new Token(userKey, userSecret));
    } else {
      _client = new Client(new Token(consumerKey, consumerSecret), userToken: new Token(userKey, userSecret));
    }
  }
  
  Future<Map> search({String term: "", String location: ""}) {
    String url = "http://api.yelp.com/v2/search";
    Map header = {"term": term, "location":location};
    return _client.get(url, headers: header).then((Response onValue) {
      return JSON.decode(onValue.body);
    });
  }
}