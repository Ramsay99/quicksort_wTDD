// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:test/test.dart';
import '../bin/solution.dart';

void main() {
  List list = List.empty(growable: true);
  group('Basics', () {
    test(
      'empty',
      () {
        list = quickSort([]);
        expect(list, []);
      },
    );

    test(
      'one value',
      () {
        list = quickSort([4]);
        expect(list, [4]);
      },
    );

    test(
      'two values, lower val in first',
      () {
        list = quickSort([4, 8]);
        expect(list, [4, 8]);
      },
    );
    test(
      'two values, lower val in last',
      () {
        list = quickSort([8, 4]);
        expect(list, [4, 8]);
      },
    );

    test(
      'three values, mid val in first',
      () {
        list = quickSort([2, 1, 3]);
        expect(list, [1, 2, 3]);
      },
    );

    test(
      'three values, mid val in middle',
      () {
        list = quickSort([1, 2, 3]);
        expect(list, [1, 2, 3]);
      },
    );

    test(
      'three values, mid val in last',
      () {
        list = quickSort([1, 3, 2]);
        expect(list, [1, 2, 3]);
      },
    );

    test(
      'three values, two mid values',
      () {
        list = quickSort([2, 1, 2]);
        expect(list, [1, 2, 2]);
      },
    );
  });

  group(
    'advance',
    () {
      // ToDo: Look for a way to Registers a function to be run once before all tests.
      // setUpAll(
      //   () {
      //     final int myListMaximumValue_StartingValue = 4;
      //     final int myListMaximumValue_EndingValue = 12;
      //     final List<int> starterListFor_MatcherList = [0, 1, 2, 3];
      //     List<int> matcherList = starterListFor_MatcherList;
      //   },
      // );
      test(
        'generated lists<int> by loop, left shifting',
        () {
          final int myListMaximumValue_StartingValue = 4;
          final int myListMaximumValue_EndingValue = 12;
          final List<int> starterListFor_MatcherList = [0, 1, 2, 3];
          List<int> matcherList = starterListFor_MatcherList;
          for (int myListMaxVal = myListMaximumValue_StartingValue;
              myListMaxVal < myListMaximumValue_EndingValue;
              myListMaxVal++) {
            // `.toList()` were added because `list` is mutable;
            // when add/remove an element in `list`,
            // the `matcherList` will get the change as well.
            list = matcherList.toList();
            for (int z = 0; z < myListMaxVal; z++) {
              print("\nList Before: $list");
              print("List After : ${quickSort(list)}");
              expect(quickSort(list), matcherList);

              list.add(list[0]);
              list.removeAt(0);
            }

            matcherList.add(myListMaxVal);
            print("\nLimiter Incresed to ${myListMaxVal + 1}\n");
          }
        },
      );
      test(
        'generated lists<int> by loop, right shifting',
        () {
          final int myListMaximumValue_StartingValue = 4;
          final int myListMaximumValue_EndingValue = 12;
          final List<int> starterListFor_MatcherList = [0, 1, 2, 3];
          List<int> matcherList = starterListFor_MatcherList;
          for (int myListMaxVal = myListMaximumValue_StartingValue;
              myListMaxVal < myListMaximumValue_EndingValue;
              myListMaxVal++) {
            // `.toList()` were added because `list` is mutable;
            // when add/remove an element in `list`,
            // the `matcherList` will get the change as well.
            list = matcherList.toList();
            for (int z = 0; z < myListMaxVal; z++) {
              print("\nList Before: $list");
              print("List After : ${quickSort(list)}");

              expect(quickSort(list), matcherList);

              list.insert(0, list.last);
              list.removeLast();
            }

            matcherList.add(myListMaxVal);
            print("\nLimiter Incresed to ${myListMaxVal + 1}\n");
          }
        },
      );
    },
  );
}
