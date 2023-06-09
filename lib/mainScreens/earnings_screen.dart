import 'package:flutter/material.dart';
import 'package:riders_app/global/global.dart';
import 'package:riders_app/splashScreen/splash_screen.dart';


class EarningsScreen extends StatefulWidget
{
  const EarningsScreen({Key? key}) : super(key: key);

  @override
  _EarningsScreenState createState() => _EarningsScreenState();
}




class _EarningsScreenState extends State<EarningsScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Color(0xffebf0f6),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "₹ 4" + previousRiderEarnings,
                style: const TextStyle(
                    fontSize: 80,
                    color: Colors.black,
                    fontFamily: "Inter"
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Total Earnings",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.black,
                  thickness: 1.5,
                ),
              ),

              const SizedBox(height: 40.0,),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color:  Color(0xffc3b091),
                    ),
                    width: MediaQuery.of(context).size.width - 130,
                    height: 50,
                    child: const Center(
                      child: Text(
                        "Back",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
