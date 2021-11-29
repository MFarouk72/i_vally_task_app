import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class LowestPriceData extends ChangeNotifier{
  Map<String,dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';

  Map<String ,dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async{
    final response = await http
        .get(Uri.parse('https://amlakalibaba.com/wp-json/ml/v1/lowest_properties/1?page=1'));
    if (response.statusCode == 200) {
      try{
        _map = jsonDecode(response.body);

        _error = false;
      }catch (e){
        _error =true;
        _errorMessage = e.toString();
        _map={};
      }
    }
    else{
      _error =true;
      _errorMessage = 'Failed to load data';
      _map={};
    }
    notifyListeners();
  }

  void initialValue(){
    _map = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }

}