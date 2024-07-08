// Variable declarations for scene_5
float[] xPositions_5;
float yPosition_5;
float stepSize_5 = 2;
float oscillationAmplitude_5 = 5;
float oscillationSpeed_5 = 0.1;
float oscillationAngle_5 = 0;
float staticChildX_5;
float staticChildY_5;
float personX_5;
float personY_5;
float stopDistance_5 = 10;
float stopXPosition_5 = 800;
boolean returning_5 = false;

void scene_5() {
  size(1920, 1080);
  yPosition_5 = height * 0.94;
  xPositions_5 = new float[] {100, width * 0.1 + 100, 1000};
  staticChildX_5 = 1000;
  staticChildY_5 = yPosition_5;
  personX_5 = 1000;
  personY_5 = yPosition_5;

  background(70, 130, 180);

  drawVillage_5();
  drawPerson_5(personX_5, personY_5);
  drawChildren_5();
  drawStaticChild_5(staticChildX_5, staticChildY_5);

  updatePositions_5();
}

void drawVillage_5() {
  fill(34, 139, 34);
  rect(0, height * 0.56, width, height * 0.44);

  drawHouse_5(width * 0.08, height * 0.42);
  drawHouse_5(width * 0.27, height * 0.42);

  fill(139, 69, 19);
  rect(width * 0.23, height * 0.35, width * 0.016, height * 0.21);
  fill(34, 139, 34);
  ellipse(width * 0.23 + width * 0.008, height * 0.35, width * 0.078, height * 0.14);

  fill(255, 223, 0);
  ellipse(width * 0.55, height * 0.14, width * 0.06, height * 0.11);

  drawCloud_5(width * 0.12, height * 0.14);
  drawCloud_5(width * 0.39, height * 0.21);

  for (int i = 0; i < width; i += 10) {
    drawGrass_5(i, height * 0.58);
  }
}

void drawPerson_5(float x, float y) {
  fill(255, 0, 0);
  ellipse(x, y, width * 0.04, height * 0.1);
}

void drawChildren_5() {
  for (int i = 0; i < xPositions_5.length; i++) {
    float currentY = yPosition_5;
    
    if (i == 0 && !returning_5) {
      currentY += oscillationAmplitude_5 * sin(oscillationAngle_5);
    }

    if (!returning_5) {
      if (xPositions_5[i] < stopXPosition_5) {
        // Ensure children move towards staticChildX_5 (which is 1000)
        if (xPositions_5[i] < staticChildX_5) {
          xPositions_5[i] += stepSize_5;
        }
        drawChild_5(xPositions_5[i], currentY, xPositions_5[i], currentY - height * 0.145, xPositions_5[i] + width * 0.023, currentY - height * 0.16, xPositions_5[i] + width * 0.023, currentY - height * 0.2, xPositions_5[i] + width * 0.023, currentY - height * 0.1);
      } else {
        // Ensure children move towards staticChildX_5 (which is 1000)
        if (xPositions_5[i] > staticChildX_5) {
          xPositions_5[i] -= stepSize_5;
        }
        drawChild_5(xPositions_5[i], currentY, xPositions_5[i], currentY - height * 0.145, xPositions_5[i] - width * 0.023, currentY - height * 0.16, xPositions_5[i] - width * 0.023, currentY - height * 0.2, xPositions_5[i] - width * 0.023, currentY - height * 0.1);
      }
    } else {
      drawChild_5(xPositions_5[i], currentY, xPositions_5[i], currentY - height * 0.145, xPositions_5[i] - width * 0.023, currentY - height * 0.16, xPositions_5[i] - width * 0.023, currentY - height * 0.2, xPositions_5[i] - width * 0.023, currentY - height * 0.1);
    }
  }

  oscillationAngle_5 += oscillationSpeed_5;
}


void drawStaticChild_5(float bodyX, float bodyY) {
  drawChild_5(bodyX, bodyY, bodyX, bodyY - height * 0.145, bodyX - width * 0.023, bodyY - height * 0.16, bodyX - width * 0.023, bodyY - height * 0.2, bodyX - width * 0.023, bodyY - height * 0.1);
}

void drawChild_5(float bodyX, float bodyY, float headX, float headY, float eyeX, float eyeY, float eyebrowX, float eyebrowY, float mouthX, float mouthY) {
  fill(255, 255, 255);
  ellipse(bodyX, bodyY, width * 0.04, height * 0.14);

  fill(140, 88, 9);
  ellipse(headX, headY, width * 0.113, height * 0.182);

  fill(255, 255, 255);
  ellipse(eyeX, eyeY, width * 0.023, height * 0.056);

  fill(255, 255, 255);
  ellipse(eyebrowX, eyebrowY, width * 0.038, height * 0.014);

  fill(255, 255, 255);
  ellipse(mouthX, mouthY, width * 0.023, height * 0.004);
}

void drawHouse_5(float x, float y) {
  fill(42, 75, 125);
  rect(x, y, width * 0.106, height * 0.14);
  fill(255, 255, 255);
  triangle(x - width * 0.015, y, x + width * 0.053, y - height * 0.14, x + width * 0.117, y);
  fill(255, 255, 255);
  rect(x + width * 0.015, y + height * 0.042, width * 0.03, height * 0.07);
  fill(255, 255, 255);
  rect(x + width * 0.06, y + height * 0.042, width * 0.03, height * 0.1);
}

void drawCloud_5(float x, float y) {
  fill(255);
  noStroke();
  ellipse(x, y, width * 0.05, height * 0.08);
  ellipse(x + width * 0.03, y, width * 0.05, height * 0.08);
  ellipse(x + width * 0.015, y - height * 0.03, width * 0.05, height * 0.08);
}

void drawGrass_5(float x, float y) {
  stroke(34, 139, 34);
  strokeWeight(2);
  for (int i = 0; i < 5; i++) {
    line(x + i * 4, y, x + i * 4 + random(-5, 5), y - height * 0.028 - random(0, height * 0.014));
  }
  noStroke();
}

void updatePositions_5() {
  if (!returning_5) {
    if (xPositions_5[0] >= stopXPosition_5) {
      returning_5 = true;
    }

    for (int i = 0; i < xPositions_5.length; i++) {
      if (xPositions_5[i] < staticChildX_5 - stopDistance_5) {
        xPositions_5[i] += stepSize_5;
        
        if (xPositions_5[i] >= stopXPosition_5) {
          xPositions_5[i] = stopXPosition_5;
        }
      }
    }
  } else {
    boolean allAtStart = true;

    for (int i = 0; i < xPositions_5.length; i++) {
      if (xPositions_5[i] > 0) {
        xPositions_5[i] -= stepSize_5;
        allAtStart = false;
      }
    }

    if (allAtStart) {
      returning_5 = false;
    }
  }

  if (xPositions_5[2] <= 0) {
    xPositions_5[2] = -100;
  }

  if (xPositions_5[1] <= 0) {
    xPositions_5[1] = -100;
  }

  if (xPositions_5[0] <= 0) {
    xPositions_5[0] = -100;
  }
}
