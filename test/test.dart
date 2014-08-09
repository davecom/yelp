import "package:yelp/yelp.dart";

void main() {
  Yelp y = new Yelp("8SW4Une68aTlchcfOmFSRA", "_j_-Oac6Qr2XjUI0edxfbK0P4k4", "9XpJAyl8WsljuLFyBeH-igf2sujHk0Ag", "N9h5Tg1KcvP2Qb-GbUAFbCTRIhM");
  y.search(term: "Italian", location: "11566").then((Map answer){
    print(answer);
  });
}