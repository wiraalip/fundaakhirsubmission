import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:submission2/apiservice/apiservice.dart';
import 'package:submission2/models/listclass.dart' as list;
import 'apiservice_test.mocks.dart';

class ApiTest extends Mock implements http.Client {}

@GenerateMocks([http.Client])
void main() {
  ApiTest client;
  Service apiService;

  final dummyListJsonInString = list.Welcome(
      error: false,
      message: "message",
      count: 1,
      restaurants: <list.Restaurant>[]);

  client = ApiTest();
  apiService = Service(client);

  setUp(() {
    client = ApiTest();
    apiService = Service(client);
  });
  test('apiservice ...', () async {
    final client = MockClient();

    when(client.get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
        .thenAnswer(
            (_) async => http.Response(dummyListJsonInString.toString(), 200));
    final result = await apiService.getAllData(http.Client());
    expect(result, isA<list.Welcome>());
  });
}
