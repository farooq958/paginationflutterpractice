import 'package:http/http.dart' as http;
import 'package:paginatedapi/data/model/paginatedmodel/paginated_model.dart';

class PaginatedRepository {
  Future<PaginatedModel?> getPaginatedData(int pageNo) async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('https://dummyjson.com/users?page=$pageNo&limit=10'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      PaginatedModel productData =
          paginatedModelFromMap(await response.stream.bytesToString());

      return productData;
    } else {
      print(response.reasonPhrase);
    }
  }
}
