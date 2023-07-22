double computeHeight(double offset, double sizeOfGlobe, double sizeOfBlob) {
  double sum = (offset + sizeOfGlobe) - sizeOfBlob;
  if (sum < 0) {
    return sizeOfBlob;
  } else {
    return sum + sizeOfBlob;
  }
}
