import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  //google sign in
  signInWithGoogle() async {
    //open new page for select the email
    final GoogleSignInAccount? googleAccount = await GoogleSignIn().signIn();

    //get the user details and wait until user is authenticate
    final GoogleSignInAuthentication googleAuth =
        await googleAccount!.authentication;

    //create a new credentials to the user
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    //finally sign in the user
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
