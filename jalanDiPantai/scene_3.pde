float[] xPositions;
float yPosition;
float stepSize = 2;
float oscillationAmplitude = 5; // Amplitudo gerakan naik turun
float oscillationSpeed = 0.1;   // Kecepatan gerakan naik turun
float oscillationAngle = 0;     // Sudut untuk fungsi sinus

// Variabel untuk posisi matahari
float sunX_3;
float sunY_3;

// Variabel untuk posisi awan
float cloud1X;
float cloud2X;

// Variabel untuk posisi orang yang diminta tolong
float personX;
float personY;

// Variabel untuk gelombang laut
float waveAmplitude = 30;  // Amplitudo gelombang
float waveFrequency = 0.02; // Frekuensi gelombang
   // Offset gelombang





void Scene_3() {
      size(1920, 1080);

    yPosition = height * 0.94;
    xPositions = new float[] {width * 0.53, width * 0.68, width * 0.82};
    sunX_3 = width * 0.55;
    sunY_3 = height * 0.17;
    cloud1X = width * 0.12;
    cloud2X = width * 0.39;
    personX = width * 0.4;
    personY = height * 0.75;
}

void scene_3() {
    background(135, 206, 235); // Langit

    // Menggambar pantai miring
    drawTiltedBeach();

    // Menggambar anak-anak
    drawChildren();
    
    // Menggambar matahari
    drawSun();

    // Menggambar dan menggerakkan awan
    drawCloud(cloud1X, height * 0.14);
    drawCloud(cloud2X, height * 0.21);
    
    // Menggambar orang yang diminta tolong
    drawPerson(personX, personY);
    
    // Menggerakkan awan ke kanan
    cloud1X += 1;
    cloud2X += 1;
    
    // Jika awan keluar dari layar, kembali ke kiri
    if (cloud1X > width) cloud1X = -100;
    if (cloud2X > width) cloud2X = -100;
    
    // Update posisi anak-anak
    updatePositions();
}

void drawTiltedBeach() {
    // Menggambar laut bergelombang
    drawWavySea();

    // Warna pasir
    fill(238, 214, 175);
    beginShape();
    vertex(0, height);      // Titik awal di kiri bawah
    vertex(width, height);  // Titik akhir di kanan bawah
    vertex(width, height / 2);  // Titik di atas tengah
    endShape(CLOSE);
}

void drawWavySea() {
    fill(22, 128, 180);
    beginShape();
    for (int x = 0; x <= width; x += 10) {
        float y = height / 2 + waveAmplitude * sin((x * waveFrequency) - waveOffset);
        vertex(x, y);
    }
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
    
    // Update offset gelombang untuk animasi
    waveOffset += waveSpeed;
}

void drawChildren() {
    for (int i = 0; i < xPositions.length; i++) {
        float currentY = yPosition;
        // Jika ini adalah anak pertama, tambahkan gerakan osilasi
        if (i == 0) {
            currentY += oscillationAmplitude * sin(oscillationAngle);
        }

        // Hanya menggambar anak jika posisi x lebih besar dari 0
        if (xPositions[i] > 0) {
            drawChild(xPositions[i], currentY, xPositions[i], currentY - height * 0.145, xPositions[i] - width * 0.023, currentY - height * 0.16, xPositions[i] - width * 0.023, currentY - height * 0.2, xPositions[i] - width * 0.023, currentY - height * 0.1);
        }
    }

    // Update sudut osilasi untuk anak pertama
    oscillationAngle += oscillationSpeed;
}

void drawChild(float bodyX, float bodyY, float headX, float headY, float eyeX, float eyeY, float eyebrowX, float eyebrowY, float mouthX, float mouthY) {
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
    fill(255, 0, 0);
    ellipse(mouthX, mouthY, width * 0.023, height * 0.042);
}

void updatePositions() {
    // Hanya perbarui posisi anak pertama
    if (xPositions[0] > 0) {
        xPositions[0] -= stepSize;  // Mengurangi nilai x untuk bergerak ke kiri
        
        // Hapus anak jika posisi x lebih kecil dari 0
        if (xPositions[0] < 0) {
            xPositions[0] = -100;  // Menetapkan nilai yang tidak akan digambar lagi
        }
    }
}

void drawSun() {
    // Matahari
    fill(255, 223, 0);
    ellipse(sunX_3, sunY_3, width * 0.06, height * 0.11);
}

void drawCloud(float x, float y) {
    fill(255);
    noStroke();
    ellipse(x, y, width * 0.05, height * 0.08);
    ellipse(x + width * 0.03, y, width * 0.05, height * 0.08);
    ellipse(x + width * 0.015, y - height * 0.03, width * 0.05, height * 0.08);
}

void drawPerson(float x, float y) {
    // Badan orang
    fill(255, 204, 0);
    rect(x - width * 0.02, y, width * 0.04, height * 0.12);
    
    // Kepala
    fill(255, 204, 0);
    ellipse(x, y - height * 0.03, width * 0.08, height * 0.08);
    
    // Mata
    fill(0);
    ellipse(x - width * 0.02, y - height * 0.04, width * 0.02, height * 0.02);
    ellipse(x + width * 0.02, y - height * 0.04, width * 0.02, height * 0.02);
    
    // Mulut
    fill(255, 0, 0);
    rect(x - width * 0.01, y - height * 0.01, width * 0.02, height * 0.01);
}
