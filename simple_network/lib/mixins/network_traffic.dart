
mixin NetworkTraffic {

  void onReceiveProgress(int count, int total) {
    print('onReceiveProgress: Count: $count Total: $total');
    /*double percentage = (count / total) * 100;
    print("Download progress: $percentage%");*/
  }
  void whenComplete() {
    print('getArticles Progress Complete');
  }
  void onError(Object error) {
    print('getArticles Error: $error');
    throw error;
  }

}