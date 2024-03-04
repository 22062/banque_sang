import 'dart:convert';
import 'package:http/http.dart' as http;

class WilayaApi {
  static Future<List<String>> fetchWilayas() async {
    final response = await http.get(
      Uri.parse('http://172.20.10.14/php/Api/Wilaya.php'), // Remplacez "votre_url_api" par votre véritable URL API
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<String> wilayas = data.map<String>((dynamic item) => item['nom_wilaye_fr']).toList();
      return wilayas;
    } else {
      throw Exception('Erreur lors de la récupération des wilayas');
    }
  }
}
