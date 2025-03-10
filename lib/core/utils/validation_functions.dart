
bool isValidEmail(String? inputString,{bool isRequired=false}){
  bool isInputStringValid=false;
  if(!isRequired && (inputString==null ? true : inputString.isEmpty)){
    isInputStringValid=true;
  }
  if(inputString!=null && inputString.isNotEmpty){
    const pattern=r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp=RegExp(pattern);
    isInputStringValid=regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}

bool isVaildPassword(String? inputString ,{bool isRequired=false}){
  bool isInputStringvalid=false;
  if(!isRequired && (inputString==null ? true : inputString.isEmpty)){
    isInputStringvalid=true;
  }
  if(inputString!=null && inputString.isNotEmpty){
const pattern=r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp=RegExp(pattern);
    isInputStringvalid=regExp.hasMatch(inputString);
  }
  return isInputStringvalid;
}