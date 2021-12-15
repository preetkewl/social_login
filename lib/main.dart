import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final ImagePicker _picker = ImagePicker();

  void _incrementCounter() {
    setState(() {});
  }

  Future<void> _handleSignIn() async {
    final XFile? image = await _picker.pickVideo(source: ImageSource.camera);
    print(image!.path);

    // final XFile? image = await _picker.pickMultiImage();
    // images!.forEach((element) {print(element.path); });

    // try {
    //   await _googleSignIn.signIn();
    //   print(      _googleSignIn.currentUser!.email);
    //   print(      _googleSignIn.currentUser!.displayName);
    //   print(      _googleSignIn.currentUser!.photoUrl);
    //   print(      _googleSignIn.currentUser!.id);
    //   await _googleSignIn.signOut();
    //
    //
    // } catch (error) {
    //   print(error);
    // }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('You have pushed the button this many times:'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleSignIn,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
