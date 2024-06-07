String truncateTitle(String title, int wordLimit) {
  List<String> words = title.split(' ');
  if (words.length > wordLimit) {
    return '${words.sublist(0, wordLimit).join(' ')}...';
  }
  return title;
}
