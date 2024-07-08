int t=1;
PFont f;

// Variabel untuk menyimpan posisi awan
float cloudX1, cloudX2, cloudX3, cloudX4;

// Variabel untuk animasi ombak
float waveOffset = 0;
float waveSpeed = 0.02;

// Variabel untuk menyimpan posisi anak
float childX, childY;

// Variabel untuk posisi kapal
float boatX, boatY;
float boatSpeed = 5;  // Kecepatan kapal

boolean pickingUpChild = false; // Status untuk mengecek apakah kapal sedang menjemput anak

void setup() {
  size(1920, 1080);
  f = createFont("Arial Bold", 50, true); // Menyesuaikan ukuran font sesuai kebutuhan

  // Inisialisasi posisi awan
  cloudX1 = 100;
  cloudX2 = 300;
  cloudX3 = 500;
  cloudX4 = 700;

  // Inisialisasi posisi anak
  childX = width * 0.75;
  childY = height * 0.7;

  // Inisialisasi posisi kapal
  boatX = 0;  // Kapal mulai dari posisi x=0
  boatY = height * 0.6;  // Posisi kapal lebih rendah di laut
}

void draw() {
  int t = millis() / 1000; // Menghitung waktu dalam detik
  
  // Pemanggilan scene berdasarkan waktu
 if (t >= 0 && t < 3) {
  scene_1();
}
else if (t >= 3 && t < 6) {
  scene_2();
}
else if (t >= 6 && t < 9) {
  scene_3();
}
else if (t >= 9 && t < 12) {
  scene_8(); 
}
else if (t >= 12 && t < 15) {
  scene_5();  
}
else if (t >= 15 && t < 18) {
  scene_4();  
}
else if (t >= 18 && t < 21) {
  scene_6();  
}
else if (t >= 21 && t < 24) {
  scene_7();  
}
else if (t >= 24 && t < 27) {
  scene_9();
}

  // Tampilkan waktu yang berjalan di layar
  fill(0);
  textFont(f);
  textAlign(CENTER);

  // Keluar dari program setelah melewati waktu tertentu
  if (t >= 152) {
    exit();
  }
}
