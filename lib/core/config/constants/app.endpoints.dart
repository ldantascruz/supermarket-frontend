abstract class AppEndpoints {
  AppEndpoints._();

  static const String baseUrl = 'http://192.168.40.101:8080';
  // static const String baseUrl = 'https://supermarket-backend-qomz.onrender.com';

  static const String login = '/auth/login';
  static const String users = '/users';


  // static const String listComplaints = '/api/Reclamacao/lista';
  // static void getComplaintById({required String id}) => '/api/Reclamacao/$id';
  // static const String saveComplaint = '/api/Reclamacao/salvar';
}
