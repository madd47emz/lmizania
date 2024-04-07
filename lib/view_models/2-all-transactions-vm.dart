import 'package:flutter/foundation.dart';

import '../models/transaction.dart';
import '../repositories/transaction-repo.dart';
class AllTransactionsViewModel extends ChangeNotifier {
  final TransactionRepository _repository;
  Future<List<Transaction>>? _transactions;

  AllTransactionsViewModel(this._repository);

  Future<void> loadAllTransactions() async {
    try {
      _transactions = _repository.getTransactions();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Transaction>>? get transactions => _transactions;
}
