main() {
  List list = [10, 11, 31, 42, 6];
  print("$list => ${quickSort(list)}");
}

List quickSort(List list) {
  if (list.length <= 2) {
    if (list.length == 1) {
      return list;
    } else if (list.length == 2) {
      return list[0] < list[1] ? list : list.reversed.toList();
    } else {
      return List.empty();
    }
  }

  return _quickSort(list);
}

List _quickSort(List list) {
  int pivot = list.first;
  List equalOrLowerThanPivot = [];
  List higherThanPivot = [];

  for (int i = 1; i < list.length; i++) {
    if (list[i] > pivot) {
      higherThanPivot.add(list[i]);
    } else {
      equalOrLowerThanPivot.add(list[i]);
    }
  }

  return quickSort(equalOrLowerThanPivot) +
      [pivot] +
      quickSort(higherThanPivot);
}
