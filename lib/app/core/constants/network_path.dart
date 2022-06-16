class NetworkPath{

  static const login = '/login';
  static const register = '/register';
  static const getNews = '/getNews';
  static const addNews = '/addNews';
  static const deleteNew = '/news/:id';
  static const banner = '/Banner';
  static const getSpots = '/getSpots';
  static const appConfigDbKey = 'app_config_db_key';
  static const deleteTransaction='/users/:id/transactions';
  static const transaction='/transactions';

  static deleteNews(String id){
    return '/news/id?=$id';
  }
  static getUserTransaction(String id){
    return '/users/id?=$id/transactions';
  }
  static getNewsByID(String id){
    return '/news/id?=$id';
  }

}