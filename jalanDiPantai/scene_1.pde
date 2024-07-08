float sunY_1; // Posisi awal matahari
float sunSize;
color sunColor = color(255, 223, 0); // Warna matahari
color skyColor = color(191, 161, 3); // Warna awal langit
float speed; // Kecepatan matahari naik

void scene_1() {
  // Hitung perubahan warna langit berdasarkan posisi matahari
  float lerpFactor = map(sunY_1, height, height * 0.1, 0, 1);
  skyColor = lerpColor(color(191, 161, 3), color(70, 130, 180), lerpFactor);

  // Gambar latar belakang langit
  background(skyColor);

  // Menggambar desa
  drawVillage_1();

  // Menggambar matahari
  fill(sunColor);
  ellipse(width * 0.875, sunY_1, sunSize, sunSize);

  // Matahari bergerak naik
  sunY_1 -= speed;
  if (sunY_1 < height * 0.1) {
    sunY_1 = height * 0.1; // Matahari berhenti di posisi tertentu
  }
}

void drawVillage_1() {
  // Tanah
  fill(34, 139, 34);
  rect(0, height * 0.67, width, height * 0.33);
  
  // Rumah pertama
  fill(42, 75, 125);
  rect(width * 0.125, height * 0.5, width * 0.17, height * 0.17);
  fill(255, 255, 255);
  triangle(width * 0.1, height * 0.5, width * 0.2125, height * 0.33, width * 0.3125, height * 0.5);
  fill(255, 255, 255);
  rect(width * 0.15, height * 0.55, width * 0.05, height * 0.08);
  fill(255, 255, 255);
  rect(width * 0.225, height * 0.55, width * 0.05, height * 0.12);
  
  // Rumah kedua
  fill(42, 75, 125);
  rect(width * 0.4375, height * 0.5, width * 0.17, height * 0.17);
  fill(255, 255, 255);
  triangle(width * 0.4125, height * 0.5, width * 0.525, height * 0.33, width * 0.625, height * 0.5);
  fill(255, 255, 255);
  rect(width * 0.4625, height * 0.55, width * 0.05, height * 0.08);
  fill(255, 255, 255);
  rect(width * 0.5375, height * 0.55, width * 0.05, height * 0.12);
  
  // Pohon
  fill(139, 69, 19);
  rect(width * 0.375, height * 0.42, width * 0.025, height * 0.25);
  fill(34, 139, 34);
  ellipse(width * 0.3875, height * 0.42, width * 0.125, height * 0.17);
  
  // Awan
  drawCloud_1(width * 0.1875, height * 0.167);
  drawCloud_1(width * 0.625, height * 0.25);
  
  // Rumput
  for (int i = 0; i < width; i += width * 0.0125) {
    rumput(i, height * 0.7);
  }
}

void drawCloud_1(float x, float y) {
  fill(255);
  noStroke();
  ellipse(x, y, width * 0.075, height * 0.1);
  ellipse(x + width * 0.05, y, width * 0.075, height * 0.1);
  ellipse(x + width * 0.025, y - height * 0.033, width * 0.075, height * 0.1);
}

void rumput(float x, float y) {
  stroke(34, 139, 34);
  strokeWeight(2);
  for (int i = 0; i < 5; i++) {
    line(x + i * width * 0.005, y, x + i * width * 0.005 + random(-5, 5), y - height * 0.033 - random(0, height * 0.017));
  }
  noStroke();
}
