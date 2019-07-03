class Blog {
  Blog(this.tags, this.pages);

  factory Blog.fromJson(Map<String, dynamic> json) {
    final listTags = json['tags'] as List;
    final List<Tag> tags = listTags.map((i) => Tag.fromJson(i)).toList();
    final listPages = json['pages'] as List;
    final List<PostData> posts =
        listPages.map((i) => PostData.fromJson(i)).toList();

    return Blog(tags, posts);
  }

  final List<Tag> tags;
  final List<PostData> pages;

  Blog copyWith({
    List<Tag> tags,
    List<PostData> pages,
  }) {
    return Blog(tags ?? this.tags, pages ?? this.pages);
  }
}

class Tag {
  Tag(this.pages, this.name);

  factory Tag.fromJson(Map<String, dynamic> json) {
    final list = json['pages'] as List;
    final List<PostData> tagDataList =
        list.map((i) => PostData.fromJson(i)).toList();

    return Tag(tagDataList, json['name']);
  }

  final String name;
  final List<PostData> pages;
}

class PostData {
  PostData(this.description, this.title, this.uri, this.thumbnail);

  PostData.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        title = json['title'],
        uri = json['uri'],
        thumbnail = json['thumbnail'];

  final String description;
  final String title;
  final String uri;
  final String thumbnail;
}
