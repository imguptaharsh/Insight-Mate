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
                                  'data:image/png;base64,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'),
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
