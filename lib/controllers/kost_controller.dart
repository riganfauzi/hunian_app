import 'package:flutter/material.dart';
import 'package:hunian_app/models/kost_model.dart';
import 'package:hunian_app/services/kost_service.dart';

class KostController extends ChangeNotifier {
  List<KostModel> _kosts = [];
  bool _isLoading = false;
  String? _errorMessage;

  // Detail kost
  KostModel? _selectedKost;
  bool _isDetailLoading = false;
  String? _detailErrorMessage;

  List<KostModel> get kosts => _kosts;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  KostModel? get selectedKost => _selectedKost;
  bool get isDetailLoading => _isDetailLoading;
  String? get detailErrorMessage => _detailErrorMessage;

  Future<void> fetchKosts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _kosts = await KostService().getKosts();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchKostsByCity(String city) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _kosts = await KostService().getKostsByCity(city);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get detail kost by id
  Future<void> fetchKostDetail(String id) async {
    _isDetailLoading = true;
    _detailErrorMessage = null;
    _selectedKost = null;
    notifyListeners();

    try {
      _selectedKost = await KostService().getKostById(id);
      _isDetailLoading = false;
      notifyListeners();
    } catch (e) {
      _detailErrorMessage = e.toString();
      _isDetailLoading = false;
      notifyListeners();
    }
  }

  void clearSelectedKost() {
    _selectedKost = null;
    _detailErrorMessage = null;
    notifyListeners();
  }
}
