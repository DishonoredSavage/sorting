int[] arrayOfRands = new int[100];
int step1 = 1;
int step2 = 0;

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
  mergeSort(arrayOfRands, arrayOfRands.length);
  if (step1*2 <= arrayOfRands.length - 1) {
    if (step2+2*step1 < arrayOfRands.length - 1) 
      step2 += 2*step1;
    else { 
      step1 *= 2;
      step2 = 0;
    }
  }
}

void merge(int arr[], int l, int m, int r) { 
  int n1 = m - l + 1; 
  int n2 = r - m; 

  int L[] = new int [n1]; 
  int R[] = new int [n2]; 

  for (int i=0; i<n1; ++i) 
      L[i] = arr[l + i]; 
  for (int j=0; j<n2; ++j) 
      R[j] = arr[m+1+j]; 

  int i = 0, j = 0, k = l; 
  while (i < n1 && j < n2) { 
      if (L[i] <= R[j]) 
          arr[k] = L[i++];
      else 
        arr[k] = R[j++]; 
      k++; 
  } 

  while (i < n1) 
    arr[k++] = L[i++]; 

  while (j < n2) 
    arr[k++] = R[j++]; 
} 

void mergeSort(int arr[], int n) {       
  int mid = Math.min(step2 + step1 - 1, n-1); 
  int right_end = Math.min(step2 + 2*step1 - 1, n-1); 
  merge(arr, step2, mid, right_end); 
} 
       
void drawRects() {
  float deltaX = (float)width/arrayOfRands.length;
  for (int i = 0; i < arrayOfRands.length; i++) {
    fill(map(arrayOfRands[i], 0, height, 0, 255), 255, 255);
    rect(i*deltaX, height - arrayOfRands[i], deltaX, arrayOfRands[i]);
  }
}
