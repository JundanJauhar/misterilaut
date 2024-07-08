// Fungsi setup() dijalankan sekali saat program dimulai
void Scene_4() {
  size(1280, 720);  // Ukuran kanvas
  frameRate(30);   // Kecepatan frame
  
  // Inisialisasi posisi awan
  cloudX1 = 100;
  cloudX2 = 300;
  cloudX3 = 500;
  cloudX4 = 700;
  
  // Inisialisasi posisi anak
  childX = width * 0.75;
  childY = boatY; // Anak tenggelam setinggi kapal

  // Inisialisasi posisi kapal
  boatX = 0;  // Kapal mulai dari posisi x=0
  boatY = height * 0.6;  // Posisi kapal lebih rendah di laut
}

// Fungsi draw() dijalankan berulang kali untuk membuat animasi
void scene_4() {
  background(135, 206, 235);  // Warna langit

  // Menggambar anak Tenggelam
  drawChild(childX, childY);

  // Menggambar kapal
  drawBoat(boatX, boatY);

  // Menggambar awan
  drawCloud(cloudX1, 100, 80);
  drawCloud(cloudX2, 150, 90);
  drawCloud(cloudX3, 200, 70);
  drawCloud(cloudX4, 120, 100);

  // Menggambar laut dengan efek ombak
  drawOcean();

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

  // Animasi naik turun saat anak Tenggelam
  childY = boatY + map(noise(frameCount * 0.02), 0, 1, -20, 20);

  // Animasi naik turun kapal di laut
  boatY = height * 0.61 + map(noise(frameCount * 0.01), 0, 1, -10, 10);

  // Pergerakan kapal dari kiri ke kanan
  if (!pickingUpChild && boatX < childX - 100) { // Kapal berhenti ketika mendekati anak di pasir
    boatX += boatSpeed;
  } else if (boatX >= childX - 100) { // Ketika kapal mencapai anak, status menjemput diaktifkan
    pickingUpChild = true;
  }

  // Jika kapal mencapai anak tenggelam, kapal berhenti
  if (pickingUpChild && boatX >= childX - 100) {
    boatX = childX - 100; // Atur posisi kapal persis di depan anak tenggelam
    pickingUpChild = false; // Reset status menjemput karena kapal berhenti
  }

  // Jika menjemput anak, kapal kembali ke kiri
  if (pickingUpChild && boatX > 0) {
    boatX -= boatSpeed;
  } else if (pickingUpChild && boatX <= 0) {
    pickingUpChild = false; // Reset status menjemput ketika kapal kembali ke posisi awal
    boatX = 0;
  }
}


  

  


 

  // Pergerakan kapal dari kiri ke kanan

// Fungsi untuk menggambar laut dengan efek ombak
void drawOcean() {
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


  


void drawChild(float x, float y) {
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



// Fungsi untuk menggambar anak di atas kapal dengan mirroring
void drawChildOnBoat(float x, float y) {
  // Badan anak
  fill(255, 255, 255);
  ellipse(x, y, 30, 60);
  
  // Kepala anak
  fill(140, 88, 9);
  ellipse(x, y - 40, 40, 40);
  
  // Mata anak (mirroring)
  fill(255, 255, 255);
  ellipse(x + 10, y - 40, 10, 10);
  
  // Alis anak (mirroring)
  fill(0, 0, 0);
  ellipse(x + 10, y - 50, 15, 5);
  
  // Mulut anak (mirroring)
  fill(255, 0, 0);
  ellipse(x + 10, y - 30, 10, 5);
}

// Fungsi untuk menggambar kapal
void drawBoat(float x, float y) {
  fill(139, 69, 19);
  beginShape();
  vertex(x - 100, y);
  vertex(x + 100, y);
  vertex(x + 60, y + 40);
  vertex(x - 60, y + 40);
  endShape(CLOSE);

  // Menggambar anak di atas kapal
  drawChildOnBoat(x, y - 28);
}

// Fungsi untuk menggambar awan
void drawCloud(float x, float y, float size) {
  fill(255);
  noStroke();
  ellipse(x, y, size, size);
  ellipse(x - size / 2, y + size / 4, size, size);
  ellipse(x - size / 4, y + size / 3, size, size);
  ellipse(x - size / 3, y + size / 5, size, size);
}
