#include "scio.h"

int arr[6];
int rand;

void swap(int ap[]) {
  if (ap[1] != arr[1]) return;
  ap[5] = rand;
}

int getval() {
  while (true) {
    return rand + 3;
  }

  return 8;
}

int main() {
  int i;
  int j;
  int temp;
  arr[0] = 6;
  arr[1] = 1;
  arr[2] = 4;
  arr[3] = 9;
  arr[4] = 0;
  arr[5]= 11;
  rand = 12;
  i = 0;
  j = 1;

  swap(arr);

  arr[4] = getval();

  while (i < 6) {
    writeInt(arr[i]);
    i = i + 1;
  }

  i = 0;

  while (i < 6) {
    while (j < 6) {
      if (arr[j] > arr[j - 1]) {
        temp = arr[j];
        arr[j] = arr[j - 1];
        arr[j - 1] = temp;
      }
      j = j + 1;
    }
    j = 0;
    i = i + 1;
  }

  i = 0;

  while (i < 6) {
    writeInt(arr[i]);
    i = i + 1;
  }

  return 0;
}