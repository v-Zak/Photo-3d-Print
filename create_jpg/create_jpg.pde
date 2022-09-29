Slider slider;
float CSize = 20f;
PImage img;
int min;
int max;

void setup(){
  size(600,800); 
  background(0);
  slider = new Slider("min", CSize, 0f, 255f, 10,50,500,20,HORIZONTAL);
  img = saveGrey("alice 21.jpeg");
  saveImage(img, "grey.jpg");
  background(0);
}

void draw() {
  background(0);
  min = 0;
  max = int(slider.val);
  img = saveBetween("alice 21.jpeg", min, max);
  image(img,0,0);
  slider.display();
}

void mouseDragged(){
  slider.mouseDragged();
  CSize = slider.val;
  println("valor: " + CSize);
}

void mouseReleased(){
  slider.mouseReleased();
  CSize = slider.val;
  println("saved 0-" + CSize);
  background(0);
  image(img,0,0);
  save(str(min) + "-" + str(max) + ".jpg");
}


PImage saveBetween(String imgName, int min, int max){ 
  PImage img = saveGrey(imgName);
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++){
    if( (img.pixels[i] <= color(max)) && (img.pixels[i] >= color(min)) ){
      //255 for inverse of print
      img.pixels[i] = color(0);
    }else{
      //0 for inverse print
      img.pixels[i] = color(255);
    }
  }
  img.updatePixels();
  return img;
}

PImage saveGrey(String imgName){  
  PImage img;
  img = loadImage(imgName);
  img.resize(width,height);
  img.filter(GRAY);
  return img;
  //saveImage("grey.jpg");
}

void saveImage(PImage img, String imgName){
  img.resize(width,height);
  image(img,0,0);
  save(imgName);
}
