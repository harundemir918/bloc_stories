import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../models/story_model.dart';

/// Hikaye verilerini (liste ve detay) API'den çeken veri kaynağı arayüzü.
abstract class StoriesRemoteDataSource {
  Future<List<StoryModel>> getStories();
  Future<StoryModel> getStoryDetail(String id);
}

/// [StoriesRemoteDataSource] arayüzünün Dio ile gerçekleştirimi.
class StoriesRemoteDataSourceImpl implements StoriesRemoteDataSource {
  final Dio dio;

  StoriesRemoteDataSourceImpl(this.dio);

  @override
  Future<List<StoryModel>> getStories() async {
    try {
      const url = 'http://10.0.2.2:3000/api/stories';
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> storiesJson = responseData['data']['stories'];
        return storiesJson.map((json) => StoryModel.fromJson(json)).toList();
      } else {
        throw ServerException('Hikayeler getirilemedi: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Ağ hatası oluştu.');
    } catch (e) {
      throw ServerException('Beklenmedik bir hata oluştu: $e');
    }
  }

  @override
  Future<StoryModel> getStoryDetail(String id) async {
    try {
      final url = 'http://10.0.2.2:3000/api/stories/$id';
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final Map<String, dynamic> storyJson = responseData['data']['story'];
        return StoryModel.fromJson(storyJson);
      } else {
        throw ServerException(
          'Hikaye detayı getirilemedi: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Ağ hatası oluştu.');
    } catch (e) {
      throw ServerException('Beklenmedik bir hata oluştu: $e');
    }
  }
}
