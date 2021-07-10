import 'package:flutter/material.dart';
import 'package:munis_pal/Providers/UserClass.dart';
import 'package:munis_pal/Screens/Insides/AnnouncementDetail.dart';
import 'package:munis_pal/Screens/Insides/Announcements.dart';
import 'package:munis_pal/Screens/Insides/ComplaintScreen.dart';
import 'package:munis_pal/Screens/Insides/SelectCategory.dart';
import 'package:munis_pal/Screens/Insides/TicketDetails.dart';
import 'package:munis_pal/Screens/Insides/TicketStatus.dart';
import 'package:provider/provider.dart';
import 'package:munis_pal/Screens/Insides/HomePage_Screen.dart';
import 'package:munis_pal/Screens/Registration/Login_Screen.dart';
import 'package:munis_pal/Screens/Registration/Signup_Screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
void main() => runApp(MunisPal());


class MunisPal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>MunisData(),
      child: MaterialApp(
        home: IntroScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          SignupScreen.routeName:(ctx)=>SignupScreen(),
          LoginScreen.routeName:(ctx)=>LoginScreen(),
          HomeScreen.routeName:(ctx)=>HomeScreen(),
          TicketDetailsScreen.routeName: (ctx)=>TicketDetailsScreen(),
          TicketStatus.routeName:(ctx)=>TicketStatus(),
          AnnouncementScreen.routeName:(ctx)=>AnnouncementScreen(),
          AnnounceScreenDetail.routeName:(ctx)=>AnnounceScreenDetail(),
          ComplaintScreen.routeName:(ctx)=>ComplaintScreen(),
          CategoryScreen.routeName:(ctx)=>CategoryScreen(),
        },
      ),
    );
  }
}



class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}
class _IntroScreenState extends State<IntroScreen> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset("Images/Report.png",height: 200.0,),
          title: "Rich Media Reports",
          body: "Sometimes it's better to show your local municipality what you are complaining about. Use your smart phone to send pictures,videos and voice notes so they get the urgency of the situation",
          decoration: const PageDecoration(
            pageColor: Colors.white,
          )),
      PageViewModel(
          image: Image.asset("Images/data.png",height: 200.0,),
          title: "Track Your Complaints",
          body: "Track your complaints from stage to stage until they are completely answered",
          decoration: const PageDecoration(
            pageColor: Colors.white,
          )),
      PageViewModel(
          image: Image.asset("Images/announcements.png",height: 200.0,),
          title: "Live Announcements",
          body: "Get live announcements on important service delivery dates, e.g waste collection, water cuts etc",
          decoration: const PageDecoration(
            pageColor: Colors.white,
          )),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meet Muni's Pal"),
        backgroundColor: Colors.green[900],
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        dotsDecorator: DotsDecorator(
          color: Colors.yellow
        ),
        showNextButton: true,
        done: Text("Got it "),
        onDone: () {
           Navigator.of(context).pushNamed(SignupScreen.routeName);
        },
      ),
    );
  }
}

