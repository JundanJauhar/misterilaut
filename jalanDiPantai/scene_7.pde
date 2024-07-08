void scene_7() {
    size(1920, 1080);

    // Atur warna latar belakang (biru muda untuk dinding)
    background(173, 216, 230);
    
    // Gambar lantai
    fill(139, 69, 19);  // Warna coklat untuk lantai
    rect(0, height * 0.75, width, height * 0.25);
    
    // Gambar jendela
    fill(255);  // Warna putih untuk jendela
    rect(width * 0.7, height * 0.2, width * 0.2, height * 0.3);
    
    // Gambar bingkai jendela
    stroke(0);  // Warna hitam untuk garis
    line(width * 0.7, height * 0.35, width * 0.9, height * 0.35);
    line(width * 0.8, height * 0.2, width * 0.8, height * 0.5);
    
    // Gambar pintu
    fill(139, 69, 19);  // Warna coklat untuk pintu
    rect(width * 0.05, height * 0.4, width * 0.15, height * 0.35);
    
    // Gambar kenop pintu
    fill(255, 223, 0);  // Warna kuning untuk kenop pintu
    ellipse(width * 0.17, height * 0.575, width * 0.01, height * 0.02);
    
    // Gambar bingkai tempat tidur
    fill(139, 69, 19);  // Warna coklat untuk bingkai tempat tidur
    rect(width * 0.5, height * 0.75, width * 0.4, height * 0.2);  // Kasur lebih rendah
    
    // Gambar kasur
    fill(255, 255, 255);  // Warna putih untuk kasur
    rect(width * 0.5, height * 0.775, width * 0.4, height * 0.15);  // Posisi kasur lebih rendah
    
    // Gambar bantal
    fill(200);  // Warna abu-abu muda untuk bantal
    rect(width * 0.52, height * 0.725, width * 0.1, height * 0.05);
    rect(width * 0.63, height * 0.725, width * 0.1, height * 0.05);
    
    // Gambar selimut
    fill(255, 0, 0);  // Warna merah untuk selimut
    rect(width * 0.5, height * 0.825, width * 0.4, height * 0.1);  // Selimut lebih rendah
    
    // Gambar anak yang berbaring di kasur (dengan tubuh)
    drawChildWithBody(width * 0.7, height * 0.75, 120, true, 0); // Anak di kasur lebih tinggi
    
    // Gambar anak-anak yang menjenguk
    float headSize = 150; // Ukuran kepala anak-anak yang sedang menjenguk (diperbesar)
    
    drawChildFacingRight(width * 0.2, height * 0.85, headSize);  // Posisi anak pertama yang menjenguk (lebih rendah)
    drawChildFacingRight(width * 0.35, height * 0.85, headSize); // Posisi anak kedua yang menjenguk (lebih rendah)
    drawChildFacingRight(width * 0.5, height * 0.85, headSize);  // Posisi anak ketiga yang menjenguk (lebih rendah)
}

void drawChildWithBody(float x, float y, float headSize, boolean isLyingDown, int faceType) {
    // Gambar kepala
    fill(140, 88, 9);  // Warna kulit untuk kepala
    ellipse(x, y, headSize, headSize);  // Kepala
    
    if (faceType == 0) {
        // Gambar mata
        fill(255);  // Warna putih untuk mata
        ellipse(x - headSize * 0.2, y - headSize * 0.1, headSize * 0.2, headSize * 0.2);  // Mata kiri
        ellipse(x + headSize * 0.2, y - headSize * 0.1, headSize * 0.2, headSize * 0.2);  // Mata kanan
        
        // Gambar alis
        fill(0);  // Warna hitam untuk alis
        ellipse(x - headSize * 0.2, y - headSize * 0.2, headSize * 0.3, headSize * 0.1);  // Alis kiri
        ellipse(x + headSize * 0.2, y - headSize * 0.2, headSize * 0.3, headSize * 0.1);  // Alis kanan
        
        // Gambar mulut
        fill(255, 0, 0);  // Warna merah untuk mulut
        rect(x - headSize * 0.1, y + headSize * 0.1, headSize * 0.2, headSize * 0.1);  // Mulut
    } else if (faceType == 1) {
        // Gambar mata (menghadap ke kanan)
        fill(255);  // Warna putih untuk mata
        ellipse(x + headSize * 0.25, y - headSize * 0.1, headSize * 0.15, headSize * 0.15);  // Mata kiri
        ellipse(x - headSize * 0.25, y - headSize * 0.1, headSize * 0.15, headSize * 0.15);  // Mata kanan
        
        // Gambar alis (menghadap ke kanan)
        fill(0);  // Warna hitam untuk alis
        line(x + headSize * 0.3, y - headSize * 0.25, x + headSize * 0.1, y - headSize * 0.25);  // Alis kiri
        line(x - headSize * 0.1, y - headSize * 0.25, x - headSize * 0.3, y - headSize * 0.25);  // Alis kanan
        
        // Gambar mulut (menghadap ke kanan)
        fill(255, 0, 0);  // Warna merah untuk mulut
        arc(x, y + headSize * 0.2, headSize * 0.4, headSize * 0.2, 0, PI);  // Mulut senyum
    } else if (faceType == 2) {
        // Gambar mata (menghadap ke kanan)
        fill(255);  // Warna putih untuk mata
        ellipse(x + headSize * 0.2, y - headSize * 0.15, headSize * 0.2, headSize * 0.2);  // Mata kiri
        ellipse(x - headSize * 0.2, y - headSize * 0.15, headSize * 0.2, headSize * 0.2);  // Mata kanan
        
        // Gambar alis (menghadap ke kanan)
        fill(0);  // Warna hitam untuk alis
        ellipse(x + headSize * 0.2, y - headSize * 0.3, headSize * 0.3, headSize * 0.1);  // Alis kiri
        ellipse(x - headSize * 0.2, y - headSize * 0.3, headSize * 0.3, headSize * 0.1);  // Alis kanan
        
        // Gambar mulut (menghadap ke kanan)
        fill(255, 0, 0);  // Warna merah untuk mulut
        rect(x - headSize * 0.15, y + headSize * 0.15, headSize * 0.3, headSize * 0.1);  // Mulut besar
    } else if (faceType == 3) {
        // Gambar mata (menghadap ke kanan)
        fill(255);  // Warna putih untuk mata
        ellipse(x + headSize * 0.3, y - headSize * 0.1, headSize * 0.1, headSize * 0.1);  // Mata kiri
        ellipse(x - headSize * 0.3, y - headSize * 0.1, headSize * 0.1, headSize * 0.1);  // Mata kanan
        
        // Gambar alis (menghadap ke kanan)
        fill(0);  // Warna hitam untuk alis
        line(x + headSize * 0.35, y - headSize * 0.2, x + headSize * 0.25, y - headSize * 0.2);  // Alis kiri
        line(x - headSize * 0.25, y - headSize * 0.2, x - headSize * 0.35, y - headSize * 0.2);  // Alis kanan
        
        // Gambar mulut (menghadap ke kanan)
        fill(255, 0, 0);  // Warna merah untuk mulut
        ellipse(x, y + headSize * 0.2, headSize * 0.3, headSize * 0.15);  // Mulut oval
    }

    // Gambar tubuh
    fill(255);  // Warna putih untuk tubuh
    if (isLyingDown) {
        ellipse(x, y + headSize * 0.75, headSize, headSize);  // Tubuh horizontal
    } else {
        ellipse(x, y + headSize * 0.75, headSize * 0.6, headSize);  // Tubuh vertikal (diperbesar)
    }

    // Gambar tangan
    fill(140, 88, 9);  // Warna kulit untuk tangan
    if (isLyingDown) {
        // Tangan horizontal
        ellipse(x - headSize * 0.3, y + headSize * 0.5, headSize * 0.2, headSize * 0.1);  // Tangan kiri
        ellipse(x + headSize * 0.3, y + headSize * 0.5, headSize * 0.2, headSize * 0.1);  // Tangan kanan
    } else {
        // Tangan vertikal
        ellipse(x - headSize * 0.4, y + headSize * 0.75, headSize * 0.1, headSize * 0.2);  // Tangan kiri
        ellipse(x + headSize * 0.4, y + headSize * 0.75, headSize * 0.1, headSize * 0.2);  // Tangan kanan
    }
}

void drawChildFacingRight(float x, float y, float headSize) {
    // Gambar tubuh
    fill(255);  // Warna putih untuk tubuh
    ellipse(x, y + headSize * 0.75, headSize * 0.6, headSize);  // Tubuh vertikal

    // Gambar kepala
    fill(140, 88, 9);  // Warna kulit untuk kepala
    ellipse(x, y, headSize, headSize);  // Kepala
    
    // Gambar mata (menghadap ke kanan)
    fill(255);  // Warna putih untuk mata
    ellipse(x + headSize * 0.2, y - headSize * 0.1, headSize * 0.2, headSize * 0.2);  // Mata kiri
    ellipse(x + headSize * 0.4, y - headSize * 0.1, headSize * 0.2, headSize * 0.2);  // Mata kanan

    // Gambar alis (menghadap ke kanan)
    fill(0);  // Warna hitam untuk alis
    ellipse(x + headSize * 0.2, y - headSize * 0.2, headSize * 0.3, headSize * 0.1);  // Alis kiri
    ellipse(x + headSize * 0.4, y - headSize * 0.2, headSize * 0.3, headSize * 0.1);  // Alis kanan

    // Gambar mulut (menghadap ke kanan)
    fill(255, 0, 0);  // Warna merah untuk mulut
    rect(x + headSize * 0.3, y + headSize * 0.1, headSize * 0.2, headSize * 0.1);  // Mulut
    
    // Gambar tangan
    fill(140, 88, 9);  // Warna kulit untuk tangan
    ellipse(x + headSize * 0.4, y + headSize * 0.75, headSize * 0.1, headSize * 0.2);  // Tangan kiri
    ellipse(x + headSize * 0.6, y + headSize * 0.75, headSize * 0.1, headSize * 0.2);  // Tangan kanan
}
