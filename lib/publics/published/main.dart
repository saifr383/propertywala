import 'package:flutter/material.dart';
import 'package:myyaowrealtorfltheme/publics/property_detail/main.dart';

class Published extends StatefulWidget {
  Published({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PublishedState createState() => _PublishedState();
}

class _PublishedState extends State<Published> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF265229),
          title: Text(
            'PUBLISHED',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Semibold',
              fontSize: 14,
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/tick.png',
              height: 80,
              width: 80,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Congratulations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Semibold',
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Your property has been published',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Regular',
                  fontSize: 14,
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: <Widget>[

                InkWell(
                  child:   Container(
                    width: 200,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        color: Color(0xFFFCC300),
                        borderRadius: new BorderRadius.circular(5.0)),
                    padding:
                    EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.pageview,
                          color: Colors.black,
                          size: 25,
                        ),
                        Text(
                          '  PREVIEW  ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Regular"),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.pop(context, false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PropertyDetail()),
                    );
                  },
                )
              ],
            ),
          ],
        ));
  }

}
