float sunkenChildX = 960;  // Posisi X anak lebih ke tengah
float sunkenChildY = 1000;  // Posisi Y anak lebih bawah

// Posisi monster laut dan rajanya
float monsterX = 1260;  // Disesuaikan agar lebih ke tengah
float monsterY = 1080; // Ditarik lebih ke bawah sehingga hanya terlihat wajahnya
float kingMonsterX = 660;  // Disesuaikan agar lebih ke tengah
float kingMonsterY = 1080; // Ditarik lebih ke bawah sehingga hanya terlihat wajahnya

float mouthHeight = 30;  // Tinggi mulut awal
float mouthDirection = 1;  // Arah perubahan tinggi mulut (1 untuk naik, -1 untuk turun)

void scene_6() {
  size(1920, 1080);  // Mengatur ukuran frame

  background(10, 50, 100); // Warna biru gelap untuk laut

  // Menggambar anak yang tenggelam
  drawSunkenChild(sunkenChildX, sunkenChildY);
  
  // Menggambar monster laut dan rajanya di atas anak
  drawSeaMonster(monsterX, monsterY);
  drawKingSeaMonster(kingMonsterX, kingMonsterY);

  // Menggambar pasir di dasar laut
  drawSand();
  
  // Menggambar karang di sekitar laut
  drawCoral();
  
  // Menggambar rumput laut di sekitar karang
  drawSeaweed();
  
  // Mengatur gerakan mulut naik-turun
  if (mouthHeight >= 40 || mouthHeight <= 10) {
    mouthDirection *= -1;  // Mengubah arah saat mencapai batas atas atau bawah
  }
  mouthHeight += 0.5 * mouthDirection;  // Kecepatan perubahan tinggi mulut
  
  // Menggambar mulut yang bergerak naik-turun
  drawMouth(sunkenChildX, sunkenChildY - 50, mouthHeight);
}

void drawSunkenChild(float x, float y) {
  // badan
  fill(255, 255, 255);
  ellipse(x, y, 80, 160);  // Ukuran badan diperbesar
  
  // kepala
  fill(140, 88, 9);
  ellipse(x, y - 120, 200, 180);  // Ukuran kepala diperbesar

  // mata
  fill(255, 255, 255);
  ellipse(x - 30, y - 92, 30, 40);  // Mata kiri
  ellipse(x + 30, y - 92, 30, 40);  // Mata kanan

  // alis (diganti dengan lengkungan ke bawah)
  noFill();
  stroke(0);
  strokeWeight(3);
  arc(x - 30, y - 110, 50, 20, PI, TWO_PI);  // Alis kiri
  arc(x + 30, y - 110, 50, 20, PI, TWO_PI);  // Alis kanan
  
  // Menggambar mulut
  drawMouth(x, y - 50, mouthHeight);
}

void drawMouth(float x, float y, float height) {
  noFill();
  stroke(255);
  strokeWeight(3);
  ellipse(x, y, 70, height);  // Lingkaran yang mengatur tinggi mulut
}

void drawSeaMonster(float x, float y) {
  fill(0, 100, 0);
  ellipse(x, y - 150, 100, 200); // Ditarik ke atas sehingga hanya terlihat wajah

  fill(0, 80, 0);
  ellipse(x, y - 250, 150, 100);

  fill(255, 0, 0);
  ellipse(x - 30, y - 260, 30, 30);
  ellipse(x + 30, y - 260, 30, 30);

  fill(0);
  ellipse(x - 30, y - 260, 10, 10);
  ellipse(x + 30, y - 260, 10, 10);
}

void drawKingSeaMonster(float x, float y) {
  fill(0, 50, 0);
  ellipse(x, y - 225, 150, 300); // Ditarik ke atas sehingga hanya terlihat wajah

  fill(0, 40, 0);
  ellipse(x, y - 375, 200, 150);

  fill(255, 0, 0);
  ellipse(x - 40, y - 385, 40, 40);
  ellipse(x + 40, y - 385, 40, 40);

  fill(0);
  ellipse(x - 40, y - 385, 15, 15);
  ellipse(x + 40, y - 385, 15, 15);
}

void drawSand() {
  // Menggambar pasir di dasar laut
  noStroke();
  fill(194, 178, 128);  // Warna kuning kecoklatan untuk pasir
  for (int i = 0; i < width; i += 20) {
    ellipse(i, height * 0.85 + random(-5, 5), 15, 10);  // Efek pasir dengan bentuk elips acak
  }
}

void drawCoral() {
  // Menggambar karang di sekitar laut
  fill(232, 111, 91);  // Warna oranye untuk karang
  ellipse(width * 0.2, height * 0.5, 150, 200);   // Karang pertama
  ellipse(width * 0.8, height * 0.6, 120, 180);   // Karang kedua
  
  // Detail tambahan pada karang
  fill(244, 162, 97);  // Warna lebih terang untuk detail
  ellipse(width * 0.2 + 50, height * 0.5 - 30, 60, 80);   // Detail karang pertama
  ellipse(width * 0.8 - 40, height * 0.6 + 20, 40, 60);   // Detail karang kedua
}

void drawSeaweed() {
  // Menggambar rumput laut di sekitar karang
  stroke(39, 174, 96);  // Warna hijau untuk rumput laut
  strokeWeight(3);
  for (int i = 0; i < width; i += 50) {
    line(i, height * 0.75, i + random(-10, 10), height * 0.65);  // Efek rumput laut dengan pergerakan acak
  }
}
