


void Scene_8() {
  frameRate(30);   // Kecepatan frame
  
  cloudX1 = 100;
  cloudX2 = 300;
  cloudX3 = 500;
  cloudX4 = 700;
  
  // Inisialisasi posisi anak
  childX = width * 0.75;
  childY = boatY; // Anak tenggelam setinggi kapal
}

// Fungsi draw() dijalankan berulang kali untuk membuat animasi
void scene_8() {
  background(135, 206, 235);  // Warna langit

  // Menggambar anak tenggelam
  drawChild_8(childX, childY);

  // Menggambar awan
  drawCloud_8(cloudX1, 100, 80);
  drawCloud_8(cloudX2, 150, 90);
  drawCloud_8(cloudX3, 200, 70);
  drawCloud_8(cloudX4, 120, 100);

  // Menggambar laut dengan efek ombak
  drawOcean_8();

  // Menggerakkan awan miring ke kanan
  cloudX1 += 0.5;
  cloudX2 += 0.6;
  cloudX3 += 0.7;
  cloudX4 += 0.8;

  // Jika awan keluar dari layar, kembali ke kiri
  if (cloudX1 > width) cloudX1 = -200;
  if (cloudX2 > width) cloudX2 = -200;
  if (cloudX3 > width) cloudX3 = -200;
  if (cloudX4 > width) cloudX4 = -200;

  // Menggerakkan efek ombak
  waveOffset += waveSpeed;

  // Animasi naik turun saat anak tenggelam
  childY = boatY + map(noise(frameCount * 0.02), 0, 1, -20, 20);
}

// Fungsi untuk menggambar laut dengan efek ombak
void drawOcean_8() {
  noStroke();
  // Warna laut biru tua dengan efek ombak
  fill(#2a93d5);
  
  // Menggambar ombak dengan loop
  beginShape();
  vertex(0, height / 2);  // Titik awal di kiri bawah
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(x * 0.01 + waveOffset), 0, 1, height / 2 + 50, height / 2 + 150);
    vertex(x, y);
  }
  vertex(width, height);  // Titik akhir di kanan bawah
  vertex(width, height);  // Titik tambahan untuk penutup
  vertex(0, height);      // Titik tambahan untuk penutup
  endShape(CLOSE);
}

void drawChild_8(float x, float y) {
  // Badan anak
  fill(255, 255, 255);
  ellipse(x, y, 30, 60);
  
  // Kepala anak
  fill(140, 88, 9);
  ellipse(x, y - 40, 40, 40);
  
  // Mata anak
  fill(255, 255, 255);
  ellipse(x - 10, y - 40, 10, 10);
  
  // Alis anak
  fill(0, 0, 0);
  ellipse(x - 10, y - 50, 15, 5);
  
  // Mulut anak
  fill(255, 0, 0);
  ellipse(x - 10, y - 30, 10, 8);

  // Tangan anak diangkat di atas
  stroke(140, 88, 9);
  strokeWeight(5);
  // Tangan kiri
  line(x - 15, y - 20, x - 30, y - 60);
  // Tangan kanan
  line(x + 15, y - 20, x + 30, y - 60);
  noStroke();  // Menghapus garis batas
}

// Fungsi untuk menggambar awan
void drawCloud_8(float x, float y, float size) {
  fill(255);
  noStroke();
  ellipse(x, y, size, size);
  ellipse(x - size / 2, y + size / 4, size, size);
  ellipse(x - size / 4, y + size / 3, size, size);
  ellipse(x - size / 3, y + size / 5, size, size);
}
