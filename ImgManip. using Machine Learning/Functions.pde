

void dilate(){
  /*
  UIBooster booster = new UIBooster();
  File UI Booster
  */
  
  surface.setSize(img.width, img.height);
  color[][] filteredColors = morphFilterCircle(img, delta, false);
  
  //set colors
  for(int x = 0; x < widthMax; x++){
     for(int y = 0; y < heightMax; y++){
      set(x, y, filteredColors[y][x]);
      }
  }
  
  save("output.jpg");
}


void delta(){
   delta = new UiBooster().showSlider("Choose radius of circle here", "Radius Magnitude", 0, 10, 1, 2, 3);
   
}

color[][] morphFilterCircle(PImage img, int filterRadius, boolean Erosion){
   
  int N = filterRadius*2 + 1;
  // 
  float [][] weights = new float[N][N];
  
  for(int i = 0; i < N; i++){
   for(int j = 0; j < N; j++){
      float u = i - .5*(N-1);
      float v = j - .5*(N-1);
      float value = u*u + v*v - filterRadius * filterRadius;
      weights[i][j] = value < 0 ? 1: 0;
      
   }
  }
  return dilation(img, filterRadius, weights);
}

color[][] dilation(PImage img, int filterRadius, float[][] weights){
   int N = filterRadius * 2 + 1 ;
   
   color[][] filteredColors = new color[4032][width];
   for(int x = 0; x < width; x++){
      for(int y = 0; y < 4032; y++){
       float red = 0;
       float green = 0;
       float blue = 0;
       
       float maxAvg = 0;
       
       for(int i = 0; i < N; i++){
        for(int j = 0; j < N; j++){
         float weight = weights[i][j];
         float u = x + i - .5*(N-1);
         float v = y + j - .5*(N-1);
         
         if(u < 0){
          u = abs(u); 
         }
         else if(u >= width){
          u = width - u - width; 
         }
         if(v < 0){
           v = abs(v);
         }
          else if(v >= height){
           v = height - (u - height);
          }
         float r = weight * red(img.get((int)u, (int)v));
         float g = weight * green(img.get((int)u, (int)v));
         float b = weight * blue(img.get((int)u, (int)v));
         float currentAvg = (r+b+g)/3.0;
         float newMaxAvg = max(currentAvg, maxAvg);
         if(newMaxAvg > maxAvg){
          maxAvg = newMaxAvg;
          red = r;
          green = g;
          blue = b;
         }
        }
       }
       filteredColors[y][x] = color(red, green, blue);
      }
   }
   return filteredColors;
}
