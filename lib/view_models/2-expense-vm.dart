import '../models/transaction.dart';
import '../repositories/transaction-repo.dart';

class CreateExpenseTransactionViewModel {
  final TransactionRepository _repository;

  CreateExpenseTransactionViewModel(this._repository);

  Future<Transaction> createTransaction(String title, double amount, DateTime date, String category) async {
    final transaction = Transaction(
      id: 0,
      title: title,
      amount: amount,
      date: date,
      type: false,
      category: category,
    );
    return await _repository.createTransaction(transaction);
  }
}
