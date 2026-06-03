HashMap<String, Object[]> level_buttons = new HashMap<String, Object[]>();

void levels_setup() {
    level_buttons.put("1", new Object[]{ 0, 0, 367, height, "", 30.0f, color(0,0,0,1), color(255,255,255), color(255,255,255)});
    level_buttons.put("2", new Object[]{ 300, (height/2)-150, 200, 200, "", 30.0f, color(0,0,0), color(255,255,255), color(255,255,255) });
    // level_buttons.put("3", new Object[]{ 550, (height/2)-150, 200, 200, "3", 30.0f, color(0,0,0), color(255,255,255), color(255,255,255) });
    // level_buttons.put("4", new Object[]{ 800, (height/2)-150, 200, 200, "4", 30.0f, color(0,0,0), color(255,255,255), color(255,255,255) }); 

    level_buttons.put("back", new Object[]{ (50), height-80, 125, 50, "Back", 18.0f, color(0,0,0), color(255,255,255), color(255,255,255) });
}

String levels_buttonPressed() {
  for (String id : level_buttons.keySet()) {
      Object[] data = level_buttons.get(id);
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
int level_rect_x = 0;
void levels() {
    background(0);
    float bg_x = (width - bg_levels.width) / 2;
    image(bg_levels, bg_x, 0);
    fill(0,0,0,100);
    rect(level_rect_x, 0, 367, height);

    if (mouseX > 367) {
        while (level_rect_x != 367) {
            level_rect_x += 1;
        }
    } else if (mouseX < 367) {
        while (level_rect_x != 0) {
            level_rect_x -= 11;
        }
    }

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
        if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
            menu_makeButton(x,y,w,h,txt,txtSz,btnC,txtC, border, true);
        } else {
            menu_makeButton(x,y,w,h,txt,txtSz,btnC,txtC, border, false);
        }

  }

}

void single_player() {
    if (!loadingBarDone) {
        loadingBar();

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