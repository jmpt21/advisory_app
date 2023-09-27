String? emptyValidate (String? input){
  return (input == null || input.isEmpty) ? 'Please enter some text' : null;
}

String? passValidate(String? pass){
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\\$&*~]).{8,}$');

  return (!regex.hasMatch(pass!)) ? 'Introduce una contraseña válida' : null;
}