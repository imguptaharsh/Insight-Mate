import 'package:flutter/material.dart';
import 'package:hackathon_gpt/Backend/auth/auth_services.dart';
import '../widget/bottom_sheet.dart';

class PersonalInfo extends StatefulWidget {
  static const routeName = '/edit-profile';
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        title: const Padding(
          padding: EdgeInsets.only(top: 10.0, left: 60),
          child: Text(
            'Personal Info',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 10.0),
                      const SizedBox(height: 18.0),
                      Center(
                        child: Stack(
                          children: [
                            const CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                  'https://yt3.googleusercontent.com/ifZJFKoXaasijKlvMxM43d1lXCsvTjJgujLvEWCvv68e8rHKSg2OmixwdRBp_L_50uQBviQOHA=s900-c-k-c0x00ffffff-no-rj'),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      context: context,
                                      builder: ((builder) =>
                                          BottomShhetWidget()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color.fromRGBO(0, 166, 126, 1),
                                  ),
                                  child: const Icon(
                                    size: 13,
                                    Icons.mode_edit_sharp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Name',
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      TextFormField(
                        cursorColor: const Color.fromRGBO(0, 166, 126, 1),
                        cursorHeight: 25,
                        cursorRadius: const Radius.circular(30),
                        cursorWidth: 3,
                        controller: _nameController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gotham',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(2, 190, 146, 0.382)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 166, 126, 100)),
                          ),
                          hintStyle: TextStyle(color: Colors.white54),
                          hintText: '   Enter your name',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Email',
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      TextFormField(
                        cursorColor: const Color.fromRGBO(0, 166, 126, 1),
                        cursorHeight: 25,
                        cursorRadius: const Radius.circular(30),
                        cursorWidth: 3,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gotham',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(2, 190, 146, 0.382)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 166, 126, 100)),
                          ),
                          hintStyle: TextStyle(color: Colors.white54),
                          hintText: '   Enter your email',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 100,
                          height: 40,
                          child: TextButton(
                            style: ButtonStyle(
                                elevation: const MaterialStatePropertyAll(2),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(0, 166, 126, 100))),
                            child: const Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Implement update functionality
                                setState(() {
                                  _isLoading = true;
                                });
                                authService.changeCredentials(
                                  email: _emailController.text,
                                  name: _nameController.text,
                                  context: context,
                                );
                                // Simulating update with delay
                                Future.delayed(
                                    const Duration(milliseconds: 100), () {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Name Changed'),
                                    ),
                                  );
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
