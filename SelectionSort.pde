int[] arrayOfRands = new int[100];
int step = 0;

void setup() {
  size(1000, 800);
  colorMode(HSB);
  noStroke();
  for (int i = 0; i < arrayOfRands.length; i++) 
    arrayOfRands[i] = int(random(height));
}

void draw() {
  frameRate(30);
  background(40);
  drawRects();
  selectionSort();
  if (step < arrayOfRands.length - 1)
    step++;
}

void selectionSort() {
  int minIndex = step;
  for (int j = step+1; j < arrayOfRands.length; j++) {
    if (arrayOfRands[j] < arrayOfRands[minIndex]) 
      minIndex = j;
  }
  swap(minIndex, step);
}

void swap(int x, int y) {
  int temp = arrayOfRands[x];
  arrayOfRands[x] = arrayOfRands[y];
  arrayOfRands[y] = temp;
}

void drawRects() {
  float deltaX = (float)width/arrayOfRands.length;
  for (int i = 0; i < arrayOfRands.length; i++) {
    fill(map(arrayOfRands[i], 0, height, 0, 255), 255, 255);
    rect(i*deltaX, height - arrayOfRands[i], deltaX, arrayOfRands[i]);
  }
}
