import '../models/transaction.dart';
import '../repositories/transaction-repo.dart';

class ActionTransactionViewModel {
  final TransactionRepository _repository;

  ActionTransactionViewModel(this._repository);

  Future<Transaction> updateTransaction(Transaction transaction) async {
    return await _repository.updateTransaction(transaction);
  }

  Future<void> deleteTransaction(int id) async {
    await _repository.deleteTransaction(id);
  }
}
