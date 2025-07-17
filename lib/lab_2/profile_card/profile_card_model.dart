import 'package:lab/assets/import_export.dart';


class ProfileCardModel{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(
    text: '',
  );


}