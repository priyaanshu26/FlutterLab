import 'package:lab/assets/import_export.dart';
class ProfileCardController{
  ProfileCardModel model = ProfileCardModel();


  GlobalKey<FormState> formKey() => model.formKey;
  TextEditingController nameController() => model.nameController;
  TextEditingController emailController() => model.emailController;
  TextEditingController phoneNumberController() => model.phoneNumberController;


}