import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myyaowrealtorfltheme/backend/models/user.dart';
import 'package:myyaowrealtorfltheme/publics/agent_detail/tab1.dart';
import 'package:myyaowrealtorfltheme/publics/agent_detail/tab2.dart';
import 'package:myyaowrealtorfltheme/publics/agent_detail/tab3.dart';

class TabbarViews extends StatelessWidget {
  final UserModel userModel;

  TabbarViews(this.userModel);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Tab1(),
        // Tab2(userModel),
        Tab3()
      ],
    );
  }
}
