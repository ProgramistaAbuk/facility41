void log(String status, String msg) {
  println("[" + hour() + ":" + minute() + ":" + second() + "." + millis() + "] " + status + " || " + msg);
}


PFont sixty;
void font_setup() {
  sixty = createFont("sixty.ttf",256);
}


String popup_button_clicked() {
  for (String id : POP_op.keySet()) {
      Object[] data = POP_op.get(id);
      int x = (Integer)data[0];
      int y=(Integer) data[1];
      int w = (Integer)data[2];
      int h = (Integer)data[3];
      if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
        return id;
      } 

  }
  return "none";
}


String POP_tit;
HashMap<String, Object[]> POP_op = new HashMap<String, Object[]>();
void popup(String title, HashMap<String, Object[]> options) {
  rectMode(CORNER);
  fill(#231942);
  rect(width/2-300, 300, 600, 500, 10);
  // text(title, (width/2)-300, 300);
   for (String id : options.keySet()) {
            Object[] data = options.get(id);
            int x = (Integer)data[0];
            int y=(Integer) data[1];
            int w = (Integer)data[2];
            int h = (Integer)data[3];
            String txt = (String)  data[4];
            float txtSz =(Float)data[5];
            color btnC = (Integer) data[6];
            color txtC = (Integer)data[7];
            color border = (Integer)data[8];
            int alpha_count = (Integer)data[9];
            if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
                    options.put(id, menu_makeButton(x,y,w,h,txt,txtSz,btnC,txtC, border, alpha_count, true)) ;
            } else {
                    options.put(id, menu_makeButton(x,y,w,h,txt,txtSz,btnC,txtC, border, alpha_count, false)) ;
            }

        }
}

void startPopup(String title,  HashMap<String, Object[]> options) {
    POP_tit = title;
    POP_op = options;
    POPUP =  true;

}

void closePopup() {
  POPUP = false;
}

int progress = 0;
float fade = 255;
boolean loadingBarDone = false;

void loadingBar() {
    log("INFO", "Progress == " + progress);
          log("INFO", "Progress 2== " + progress);
    if (fade == 255) {
    progress += 1;
    }
    rectMode(CORNER);
    fill(0,0,0, (fade));
    rect(0,0,width,height);  
    // background(0,0,0,(progress));
          rectMode(CORNER);

      stroke(0,0,0,0);
      fill(255,255,255);
      textSize(20);
      text(progress + "%", width/2, height/2 - 50);
          fill(23,200,100, fade);
      rect(width/2-100, height/2, progress*2, 30);

    if (progress >= 100) {
      fade -=3;
  
  }

  if (fade == 0) {
    fade = 255;
          progress = 0;
        loadingBarDone = true;
  }
}
boolean jumping = false;
boolean goingUp = false;
float og_pos;
int jump_limit = 100;

float playerYVelocity = 0; // How fast the player is moving up/down
float gravity = 0.6;        // How hard gravity pulls down each frame
float jumpStrength = -15;   // The initial upward burst (negative moves UP)
void jump() {
  // 1. Apply gravity to velocity (pulls the player downward over time)
  playerYVelocity += gravity;
  
  // 2. Move the player by their current velocity
  player_y += playerYVelocity;
  
  // 3. Check for floor collision (so they don't fall forever)
  float floorY = height - 100 - cellH;
  if (player_y >= floorY) {
    player_y = floorY;     // Snap to exact floor position
    playerYVelocity = 0;   // Stop moving downward
    jumping = false;       // Reset jumping state flag
  }
}

void add_platform (int x, int y, int w, int h) {
  
}