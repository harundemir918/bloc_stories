import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../models/story_model.dart';

/// Dış kaynaklarla (API) iletişim kuran arayüz.
abstract class HomeRemoteDataSource {
  Future<List<StoryModel>> getStories();
}

/// [HomeRemoteDataSource] arayüzünün Dio paketi ile gerçekleştirimi.
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<StoryModel>> getStories() async {
    try {
      // Android emülatörü için 10.0.2.2 adresini kullanıyoruz.
      // Eğer bir config dosyanız varsa oradan çekmek daha iyidir.
      const url = 'http://10.0.2.2:3000/api/stories';

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        // Sunucu yanıt formatımız: { "status": 200, "message": "...", "data": { "stories": [] } }
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> storiesJson = responseData['data']['stories'];

        return storiesJson.map((json) => StoryModel.fromJson(json)).toList();
      } else {
        throw ServerException('Sunucu hatası: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Dio hatalarını yakalayıp özel bir mesajla fırlatıyoruz
      throw ServerException(e.message ?? 'Bilinmeyen bir ağ hatası oluştu.');
    } catch (e) {
      throw ServerException('Beklenmedik bir hata oluştu: $e');
    }
  }
}
