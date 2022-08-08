import 'api.dart';
import 'package:http/http.dart' as http;
class PatientService {


   Api api = Api();


   Future<http.Response> getUser()async{
     return await api.httpGet('user');

   }
}
