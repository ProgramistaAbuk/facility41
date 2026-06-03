HashMap<String, Object[]> credits_button = new HashMap<String, Object[]>();

void credits_setup() {

    credits_button.put("back", new Object[]{ (50), 30, 125, 50, "Back", 18.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
}

String credits_button_clicked() {
  for (String id : credits_button.keySet()) {
      Object[] data = credits_button.get(id);
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

void credits() {
    background(0);
      float bg_x = (width - credits.width) / 2;
  image(credits, bg_x, 0);
    // progress = 0;
    if (!loadingBarDone) {
        loadingBar();

    }

      for (String id : credits_button.keySet()) {
    Object[] data = credits_button.get(id);
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