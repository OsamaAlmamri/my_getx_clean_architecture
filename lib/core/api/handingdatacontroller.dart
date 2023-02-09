
import 'package:my_getx_clean_architecture/core/widgets/statusrequest.dart';

handlingData(response){
  if (response is StatusRequest){
   return response ; 
  }else {
   return StatusRequest.success ; 
  }
}