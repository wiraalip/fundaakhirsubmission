import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:submission2/apiservice/apiservice.dart';
import 'package:submission2/models/listclass.dart' as list;
import 'apiservice_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final client = MockClient();
  final apiService = Service(client);

  test('apiservice ...', () async {
    when(client.get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
        .thenAnswer((_) async => http.Response('''{
    "error": false,
    "message": "success",
    "count": 20,
    "restaurants": [
        {
            "id": "rqdv5juczeskfw1e867",
            "name": "Melting Pot",
            "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
            "pictureId": "14",
            "city": "Medan",
            "rating": 4.2
        },
        {
            "id": "s1knt6za9kkfw1e867",
            "name": "Kafe Kita",
            "description": "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
            "pictureId": "25",
            "city": "Gorontalo",
            "rating": 4
        }
    ]
} ''', 200));
    expect(await apiService.getAllData(), isA<list.Welcome>());
  });

  test('throws an exception', () async {
    when(client.get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    expect(apiService.getAllData(), throwsA(isInstanceOf<Exception>()));
  });
}
