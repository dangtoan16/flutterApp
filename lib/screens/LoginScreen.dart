import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  void _handleLogin() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _handleGoogleLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đăng nhập bằng Google')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Banner login
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: FadeInUp(
                      duration: Duration(seconds: 1),
                      child: Image.asset('assets/images/light-1.png'),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1200),
                      child: Image.asset('assets/images/light-2.png'),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1300),
                      child: Image.asset('assets/images/clock.png'),
                    ),
                  ),
                  Positioned(
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1600),
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "Đăng Nhập",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // Form
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  // Form container
                  FadeInUp(
                    duration: Duration(milliseconds: 1800),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color.fromRGBO(143, 148, 251, 1)),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          // Tài khoản
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Tài khoản",
                              hintStyle: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Divider(),
                          // Mật khẩu
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Mật khẩu",
                              hintStyle: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Ghi nhớ mật khẩu
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (val) {
                          setState(() => _rememberMe = val ?? false);
                        },
                      ),
                      Text("Ghi nhớ mật khẩu")
                    ],
                  ),
                  SizedBox(height: 20),

                  // Nút đăng nhập
                  FadeInUp(
                    duration: Duration(milliseconds: 1900),
                    child: GestureDetector(
                      onTap: _handleLogin,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Đăng nhập",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Nút đăng nhập Google
                  FadeInUp(
                    duration: Duration(milliseconds: 1950),
                    child: OutlinedButton.icon(
                      icon: Icon(Icons.login),
                      label: Text('Đăng nhập bằng Google'),
                      onPressed: _handleGoogleLogin,
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide(color: Color.fromRGBO(143, 148, 251, 1)),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Quên mật khẩu
                  FadeInUp(
                    duration: Duration(milliseconds: 2000),
                    child: Text(
                      "Quên mật khẩu?",
                      style: TextStyle(
                        color: Color.fromRGBO(143, 148, 251, 1),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
