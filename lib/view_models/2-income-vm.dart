import '../models/transaction.dart';
import '../repositories/transaction-repo.dart';

class CreateIncomeTransactionViewModel {
  final TransactionRepository _repository;

  CreateIncomeTransactionViewModel(this._repository);

  Future<Transaction> createTransaction(String title, double amount, DateTime date, String category) async {
    final transaction = Transaction(
      id: 0,
      title: title,
      amount: amount,
      date: date,
      type: true,
      category: category,
    );
    return await _repository.createTransaction(transaction);
  }
}
