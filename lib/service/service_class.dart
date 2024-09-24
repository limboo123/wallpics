import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest/model/model_class.dart';

class Wpservices{
  final _baseUrl = "https://api.pexels.com/v1/";
  final _key  ="YKoexhUHSo2cPDmLjjakMtbdJwnugJOtaN76tj0LMXAsEDkh6BYxfyem";


  Future<List<Wpmodel>> fetchWpData(String category) async {
    try {
      final url = "${_baseUrl}search?query=${category}&per_page=33";
      final response = await http.get(Uri.parse(url),headers: {
        "Authorization":_key,
      }
      );
      final allData = jsonDecode(response.body);
      final List data =allData["photos"];
      return data.map((photo)=>Wpmodel.fromMap(photo)).toList();
    } catch (e) {
      return [];
    }
  }

}
class SearchService {
  Future<List<Wpmodel>> fetchWallpapersByQuery(String query) async {
    return await Wpservices().fetchWpData(query);
  }}

