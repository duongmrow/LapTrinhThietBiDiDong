import 'package:flutter/material.dart';
import 'flutter_01.dart';

class TextButtonExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextButton Example'),
        ),
        body: Center(
          child: TextButton(
              onPressed: () {
                print('May da nhan nut');
    },
      child: Text('Nhan vao day di thang ngu'),
        ),
      ),
    ),
    );
  }
}

class ElevatedButtonExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ElevatedButton Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              print('May da nhan nut');
            },
            child: Text('Nhan vao day di thang ngu'),
          ),
        ),
      ),
    );
  }
}

class OutlinedButtonExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OutlinedButton Example'),
        ),
        body: Center(
          child: OutlinedButton(
            onPressed: () {
              print('May da nhan nut');
            },
            child: Text('Nhan vao day di thang ngu'),
          ),
        ),
      ),
    );
  }
}

class GestureDetectorExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GestureDetector Example'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              print('May da nhan nut');
            },
            onDoubleTap: (){
              print('May da nhan nut hai lan');
            },
            onLongPress: (){
              print('May da nhan giu nut');
        },

            child: Container(
              width: 274,
              height: 274,
              color: Colors.purpleAccent,
              child: Center(child: Text('Nhan vao day ne thang ngu')),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Khai sinh',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Meow meow',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Xử lý logic đăng nhập ở đây
      print("Đăng nhập thành công!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Đăng nhập')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Mật khẩu'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Đăng nhập'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
