import 'dart:io';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:translator/translator.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  List<String> languages = [
    'English',
    'Arabic',
    // 'Hindi',
    // 'German',
    // 'Russian',
    // 'Spanish',
    // 'Urdu',
    // 'Japanese	',
    // 'Italian'
  ];
  List<String> languagescode = [
    'en',
    'ar',
    // 'hi',
    // 'de',
    // 'ru',
    // 'es',
    // 'ur',
    // 'ja',
    // 'it'
  ];
  final translator = GoogleTranslator();
  String from = 'en';
  String to = 'ar';
  String data = 'Text Translated ';
  String selectedvalue = 'English';
  String selectedvalue2 = 'Arabic';
  TextEditingController controller = TextEditingController(text: '');
  final formkey = GlobalKey<FormState>();
  bool isloading = false;
  translate() async {
    try {
      if (formkey.currentState!.validate()) {
        await translator
            .translate(controller.text, from: from, to: to)
            .then((value) {
          data = value.text;
          isloading = false;
          setState(() {});
          // print(value);
        });
      }
    } on SocketException catch (_) {
      isloading = true;
      SnackBar mysnackbar = const SnackBar(
        content: Text('Internet not Connected'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   translate();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),

      //backgroundColor: const Color.fromARGB(255, 87, 104, 254),
      body: FadeInUp(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 170,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  color: Colors.indigo.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'From',
                    style: TextStyle(
                      color: Colors.indigo.shade800,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  DropdownButton(
                    value: selectedvalue,
                    focusColor: Colors.transparent,
                    items: languages.map((lang) {
                      return DropdownMenuItem(
                        value: lang,
                        child: Text(lang),
                        onTap: () {
                          if (lang == languages[0]) {
                            from = languagescode[0];
                          } else if (lang == languages[1]) {
                            from = languagescode[1];
                          } else if (lang == languages[2]) {
                            from = languagescode[2];
                          } else if (lang == languages[3]) {
                            from = languagescode[3];
                          } else if (lang == languages[4]) {
                            from = languagescode[4];
                          } else if (lang == languages[5]) {
                            from = languagescode[5];
                          } else if (lang == languages[6]) {
                            from = languagescode[6];
                          } else if (lang == languages[7]) {
                            from = languagescode[7];
                          } else if (lang == languages[8]) {
                            from = languagescode[8];
                          }
                          setState(() {
                            // print(lang);
                            // print(from);
                          });
                        },
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedvalue = value!;
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: Form(
                key: formkey,
                child: TextFormField(
                  controller: controller,
                  maxLines: 7,
                  minLines: 1,
                  maxLength: 1000,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      errorStyle: TextStyle(color: Colors.white)),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  color: Colors.indigo.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'To',
                    style: TextStyle(
                      color: Colors.indigo.shade800,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  DropdownButton(
                    value: selectedvalue2,
                    focusColor: Colors.transparent,
                    items: languages.map((lang) {
                      return DropdownMenuItem(
                        value: lang,
                        child: Text(lang),
                        onTap: () {
                          if (lang == languages[0]) {
                            to = languagescode[0];
                          } else if (lang == languages[1]) {
                            to = languagescode[1];
                          } else if (lang == languages[2]) {
                            to = languagescode[2];
                          } else if (lang == languages[3]) {
                            to = languagescode[3];
                          } else if (lang == languages[4]) {
                            to = languagescode[4];
                          } else if (lang == languages[5]) {
                            to = languagescode[5];
                          } else if (lang == languages[6]) {
                            to = languagescode[6];
                          } else if (lang == languages[7]) {
                            to = languagescode[7];
                          } else if (lang == languages[8]) {
                            to = languagescode[8];
                          }
                          setState(() {
                            print(lang);
                            print(from);
                          });
                        },
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedvalue2 = value!;
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: Center(
                child: SelectableText(
                  data,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: translate,
                style: ButtonStyle(
                  fixedSize: const WidgetStatePropertyAll(Size(300, 55)),
                  backgroundColor:
                      const WidgetStatePropertyAll(const Color(0xff04658e)),
                ),
                

                child: isloading
                    ? const SizedBox.square(
                        dimension: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text('Translate')),
            const SizedBox(
              height: 30,
            )
          ],
        )),
      ),
    );
  }
}
