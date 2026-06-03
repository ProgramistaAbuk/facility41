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
    int change_amount = 20;
    // rect(level_rect_x, 0, width_rect, height);

    if (mouseX > (width/4)*3 && level_rect_x < ((width/4)*3)+change_amount) {
        level_rect_x += change_amount;
        leveler = "4";
    } else if (mouseX < (width/4)*3 && level_rect_x > ((width/4)*2)) {
        level_rect_x -= change_amount;
        leveler = "3";
    }

    if (mouseX > (width/4)*2 && level_rect_x < (width/4)*2) {
        level_rect_x += change_amount;
        leveler = "3";
    } else if (mouseX < (width/4)*2 && level_rect_x > (width/4)-change_amount) {
        level_rect_x -= change_amount;
        width_rect = (width/4)+20;
        leveler = "2";
    }
    
    if (mouseX > width/4 && level_rect_x < (width/4)-change_amount) {
        level_rect_x += change_amount;
        leveler = "2";
        width_rect = (width/4)+20;
    } else if (mouseX < width/4 && level_rect_x > 0) {
        level_rect_x -= change_amount;
        leveler = "1";
        width_rect = (width/4)-20;
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


void single_player() {
    background(0,0,0);
    // log("ERROR", "in single player func");
    if (!loadingBarDone) {
        loadingBar();
        // progress = 100;
    }
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