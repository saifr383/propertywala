import 'package:flutter/material.dart';

class Amenitiess extends StatefulWidget {
  @override
  AmenitiessState createState() => AmenitiessState();
}

class AmenitiessState extends State<Amenitiess> {
  List<bool> val = [false, false, false, false, false, false];
  List<bool> vals = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Text(
              'External Facilities',
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Semibold"),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 30),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            click(0);
                          },
                          child: kMenus(
                              "assets/images/garden.png", "Garden", val[0]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            click(1);
                          },
                          child: kMenus("assets/images/parking.png",
                              "Car Prking", val[1]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            click(2);
                          },
                          child: kMenus(
                              "assets/images/swim.png", "Swimming", val[2]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            click(3);
                          },
                          child: kMenus("assets/images/playground.png",
                              "Play Area", val[3]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            click(4);
                          },
                          child: kMenus("assets/images/gym.png", "GYM", val[4]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            click(5);
                          },
                          child: kMenus(
                              "assets/images/balcony.png", "Balcony", val[5]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'Internal Facilities',
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontFamily: "Semibold"),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click2(0);
                            },
                            child: kMenus("assets/images/computer.png",
                                "Computer", vals[0])),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            click2(1);
                          },
                          child: kMenus("assets/images/microwave.png",
                              "Micro Ovan", vals[1]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            click2(2);
                          },
                          child: kMenus("assets/images/tv.png", "TV", vals[2]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click2(3);
                            },
                            child: kMenus(
                                "assets/images/wifi.png", "Wi Fi", vals[3])),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            click2(4);
                          },
                          child: kMenus("assets/images/ac.png", "AC", vals[4]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                            onTap: () {
                              click2(5);
                            },
                            child: kMenus("assets/images/fireplace.png",
                                "Fireplace", vals[5])),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  Widget kMenus(String image, String name, bool val) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: new BorderRadius.all(new Radius.circular(5))),
        margin: EdgeInsets.all(0.5),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "" + image,
                    width: 30,
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      '' + name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Regular",
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Checkbox(
                value: val,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (bool value) {
                  setState(() {
                    val = value;
                  });
                },
              ),
            ),
          ],
        ));
  }

  void click(int i) {
    setState(() {
      if (val[i] == true) {
        val[i] = false;
      } else {
        val[i] = true;
      }
    });
  }

  void click2(int i) {
    setState(() {
      if (vals[i] == true) {
        vals[i] = false;
      } else {
        vals[i] = true;
      }
    });
  }
}
