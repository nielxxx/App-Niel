class Post {
  String body;
  String author;
  int likes=0;
  bool userLiked= false;

  Post (this.body, this.author);

  void likePost(){
    // ignore: unnecessary_this
    this.userLiked = !this.userLiked;
    // ignore: unnecessary_this
    if(this.userLiked){
      // ignore: unnecessary_this
      this.likes += 1;
    }
    else {
      // ignore: unnecessary_this
      this.likes -= 1;
    }
  }
}