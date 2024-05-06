import 'package:flutter/material.dart';
import 'package:wasissta_project/ui%20design/signinscreen.dart';
import 'package:wasissta_project/widget/constant.dart';
import 'package:wasissta_project/widget/string.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00A397),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("asset/image/chatting-cuate.png",
                height: MediaQuery.of(context).size.height / 2),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Welcome to",
                        style: TextStyle(
                            fontFamily: MyStrings.outfit,

                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600)),
                    const Text("Wassista",
                        style: TextStyle(
                            fontFamily: MyStrings.outfit,

                            color: Color(0xff00A397),
                            fontSize: 25,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Here some contents based",
                      style: TextStyle(
                          fontFamily: MyStrings.outfit,

                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    const Text(
                      "on your preference",
                      style: TextStyle(
                          fontFamily: MyStrings.outfit,

                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const  SignInScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: const Color(0xff00A397))),
                        child: Center(child: Text("Let’s Get Started",style: TextStyle(
                          fontFamily: MyStrings.outfit,
                            color: whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
