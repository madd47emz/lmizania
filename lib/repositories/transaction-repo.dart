import 'package:dio/dio.dart';

import '../models/transaction.dart';
import '../views/res/http.dart';

class TransactionRepository {
  final Dio _dio = Dio();

  Future<List<Transaction>> getTransactions() async {
    try {
      final response = await _dio.get("$baseUrl/transactions");
      return (response.data as List).map((json) => Transaction.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Error getting transactions: $e");
    }
  }

  Future<List<Transaction>> getRecentTransactions() async {
    try {
      final response = await _dio.get("$baseUrl/recent-transactions");
      return (response.data as List).map((json) => Transaction.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Error getting transactions: $e");
    }
  }


  Future<Transaction> createTransaction(Transaction transaction) async {
    try {
      final response = await _dio.post("$baseUrl/transaction", data: transaction.toJson());
      return Transaction.fromJson(response.data);
    } catch (e) {
      throw Exception("Error creating transaction: $e");
    }
  }

  Future<Transaction> updateTransaction(Transaction transaction) async {
    try {
      final response = await _dio.put("$baseUrl/transaction/${transaction.id}", data: transaction.toJson());
      return Transaction.fromJson(response.data);
    } catch (e) {
      throw Exception("Error updating transaction: $e");
    }
  }

  Future<void> deleteTransaction(int id) async {
    try {
      await _dio.delete("$baseUrl/transaction/$id");
    } catch (e) {
      throw Exception("Error deleting transaction: $e");
    }
  }
}
