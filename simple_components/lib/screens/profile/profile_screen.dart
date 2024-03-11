import 'package:flutter/material.dart';
import 'package:simple_components/screens/profile/widgets/payments.dart';
import 'package:simple_components/screens/profile/widgets/user_details.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              UserDetails(),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text("Account details")),
                    Payments(),
                    Center(
                        child: Text(
                          "History details",
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}