class BooksListModel {
  String? kind;
  int? totalBooks;
  List<Books>? books;

  BooksListModel({this.kind, this.totalBooks, this.books});

  BooksListModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalBooks = json['totalItems'];
    if (json['items'] != null) {
      books = <Books>[];
      json['items'].forEach((v) {
        books!.add(Books.fromJson(v));
      });
    }
  }
}

class Books {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  BookInfo? bookInfo;

  Books({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.bookInfo,
  });

  Books.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    bookInfo = json['volumeInfo'] != null
        ? BookInfo.fromJson(json['volumeInfo'])
        : null;
  }
}

class BookInfo {
  String? title;
  String? subtitle;
  // List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  String? printType;
  num? averageRating;
  int? ratingsCount;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;

  BookInfo(
      {this.title,
      this.subtitle,
      // this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.pageCount,
      this.printType,
      this.averageRating,
      this.ratingsCount,
      this.imageLinks,
      this.language,
      this.previewLink});

  BookInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "Title";
    subtitle = json['subtitle'] ?? "Subtitle";
    // authors = json['authors'] == null ? "" : json['authors'].cast<String>();
    publisher = json['publisher'] ?? "Publisher";
    publishedDate = json['publishedDate'] ?? "2000-02-02";
    description = json['description'] ?? " None description about this book";
    pageCount = json['pageCount'] ?? 100;
    printType = json['printType'];
    averageRating = json['averageRating'] ?? 3.5;
    ratingsCount = json['ratingsCount'] ?? 10;
    imageLinks = json['imageLinks'] != null
        ? ImageLinks.fromJson(json['imageLinks'])
        : ImageLinks(
            thumbnail:
                "https://books.google.com/books/content?id=EVePnEaV368C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api");
    language = json['language'] ?? "English";
    previewLink = json['previewLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['publisher'] = publisher;
    data['publishedDate'] = publishedDate;
    data['description'] = description;
    data['pageCount'] = pageCount;
    data['printType'] = printType;
    if (imageLinks != null) {
      data['imageLinks'] = imageLinks!.toJson();
    }
    data['language'] = language;
    data['previewLink'] = previewLink;
    data['averageRating'] = averageRating;
    data['ratingsCount'] = ratingsCount;
    return data;
  }
}

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  ImageLinks.fromJson(Map<String, dynamic> json) {
    smallThumbnail = json['smallThumbnail'] ??
        "https://books.google.com/books/content?id=EVePnEaV368C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api";
    thumbnail = json['thumbnail'] ??
        "https://books.google.com/books/content?id=EVePnEaV368C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['smallThumbnail'] = smallThumbnail;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

// class Book {
//   String? id;
//   BookInfo? bookInfo;

//   Book({
//     this.id,
//     this.bookInfo,
//   });

//   // Map<String, dynamic> toJson() {
//   //   return {'id': id, 'bookInfo': bookInfo!.toJson()};
//   // }

//   // factory Book.fromJson(Map<String, dynamic> json) {
//   //   return Book(id: json['id'], bookInfo: BookInfo.fromJson(json['bookInfo']));
//   // }

//   Map<String, dynamic> toMap() {
//     return {'id': id, 'bookInfo': bookInfo!.toJson()};
//   }

//   factory Book.fromMap(Map<String, dynamic> json) {
//     return Book(id: json['id'], bookInfo: BookInfo.fromJson(json['bookInfo']));
//   }
// }

// class Offers {
//   int? finskyOfferType;
//   ListPrice? listPrice;
//   ListPrice? retailPrice;

//   Offers({this.finskyOfferType, this.listPrice, this.retailPrice});

//   Offers.fromJson(Map<String, dynamic> json) {
//     finskyOfferType = json['finskyOfferType'];
//     listPrice = json['listPrice'] != null
//         ? new ListPrice.fromJson(json['listPrice'])
//         : null;
//     retailPrice = json['retailPrice'] != null
//         ? new ListPrice.fromJson(json['retailPrice'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['finskyOfferType'] = this.finskyOfferType;
//     if (this.listPrice != null) {
//       data['listPrice'] = this.listPrice!.toJson();
//     }
//     if (this.retailPrice != null) {
//       data['retailPrice'] = this.retailPrice!.toJson();
//     }
//     return data;
//   }
// }

// class ListPrice {
//   int? amountInMicros;
//   String? currencyCode;

//   ListPrice({this.amountInMicros, this.currencyCode});

//   ListPrice.fromJson(Map<String, dynamic> json) {
//     amountInMicros = json['amountInMicros'];
//     currencyCode = json['currencyCode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['amountInMicros'] = this.amountInMicros;
//     data['currencyCode'] = this.currencyCode;
//     return data;
//   }
// }

// class AccessInfo {
//   String? country;
//   String? viewability;
//   bool? embeddable;
//   bool? publicDomain;
//   String? textToSpeechPermission;
//   Epub? epub;
//   Epub? pdf;
//   String? webReaderLink;
//   String? accessViewStatus;
//   bool? quoteSharingAllowed;

//   AccessInfo(
//       {this.country,
//       this.viewability,
//       this.embeddable,
//       this.publicDomain,
//       this.textToSpeechPermission,
//       this.epub,
//       this.pdf,
//       this.webReaderLink,
//       this.accessViewStatus,
//       this.quoteSharingAllowed});

//   AccessInfo.fromJson(Map<String, dynamic> json) {
//     country = json['country'];
//     viewability = json['viewability'];
//     embeddable = json['embeddable'];
//     publicDomain = json['publicDomain'];
//     textToSpeechPermission = json['textToSpeechPermission'];
//     epub = json['epub'] != null ? new Epub.fromJson(json['epub']) : null;
//     pdf = json['pdf'] != null ? new Epub.fromJson(json['pdf']) : null;
//     webReaderLink = json['webReaderLink'];
//     accessViewStatus = json['accessViewStatus'];
//     quoteSharingAllowed = json['quoteSharingAllowed'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['country'] = this.country;
//     data['viewability'] = this.viewability;
//     data['embeddable'] = this.embeddable;
//     data['publicDomain'] = this.publicDomain;
//     data['textToSpeechPermission'] = this.textToSpeechPermission;
//     if (this.epub != null) {
//       data['epub'] = this.epub!.toJson();
//     }
//     if (this.pdf != null) {
//       data['pdf'] = this.pdf!.toJson();
//     }
//     data['webReaderLink'] = this.webReaderLink;
//     data['accessViewStatus'] = this.accessViewStatus;
//     data['quoteSharingAllowed'] = this.quoteSharingAllowed;
//     return data;
//   }
// }

// class Epub {
//   bool? isAvailable;
//   String? acsTokenLink;
//   String? downloadLink;

//   Epub({this.isAvailable, this.acsTokenLink, this.downloadLink});

//   Epub.fromJson(Map<String, dynamic> json) {
//     isAvailable = json['isAvailable'];
//     acsTokenLink = json['acsTokenLink'];
//     downloadLink = json['downloadLink'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['isAvailable'] = this.isAvailable;
//     data['acsTokenLink'] = this.acsTokenLink;
//     data['downloadLink'] = this.downloadLink;
//     return data;
//   }
// }

// class SearchInfo {
//   String? textSnippet;

//   SearchInfo({this.textSnippet});

//   SearchInfo.fromJson(Map<String, dynamic> json) {
//     textSnippet = json['textSnippet'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['textSnippet'] = this.textSnippet;
//     return data;
//   }
// }
