import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../../../home/data/models/story_model.dart';

/// Hikaye detaylarını API'den çeken veri kaynağı arayüzü.
abstract class DetailRemoteDataSource {
  Future<StoryModel> getStoryDetail(String id);
}

/// [DetailRemoteDataSource] arayüzünün Dio ile gerçekleştirimi.
class DetailRemoteDataSourceImpl implements DetailRemoteDataSource {
  final Dio dio;

  DetailRemoteDataSourceImpl(this.dio);

  @override
  Future<StoryModel> getStoryDetail(String id) async {
    try {
      final url = 'http://10.0.2.2:3000/api/stories/$id';
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        // Yanıt formatı: { "data": { "story": { ... } } }
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
