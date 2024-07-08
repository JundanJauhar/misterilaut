float[] xPositions_9;
float yPosition_9;
float stepSize_9 = 5;
float oscillationAmplitude_9 = 5; // Amplitudo gerakan naik turun
float oscillationSpeed_9 = 0.1;   // Kecepatan gerakan naik turun
float oscillationAngle_9 = 0;     // Sudut untuk fungsi sinus


void scene_9() {
 yPosition_9 = height * 0.94;
  xPositions_9 = new float[] {width * 0.53, width * 0.68, width * 0.82, width * 0.05};
  
  background(70, 130, 180); // Langit

  // Menggambar desa
  drawVillage_9();

  // Menggambar anak-anak
  drawChildren_9();
  
  // Update posisi anak-anak
  updatePositions_9();
}

void drawVillage_9() {
  // Tanahfr
  fill(34, 139, 34);
  rect(0, height * 0.56, width, height * 0.44);

  // Rumah pertama
  drawHouse_9(width * 0.08, height * 0.42);

  // Rumah kedua
  drawHouse_9(width * 0.27, height * 0.42);

  // Pohon
  fill(139, 69, 19);
  rect(width * 0.23, height * 0.35, width * 0.016, height * 0.21);
  fill(34, 139, 34);
  ellipse(width * 0.23 + width * 0.008, height * 0.35, width * 0.078, height * 0.14);

  // Matahari
  fill(255, 223, 0);
  ellipse(width * 0.55, height * 0.14, width * 0.06, height * 0.11);

  // Awan
  drawCloud_9(width * 0.12, height * 0.14);
  drawCloud_9(width * 0.39, height * 0.21);

  // Rumput
  for (int i = 0; i < width; i += 10) {
    drawGrass_9(i, height * 0.58);
  }
}

void drawChildren_9() {
  for (int i = 0; i < xPositions_9.length; i++) {
    float currentY = yPosition_9;
    // Jika ini adalah anak pertama, tambahkan gerakan osilasi
    if (i == 0) {
      currentY += oscillationAmplitude_9 * sin(oscillationAngle_9);
    }

    // Hanya menggambar anak jika posisi x lebih besar dari 0
    if (xPositions_9[i] > 0) {
      if (i == 3) {
        drawChildFacingRight_9(xPositions_9[i], currentY, xPositions_9[i], currentY - height * 0.145, xPositions_9[i] + width * 0.023, currentY - height * 0.16, xPositions_9[i] + width * 0.023, currentY - height * 0.2, xPositions_9[i] + width * 0.023, currentY - height * 0.1);
      } else {
        drawChild_9(xPositions_9[i], currentY, xPositions_9[i], currentY - height * 0.145, xPositions_9[i] - width * 0.023, currentY - height * 0.16, xPositions_9[i] - width * 0.023, currentY - height * 0.2, xPositions_9[i] - width * 0.023, currentY - height * 0.1);
      }
    }
  }

  // Update sudut osilasi untuk anak pertama
  oscillationAngle_9 += oscillationSpeed_9;
}

void drawChild_9(float bodyX, float bodyY, float headX, float headY, float eyeX, float eyeY, float eyebrowX, float eyebrowY, float mouthX, float mouthY) {
  // badan
  fill(255, 255, 255);
  ellipse(bodyX, bodyY, width * 0.04, height * 0.14);

  // kepala
  fill(140, 88, 9);
  ellipse(headX, headY, width * 0.113, height * 0.182);

  // mata
  fill(255, 255, 255);
  ellipse(eyeX, eyeY, width * 0.023, height * 0.056);

  // alis
  fill(255, 255, 255);
  ellipse(eyebrowX, eyebrowY, width * 0.038, height * 0.014);

  // mulut
  fill(255, 255, 255);
  ellipse(mouthX, mouthY, width * 0.023, height * 0.004);
}

void drawChildFacingRight_9(float bodyX, float bodyY, float headX, float headY, float eyeX, float eyeY, float eyebrowX, float eyebrowY, float mouthX, float mouthY) {
  // badan
  fill(255, 255, 255);
  ellipse(bodyX, bodyY, width * 0.04, height * 0.14);

  // kepala
  fill(140, 88, 9);
  ellipse(headX, headY, width * 0.113, height * 0.182);

  // mata
  fill(255, 255, 255);
  ellipse(eyeX, eyeY, width * 0.023, height * 0.056);

  // alis
  fill(255, 255, 255);
  ellipse(eyebrowX, eyebrowY, width * 0.038, height * 0.014);

  // mulut
  fill(255, 255, 255);
  ellipse(mouthX, mouthY, width * 0.023, height * 0.004);
}

void drawHouse_9(float x, float y) {
  fill(42, 75, 125);
  rect(x, y, width * 0.106, height * 0.14);
  fill(255, 255, 255);
  triangle(x - width * 0.015, y, x + width * 0.053, y - height * 0.14, x + width * 0.117, y);
  fill(255, 255, 255);
  rect(x + width * 0.015, y + height * 0.042, width * 0.03, height * 0.07);
  fill(255, 255, 255);
  rect(x + width * 0.06, y + height * 0.042, width * 0.03, height * 0.1);
}

void drawCloud_9(float x, float y) {
  fill(255);
  noStroke();
  ellipse(x, y, width * 0.05, height * 0.08);
  ellipse(x + width * 0.03, y, width * 0.05, height * 0.08);
  ellipse(x + width * 0.015, y - height * 0.03, width * 0.05, height * 0.08);
}

void drawGrass_9(float x, float y) {
  stroke(34, 139, 34);
  strokeWeight(2);
  for (int i = 0; i < 5; i++) {
    line(x + i * 4, y, x + i * 4 + random(-5, 5), y - height * 0.028 - random(0, height * 0.014));
  }
  noStroke();
}

void updatePositions_9() {
  for (int i = 0; i < xPositions_9.length; i++) {
    // Cek jika ini bukan anak keempat
    if (i != 3) {
      // Cek apakah posisi x sudah mencapai atau kurang dari 500
      if (xPositions_9[i] > 500) {
        xPositions_9[i] -= stepSize_9;  // Mengurangi nilai x untuk bergerak ke kiri
      }
    }
    
    // Hapus anak jika posisi x lebih kecil dari 0
    if (xPositions_9[i] < 0) {
      xPositions_9[i] = -100;  // Menetapkan nilai yang tidak akan digambar lagi
    }
  }
}
