import 'package:flutter_test/flutter_test.dart';
import 'package:starter_architecture_flutter_firebase/src/features/jobs/domain/job.dart';

void main() {
  group('fromJson', () {
    test('job with all properties', () {
      final job = Job.fromJson({
        'id': 'abc',
        'name': 'Blogging',
        'ratePerHour': 10,
      });
      expect(job, const Job(id: 'abc', name: 'Blogging', ratePerHour: 10));
    });

    test('missing name', () {
      expect(
              () => Job.fromJson({
            'id': 'abc',
            'ratePerHour': 10,
          }),
          throwsA(isA<TypeError>()));
    });
  });

  group('toJson', () {
    test('valid name, ratePerHour', () {
      const job = Job(id: 'abc', name: 'Blogging', ratePerHour: 10);
      expect(job.toJson(), {
        'id': 'abc',
        'name': 'Blogging',
        'ratePerHour': 10,
      });
    });
  });

  group('equality', () {
    test('different properties, equality returns false', () {
      const job1 = Job(id: 'abc', name: 'Blogging', ratePerHour: 10);
      const job2 = Job(id: 'abc', name: 'Blogging', ratePerHour: 5);
      expect(job1 == job2, false);
    });
    test('same properties, equality returns true', () {
      const job1 = Job(id: 'abc', name: 'Blogging', ratePerHour: 10);
      const job2 = Job(id: 'abc', name: 'Blogging', ratePerHour: 10);
      expect(job1 == job2, true);
    });
  });
}
