import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasissta_project/widget/small_text.dart';
import 'package:wasissta_project/widget/string.dart';
import '../service/loader.dart';
import '../service/service.dart';
import '../widget/bottom_navigation.dart';
import '../widget/constant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  List<String> image = [
    "asset/image/logos_whatsapp-icon.png",
    "asset/image/WhatsApp Business.png",
    "asset/image/instagramLogo.png"
  ];
  List<String> text = [
    MyStrings.whatsapp,
    MyStrings.business,
    MyStrings.instagram
  ];
  bool isPasswordVisible = false;
  int isClicked = 0;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    isClicked = 0;
  }

  void isSelected(index) {
    setState(() {
      isClicked = index;
      if (kDebugMode) {
        print(isClicked);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("asset/image/Vector.png"),
                    const SizedBox(
                      height: 3,
                    ),
                    Image.asset("asset/image/image2.png"),
                    Image.asset("asset/image/Vector (1).png"),
                    const Text(
                      "Let's sign you in.",
                      style: TextStyle(
                        fontFamily: MyStrings.outfit,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff00A397),
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Here are some contents based",
                      style: TextStyle(
                        fontFamily: MyStrings.outfit,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      "on your preference",
                      style: TextStyle(
                        fontFamily: MyStrings.outfit,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontFamily: MyStrings.outfit,
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextFormField(
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontFamily: MyStrings.outfit,
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextFormField(
                      cursorColor: primaryColor,
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black45,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forget password?",
                          style: TextStyle(
                              fontFamily: MyStrings.outfit,
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Both phone number and password are required.'),
                            ),
                          );
                        } else {
                          _logIn(context, emailController.text,
                              passwordController.text);
                        }
                      },
                      child: Center(
                        child: Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xff00A397),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                fontFamily: MyStrings.outfit,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Divider(
                                thickness: 1.5, color: dividerLineColor)),
                        const SizedBox(
                          width: 8,
                        ),
                        Text("or",
                            style: TextStyle(
                                fontFamily: MyStrings.outfit,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: dividerLineColor)),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: Divider(
                                thickness: 1.5, color: dividerLineColor)),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "asset/image/facebook.png",
                              height: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Center(
                                child: Text(
                              "Sign in with Facebook",
                              style: TextStyle(
                                  fontFamily: MyStrings.outfit,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "asset/image/google trasprant.png",
                              height: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Center(
                                child: Text(
                              "Sign in with Google",
                              style: TextStyle(
                                  fontFamily: MyStrings.outfit,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _logIn(BuildContext context, String email, String password) async {
    // startLoader();

    try {
      final response = await Webservice().callLoginService(
          email: email, password: password, showSnackBar: (SnackBar) {});

      // stopLoader();

      if (response != null && response.status == "success") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        await prefs.setString('password', password);
        await prefs.setString(
            'authorization', response.authorization?.token ?? '');
        await Future.delayed(const Duration(milliseconds: 800));
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationScreen(),
            ),
          );
        }
      } else {
        Fluttertoast.showToast(msg: "Failed to Login");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "An error occurred");
      // stopLoader();
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // startLoader() {
  //   LoadingDialog.showLoaderDialog(context, 'Please Wait..');
  // }
  //
  // stopLoader() {
  //   Navigator.of(context).pop();
  // }
}
