PImage img;
PImage back; 
Table tbl;
int imgNum;
int bgNum;

enum Status {
  START,
  STOP,
  FINISH
};

Status myStatus;
String[] bgName = {"bg_dote.jpg", "bg_dote_yuyake.jpg", "bg_dote_yoru.jpg"};

void setup() {
  size(800, 500);
  background(255, 255, 255);
  String action = "walk";
  imgNum = 0;
  bgNum = 0;
  myStatus = Status.START;
  tbl = loadTable("../" + action + "/" + action + ".csv");
}

void draw() {
 int row = tbl.getRowCount();
 //background(255, 255, 255);
 
 if (imgNum >= row) {
   imgNum = 0;
 }
 if (bgNum >= bgName.length) {
   bgNum = 0;
 }
 
 back = loadImage("../" + bgName[bgNum]);
 image(back, 0, 0, width, height);
 
 fill(0, 0, 0);
 textSize(50);
 text(Integer.valueOf(millis() / 1000).toString(), 30, 10, 200, 200);
 
 String imgFile = tbl.getString(imgNum, 0);
 img = loadImage("../walk/" + imgFile);
 int imgWidth = img.width; 
 int imgHeight = img.height;
 
 //if ( < mouseX)
 println(mouseX + ", " + mouseY);
 image(img, width/4, height/4, imgWidth/4, imgHeight/4);
 
 if (frameCount % 5 == 0) { 
   imgNum++;
 }
 if (frameCount % 100 == 0) {
   bgNum++;
 }
}
