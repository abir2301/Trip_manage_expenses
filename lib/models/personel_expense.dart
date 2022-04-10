class Person_expence {
  late String name_expence;
  late int expenceId;
  late String amount;
  late int person;
  late int category;
  Person_expence({
    required this.expenceId,
    required this.name_expence,
    required this.amount,
    required this.category,
    required this.person,
  });
  Person_expence.fromMap(dynamic obj) {
    this.expenceId = obj['expenseid'];
    this.name_expence = obj['nameexpense'];
    this.amount = obj['expenseAmount'];
    this.person = obj['Key_person_expense'];
    this.category = obj['key_expense_category'];
  }
  Map<String, dynamic> tomap() {
    var map = <String, dynamic>{
      'expenseid': expenceId,
      'nameexpense': name_expence,
      'expenseAmount': amount,
      'Key_person_expense': person,
      'key_expense_category': category,
    };
    return map;
  }
}
