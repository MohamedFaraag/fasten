import 'package:firebase_auth/firebase_auth.dart';
///SingInAnonymously
///Tested and Working
Future<void> singInAnonymously() async {
  try {
    final userCredentials = await FirebaseAuth.instance.signInAnonymously();
    print('${userCredentials.user.uid}');
  }catch(e){
    print(e.toString());
  }
}
