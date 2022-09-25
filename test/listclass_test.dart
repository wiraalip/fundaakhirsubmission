import 'package:flutter_test/flutter_test.dart';
import 'package:submission2/models/listclass.dart';

void main() {
  Restaurant r;
  r = Restaurant(
    city: '',
    description: '',
    id: '',
    name: '',
    pictureId: '',
    rating: 2,
  );

  test('inisialisasi objek restaurant', () {
    expect(r.name, anything);
    expect(r.description, anything);
    expect(r.city, anything);
    expect(r.id, anything);
  });
}
