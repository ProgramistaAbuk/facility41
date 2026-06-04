import java.util.LinkedHashMap;

LinkedHashMap<String, Object[]> level_buttons = new LinkedHashMap<String, Object[]>();

void levels_setup() {
    // level_buttons.put("1", new Object[]{ 0, 0, 367, height, "", 30.0f, color(0,0,0,1), color(255,255,255), color(255,255,255)});
    // level_buttons.put("2", new Object[]{ 300, (height/2)-150, 200, 200, "", 30.0f, color(0,0,0), color(255,255,255), color(255,255,255) });
    // level_buttons.put("3", new Object[]{ 550, (height/2)-150, 200, 200, "3", 30.0f, color(0,0,0), color(255,255,255), color(255,255,255) });
    
level_buttons.put("back", new Object[]{ (50), height-80, 125, 50, "Back", 18.0f, color(0,0,0), color(255,255,255), color(255,255,255), -1 });
    level_buttons.put("level", new Object[]{ 0, 0, (width/4)-20, height, "", 30.0f, color(0,0,0, 25), color(255,255,255), color(255,255,255), -1 }); 


}

String levels_buttonPressed() {
log("DEBUG", "Levels buttons  keyset: " + level_buttons.keySet());
  for (String id : level_buttons.keySet()) {
      Object[] data = level_buttons.get(id);
      int x = (Integer)data[0];
      int y=(Integer) data[1];
      int w = (Integer)data[2];
      int h = (Integer)data[3];
      if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
        log("DEBUG", "MOUSE clicked on button: " + id);
        if (id == "level") {
            return leveler;
        }
        return id;
      } 

  }
  return "none";
}
int level_rect_x = 0;
int width_rect =  width/4;
String leveler = "1";
void levels() {
    background(0);
    Object[] btn = (Object[]) level_buttons.get("level");
    float bg_x = (width - bg_levels.width) / 2;
    image(bg_levels, bg_x, 0);
    fill(0,0,0,100);
   int change_amount = width / 96;

if (mouseX > (width/4)*3 && level_rect_x < ((width/4)*3) + change_amount) {
    level_rect_x += change_amount;
    leveler = "4";
} else if (mouseX < (width/4)*3 && level_rect_x > (width/4)*2) {
    level_rect_x -= change_amount;
    leveler = "3";
}

if (mouseX > (width/4)*2 && level_rect_x < (width/4)*2) {
    level_rect_x += change_amount;
    leveler = "3";
} else if (mouseX < (width/4)*2 && level_rect_x > (width/4) - change_amount) {
    level_rect_x -= change_amount;
    width_rect = (width/4) + change_amount;
    leveler = "2";
}

if (mouseX > width/4 && level_rect_x < (width/4) - change_amount) {
    level_rect_x += change_amount;
    leveler = "2";
    width_rect = (width/4) + change_amount;
} else if (mouseX < width/4 && level_rect_x > 0) {
    level_rect_x -= change_amount;
    leveler = "1";
    width_rect = (width/4) - change_amount;
}

btn[0] = level_rect_x;
btn[2] = width_rect;


    for (String id : level_buttons.keySet()) {
        Object[] data = level_buttons.get(id);
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
            level_buttons.put(id, menu_makeButton(x,y,w,h,txt,txtSz,btnC,txtC, border, alpha_count, true)) ;
        } else {
            level_buttons.put(id, menu_makeButton(x,y,w,h,txt,txtSz,btnC,txtC, border, alpha_count, false)) ;
        }

  }

}

int player_x, player_y;

void single_player_setup() {
    player_x = (width / 2) - 50;   // centered: subtract half the rect width
    player_y = height - 100;
}
int screenW = 1920;
int screenH = 1080;
int cols = 3;
int rows = 3;
int cellW = screenW / cols;
int cellH = screenH / rows;
int bgCols = 5;
int bgRows = 3;
int bgW = screenW * bgCols;  // total background width
int bgH = screenH * bgRows;  // total background height

// Camera offset (how much the background is shifted)
int camX = 0;
int camY = 0;
void drawBackground() {
    pushMatrix();
    translate(-camX, -camY);  // shift entire background by camera

    for (int row = 0; row < rows * bgRows; row++) {
        for (int col = 0; col < cols * bgCols; col++) {
            fill(0);
            stroke(255);
            rect(col * cellW, row * cellH, cellW, cellH);
        }
    }

    popMatrix();
}
void single_player() {
    background(0,0,0);
    // log("ERROR", "in single player func");
    

    if (!loadingBarDone) {
        loadingBar();
        // progress = 100;
    }
    // int cols = 3;
    // int rows = 3;
    // int rectW = width / cols;
    // int rectH = height / rows;

    // for (int row = 0; row < rows; row++) {
    //     for (int col = 0; col < cols; col++) {
    //         fill(0);
    //         stroke(255);
    //         rect(col * rectW, row * rectH, rectW, rectH);
    //     }
    // }
    drawBackground();
    camX = constrain(camX, 0, bgW - screenW);
camY = constrain(camY, 0, bgH - screenH);
    rect(player_x, player_y, 100,100);
    switch (level) {
        case ONE:
            break;
        case TWO:
            break;
        case THREE:
            break;
        case FOUR:
            break;
        case NONE:
            break;
    }
}