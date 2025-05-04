import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _handleLogin() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),

              // Nút chọn ngôn ngữ (góc phải trên)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.flag, color: Colors.redAccent, size: 20),
                      SizedBox(width: 6),
                      Text("Vie", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40),

              Center(
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 32),

              // Email TextField
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Nhập email',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Password TextField
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Nhập mật khẩu',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Nút đăng nhập
              ElevatedButton(
                onPressed: _handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              SizedBox(height: 12),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Quên mật khẩu?",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                ),
              ),

              SizedBox(height: 32),

              // Hình linh vật
              Center(
                child: Image.asset(
                  'assets/images/mascot.png', 
                  height: 180,
                ),
              ),

              SizedBox(height: 24),

              // Điều khoản
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    children: [
                      TextSpan(text: 'Bằng việc tiếp tục, bạn đã đọc và đồng ý với '),
                      TextSpan(
                        text: 'Điều khoản sử dụng',
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                      TextSpan(text: ' và '),
                      TextSpan(
                        text: 'Chính sách bảo mật thông tin cá nhân ',
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
