class NetworkPath {
  static const login = '/login';
  static const register = '/register';
  static const registerEditor = '/registerEditor';
  static const getNews = '/getNews';
  static const addNews = '/addNews';
  static const deleteNew = '/news/:id';
  static const banner = '/Banner';
  static const getSpots = '/getSpots';
  static const appConfigDbKey = 'app_config_db_key';
  static const deleteTransaction = '/users/:id/transactions';
  static const transaction = '/transactions';
  static const usersActive = "/users/activate";
  static const adminStatics="/admin/stats";
  static const addFavlist="Users/Favlist/AddCoin";
  static const getTrends="/Users/1586ad8d/Favlist/";

  static deleteNews(String id) {
    return '/news/delete/$id';
  }

  static getUserTransaction(String id) {
    return '/users/$id/transactions';
  }

  static getNewsByID(String id) {
    return '/news/$id';
  }

  static getFavList(String id){
   return "/Users/$id/Favlist/";
  }
  static getTransactionByID(String id) {
    return "/users/$id/transactions";
  }

  static deleteUserByID(String id) => "/user/users/$id";
}
