import 'package:flutter/foundation.dart';

import '../models/transaction.dart';
import '../repositories/transaction-repo.dart';

class HomeViewModel extends ChangeNotifier {
  final TransactionRepository _repository;
  Future<List<Transaction>>? _recentTransactions;

  HomeViewModel(this._repository);

  Future<void> loadRecentTransactions() async {
    try {
      _recentTransactions = _repository.getRecentTransactions();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Transaction>>? get recentTransactions => _recentTransactions;
}


