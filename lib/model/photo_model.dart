class PhotoModel {
  final DateTime updatedAt;
  final Uri regular;
  final int likes;
  final String name;

  PhotoModel(this.updatedAt, this.regular, this.likes, this.name);

  // PhotoModel.fromResponse(Photo response)
  //     : updatedAt = response.updatedAt,
  //       regular = response.urls.regular,
  //       likes = response.likes,
  //       name = response.user.name;
}
