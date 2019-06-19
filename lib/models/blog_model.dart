class Blog {
  final List<Tag> tags;
  final List<PostData> pages;

  Blog(this.tags, this.pages);

  factory Blog.fromJson(Map<String, dynamic> json) {
    var listTags = json['tags'] as List;
    List<Tag> tags = listTags.map((i) => Tag.fromJson(i)).toList();
    var listPages = json['pages'] as List;
    List<PostData> posts = listPages.map((i) => PostData.fromJson(i)).toList();

    return Blog(tags, posts);
  }

  Blog copyWith({
    List<Tag> tags,
    List<PostData> pages,
  }) {
    return Blog(tags ?? this.tags, pages ?? this.pages);
  }
}

class Tag {
  final String name;
  final List<PostData> pages;

  Tag(this.pages, this.name);

  factory Tag.fromJson(Map<String, dynamic> json) {
    var list = json['pages'] as List;
    List<PostData> tagDataList = list.map((i) => PostData.fromJson(i)).toList();

    return Tag(tagDataList, json['name']);
  }
  // : data = json['data'].map((i) => TagData.fromJson(i)).toList(),
  //   name = json['name'];
}

class PostData {
  final String content;
  final String title;
  final String uri;

  PostData(this.content, this.title, this.uri);

  PostData.fromJson(Map<String, dynamic> json)
      : content = json['content'],
        title = json['title'],
        uri = json['uri'];
}
