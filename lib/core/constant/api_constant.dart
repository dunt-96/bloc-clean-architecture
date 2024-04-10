class ApiConstants {
  static const String apiKey = '';
  static const String baseUrl = 'http://localhost:3001/api/';

  // movies paths
  static const String login = 'user/sign-in';

  static String getMovieDetailsPath(int movieId) {
    return '$baseUrl/movie/$movieId?api_key=$apiKey&append_to_response=videos,credits,reviews,similar';
  }

  static String getAllPopularMoviesPath(int page) {
    return '$baseUrl/movie/popular?api_key=$apiKey&page=$page';
  }

  static String getAllTopRatedMoviesPath(int page) {
    return '$baseUrl/movie/top_rated?api_key=$apiKey&page=$page';
  }

  // tv shows paths
  static const String onAirTvShowsPath =
      '$baseUrl/tv/on_the_air?api_key=$apiKey&with_original_language=en';

  static const String popularTvShowsPath =
      '$baseUrl/tv/popular?api_key=$apiKey&with_original_language=en';

  static const String topRatedTvShowsPath =
      '$baseUrl/tv/top_rated?api_key=$apiKey&with_original_language=en';

  static String getTvShowDetailsPath(int tvShowId) {
    return '$baseUrl/tv/$tvShowId?api_key=$apiKey&append_to_response=similar,videos';
  }

  static String getAllPopularTvShowsPath(int page) {
    return '$baseUrl/tv/popular?api_key=$apiKey&page=$page&with_original_language=en';
  }

  static String getAllTopRatedTvShowsPath(int page) {
    return '$baseUrl/tv/top_rated?api_key=$apiKey&page=$page&with_original_language=en';
  }

  // search paths
  static String getSearchPath(String title) {
    return '$baseUrl/search/multi?api_key=$apiKey&query=$title';
  }
}
