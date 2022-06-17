import 'package:flutter_managers/flutter_managers.dart';


class News extends ManagerModel<News>{
  News({

     this.id,
     this.title,
     this.image,
     this.hashtags,
     this.content,
     this.createdAt,
     this.updatedAt,
  });
    String ? id;
    String ? title;
    String ? image;
    List<dynamic>? hashtags;
    String ? content;
    String ? createdAt;
    String ? updatedAt;

 factory News.fromJson(Map<String, dynamic> json)=>News(
    image: json['image']==null?null:json['image'],
     content: json['content']==null?null:json['content'],
     createdAt: json['createdAt']==null?null:json['createdAt'],
     hashtags: json['hashtags']==null?null:json['hashtags'],
     id: json['id']==null?null:json['id'],
     title: json['title']==null?null:json['title'],
     updatedAt: json['updatedAt']==null?null:json['updatedAt'],
  );


  Map<String, dynamic> toJson() =>{
   "id" :  id == null ? null : id,
   "title" :  title == null ? null : title,
   "image" :  image == null ? null : image,
   "hashtags" :  hashtags == null ? null : hashtags,
   "content" :  content == null ? null : content,
   "createdAt" :  createdAt == null ? null : createdAt,
   "id" :  createdAt == null ? null : createdAt,

  };
  @override
  News fromJson(Map<String, dynamic> json) =>News.fromJson(json);
}
