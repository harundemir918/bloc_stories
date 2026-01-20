/**
 * Simple Story App Backend
 * Bu sunucu, hikaye verilerini Flutter uygulamasına servis etmek için tasarlanmıştır.
 * Eğitim amaçlı olduğu için oldukça basit ve anlaşılır tutulmuştur.
 */

const express = require('express');
const cors = require('cors');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = 3000;

// CORS politikasını etkinleştiriyoruz (Flutter web veya farklı portlardan erişim için)
app.use(cors());

// URL-encoded ve JSON gövdelerini işleyebilmek için middleware'ler
app.use(express.json());

// Hikaye verilerini dosyadan okuyan yardımcı fonksiyon
const getStories = () => {
  try {
    const data = fs.readFileSync(path.join(__dirname, 'data', 'stories.json'), 'utf8');
    return JSON.parse(data);
  } catch (error) {
    console.error('Hikayeler okunurken hata oluştu:', error);
    return [];
  }
};

/**
 * ROTA: [GET] /api/stories
 * Tüm hikayelerin listesini döner.
 */
app.get('/api/stories', (req, res) => {
  const stories = getStories();
  // Statik Nesne (Map) sarmalayıcı kullanarak yanıt dönüyoruz
  res.status(200).json({
    status: 200,
    message: 'Hikayeler başarıyla getirildi.',
    data: {
      stories: stories,
      totalCount: stories.length
    }
  });
});

/**
 * ROTA: [GET] /api/stories/:id
 * Belirli bir ID'ye sahip hikayenin detaylarını döner.
 */
app.get('/api/stories/:id', (req, res) => {
  const stories = getStories();
  const story = stories.find(s => String(s.id) === req.params.id);

  if (story) {
    res.status(200).json({
      status: 200,
      message: 'Hikaye detayı başarıyla getirildi.',
      data: {
        story: story
      }
    });
  } else {
    res.status(404).json({
      status: 404,
      message: 'Hikaye bulunamadı!',
      data: null
    });
  }
});

/**
 * Sunucuyu başlatıyoruz
 */
app.listen(PORT, () => {
  console.log(`Sunucu http://localhost:${PORT} adresinde çalışıyor...`);
});
