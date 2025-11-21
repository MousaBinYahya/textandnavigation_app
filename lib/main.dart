import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nameDisplayController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emailDisplayController = TextEditingController();

  void _login() {
    setState(() {
      _nameDisplayController.text = _nameController.text;
      _emailDisplayController.text = _emailController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('القائمة الرئيسية')),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'أدخل الاسم'),
          ),

          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'أدخل الايميل'),
          ),

          TextField(
            controller: _nameDisplayController,
            decoration: InputDecoration(labelText: 'الاسم'),
            readOnly: true,
          ),

          TextField(
            controller: _emailDisplayController,
            decoration: InputDecoration(labelText: 'الايميل'),
            readOnly: true,
          ),

          ElevatedButton(
            onPressed: _login,
            child: Text('عرض'),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Tow(
                    name: _nameController.text, // تمرير الحقل الأول فقط
                  ),
                ),
              );
            },
            child: Text('انتقال'),
          ),
        ],
      ),
    );
  }
}

class Tow extends StatefulWidget {
  final String name;

  Tow({required this.name});

  @override
  State<Tow> createState() => _TowState();
}

class _TowState extends State<Tow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاستفسارات'),
      ),
      body: Column(
        children: [
          Text(': ${widget.name}'),
        ],
      ),
    );
  }
}
