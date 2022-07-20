import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myyaowrealtorfltheme/backend/models/user.dart';
import 'package:myyaowrealtorfltheme/publics/agent_detail/tab1.dart';
import 'package:myyaowrealtorfltheme/publics/agent_detail/tab2.dart';
import 'package:myyaowrealtorfltheme/publics/agent_detail/tab3.dart';

class AgentDetail extends StatefulWidget {
  AgentDetail(this.userModel,{Key key, this.title,}) : super(key: key);
  final String title;
  final UserModel userModel;

  @override
  _AgentDetailState createState() => _AgentDetailState();
}

class _AgentDetailState extends State<AgentDetail> {
  List data;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xFF265229),
          statusBarIconBrightness: Brightness.light),
    );
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  backgroundColor: Color(0xFF265229),
                  expandedHeight: 270.0,
                  floating: false,
                  pinned: true,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 25),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: kHeader(context),
                    collapseMode: CollapseMode.parallax,
                  ),
                  bottom: TabBar(
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.white,
                      isScrollable: false,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Color(0xFFFCC300),
                      labelStyle:
                          TextStyle(fontFamily: 'Semibold', fontSize: 12),
                      unselectedLabelStyle:
                          TextStyle(fontFamily: 'Regular', fontSize: 11),
                      tabs: [
                        Tab(
                          child: Text(
                            'Intro',
                          ),
                        ),
                        Tab(
                          child: Text('Contact'),
                        ),
                        Tab(
                          child: Text(
                            'Message',
                          ),
                        ),
                      ])),
            ];
          },
          body: TabBarView(
            // children: [Tab1(), Tab2(widget.userModel), Tab3()],
          ),
        ),
      ),
    );
  }
}

Widget kHeader(BuildContext context) {
  return Container(
    color: Color(0xFF265229),
    height: 250,
    width: double.infinity,
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/face.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black54,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 0,
              ),
              onPressed: () => Navigator.of(context)
                ..pop()
                ..pushNamed("/Home"),
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 100.0,
              height: 100.0,
              margin: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                color: const Color(0xff7c94b6),
                image: new DecorationImage(
                  image: new NetworkImage(
                    'https://images.unsplash.com/photo-1489779162738-f81aed9b0a25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: new BorderRadius.all(new Radius.circular(80.0)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 3),
              child: Text(
                'Kent Parker',
                style: TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: "Semibold"),
              ),
            ),
            Text(
              'Liverpool, United Kingdom',
              style: TextStyle(
                  color: Colors.white70, fontSize: 12, fontFamily: "Regular"),
            )
          ],
        )
      ],
    ),
  );
}
