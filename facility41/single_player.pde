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

float player_x, player_y;
float player_w = 100;
float player_h = 100;
void single_player_setup() {
    player_x = (width / 2) - player_w/2;   // centered: subtract half the rect width
    player_y = height - player_h - cellH;
    screenW = displayWidth;
    screenH = displayHeight;
    cellW = screenW / cols;
    cellH = screenH / rows;
    bgW = screenW * bgCols;  // total background width
    bgH = screenH * bgRows;  // total background height
    camX = 0;
    camY = bgH - screenH; // 3240 - 1080 = 2160
    maxCamX = bgW - screenW; 
}
int screenW = 1920;
int screenH = 1080;
int cols = 3;
int rows = 3;
int cellW = 0;
int cellH = 0;
int bgCols = 5;
int bgRows = 3;
int bgW = 0;  // total background width
int bgH = 0;  // total background height
int maxCamX;

// Camera offset (how much the background is shifted)
int camX = 0;
int camY = 0; // 3240 - 1080 = 2160
void drawBackground() {
    pushMatrix();
    translate(-camX, -camY);  // shift entire background by camera

    for (int row = 0; row < rows * bgRows; row++) {
        for (int col = 0; col < cols * bgCols; col++) {
            fill(0);
            // log("DEBUG", "Row and column stats" + row + "|" + col);
            stroke(255);
            if (row == 8) {
                tile_ground_straight.resize(cellW, cellH);
                // tint(255,64);
                image(tile_ground_straight, col*cellW, row*cellH);
                // drawGround(col*cellW, row*cellH);
            } else {
                tint(255,255);
                rect(col * cellW, row * cellH, cellW, cellH);
            }
            tint(255,255);
        }
    }

    popMatrix();
}

boolean bgMove = true;
boolean leftBg = false;
boolean rightBg = false;
float actual_player_x, actual_player_y;
void single_player() {
    background(0,0,0);
    // log("ERROR", "in single player func");
    stroke(255,255,255);
    update_platforms();


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
        fill(255);
    textSize(25);
    if (bgMove) {
        actual_player_x = player_x + camX;
actual_player_y = (height - player_y - player_h) - cellH;
    } else  {
        actual_player_x = player_x;
actual_player_y = (height - player_y - player_h) - cellH;
    }
text(actual_player_x + "," + actual_player_y, width/2,100);   
    // log("TEST", "CAMX CAMY" + camX  + " | " +  camY);
    // if (camX == 0) {
    //     bgMove = false;
    //     leftBg = true;
    // } else if (camX > 7680) {
    //     bgMove = false;
    //     rightBg = true;
    // }
     if (player_x > (width/2) - 50 && leftBg){
        player_x = (width/2) - 50;
        bgMove = true;
        leftBg = false;
    } else if (player_x < (width/2) - 50 && rightBg) {
        player_x = (width/2) - 50;
        bgMove = true;
        rightBg = false;
    }

    // if ( player_y height - 100)
    // if (camX > 7680) {
    //     bgMove = false;
    //     rightBg = true;
    // }  else if ()
    // if (bgMove) {
    //     camX = constrain(camX, 0, bgW - screenW);
    //     camY = constrain(camY, 0, bgH - screenH);
    // }

    detect_draw_platforms();


    rect(player_x, player_y, player_w, player_h);
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

void setPlatforms() {
    add_platform(1000, height-cellH-100, 100, 10);
    add_platform(200, height-cellH-100, 100, 10);
}

void detect_draw_platforms() {
       for (Integer id : hitboxes.keySet()) {
      Object[] data = hitboxes.get(id);

    //   log("INFO", "Hitboxes: " + data[0] +  "|" + data[1]);
      int x = (Integer)data[0];
      int y=(Integer) data[1];
      int x2= (Integer)data[2];
      int y2 = (Integer)data[3];
    // log("INFO", "camx" + camX + "| x,y" + x + "," + y);
      fill(255,0,0);
      rect(x,y,x2-x, y2-y);
      if (player_x + player_w > x && player_x < x2 && player_y+player_h >y && player_y + player_h <y2) {
        player_y = y-player_h;
        playerYVelocity = 0;
        jumping = false;
      }
      log("1234", "px py x2 y2 y" + player_x + "|" + player_y + "|" + x2 + "|" +y2 + "|" +y);
        if (bgMove) {
            actual_player_x = player_x + camX;
            actual_player_y = (height - player_y - player_h) - cellH;
        } else  {
            actual_player_x = player_x;
            actual_player_y = (height - player_y - player_h) - cellH;
    }
      if ( actual_player_x < x2 && actual_player_x > x2-20 && (player_y > y && player_y < y2 || player_y + player_h >y && player_y + player_h < y2)) {
        player_x = x2;
        println("DETECT HIT");
        movingLeft = false;
      }

    //   if (player_x < x && player_y + player_h > y || player_y >  y && player_y  < y2)

  }
}
int og_pos_x, og_pos_y, og_w, og_h;
void update_platforms() {
    // log("INFO", "camx" + camX);
     for (Integer id : hitboxes.keySet()) {
      Object[] data = hitboxes.get(id);
    data[0] = (Integer) data[4] - camX;
    data[1] = (Integer) data[5] - camY + ( bgH - screenH);
    data[2] = (Integer) data[0] + (Integer)data[6];
    data[3] = (Integer) data[1] + (Integer)data[7];
   }
}