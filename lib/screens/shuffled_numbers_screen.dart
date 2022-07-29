import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';

class ShuffledNumbers extends StatefulWidget {
  const ShuffledNumbers({Key? key}) : super(key: key);
static const String id = 'shuffled_numbers_screen';
 

  @override
  State<ShuffledNumbers> createState() => _ShuffledNumbersState();
}

class _ShuffledNumbersState extends State<ShuffledNumbers> {


 late List<int> numbers;
  String password = '';
  bool isPasswordSet = false;
  late String savedPassword;
  bool isObscure = false;

 @override
  void initState() {
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    numbers.shuffle();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
          color: const Color.fromARGB(255, 239, 244, 248),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        (isPasswordSet ? 'Check Password : ' : 'Entered Password : ') + (isObscure ? password : password.replaceAll(RegExp(r"."), "*")),
                        style: const TextStyle(
                          color: Color(0xff041E3C),
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 1.5,
                    ),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          if (password.length > 20) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Max digits is 20",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                          } else {
                            setState(() {
                              password = password + numbers[index].toString();
                            });
                          }
                          ;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                                child: AutoSizeText(
                              '${numbers[index]}',
                              style: TextStyle(fontSize: 50* MediaQuery.of(context).size.width , fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      );
                    },
                  ),
                  RoundedButton(
                    title: 'Clear',
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        password = '';
                      });
                    },
                  ),
                  RoundedButton(
                    title: 'Submit',
                    color: Color(0xff027DFD),
                    onPressed: () {
                      if (password.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Enter min 8 digits",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        );
                      } else if (!isPasswordSet) {
                        setState(() {
                          isPasswordSet = true;
                          savedPassword = password;
                          password = '';
                        });
                        // Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              (password == savedPassword).toString(),
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}