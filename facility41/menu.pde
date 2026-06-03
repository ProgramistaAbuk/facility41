HashMap<String, Object[]> menu_buttons = new HashMap<String, Object[]>();

void menu_setup() {
    menu_buttons.put("single_player", new Object[]{ ((width/2)+100), height/2-200,   560, 50, "Single Player", 24.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
    menu_buttons.put("multi_player", new Object[]{ ((width/2)+100), (height/2)-135, 560, 50, "Multiplayer", 24.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
    menu_buttons.put("credits", new Object[]{ ((width/2)+100), (height/2)-70, 270, 50, "Credits", 18.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
    menu_buttons.put("quit", new Object[]{ ((width/2)+390), (height/2)-70, 270, 50, "Quit", 18.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
}

String menu_button_clicked() {
  for (String id : menu_buttons.keySet()) {
      Object[] data = menu_buttons.get(id);
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

void menu() {
  background(#7D8CA3);
  float bg_x = (width - bg_main.width) / 2;
  image(bg_main, bg_x, 0);
  // image(title_text, 100, 100);


  //Init buttons
  for (String id : menu_buttons.keySet()) {
    Object[] data = menu_buttons.get(id);
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
  textAlign(CENTER,CENTER);
  textFont(sixty);
  // fill(#EC1F1F);
  fill(0,0,0,150);
  stroke(0,0,0,0);
  rect(width/2-5000,50, 10000,100,10);

  fill(#3AA465);
  textSize(75);
  text("Facility 41", width/2, 100);

}


void menu_makeButton(int x, int y, int w, int h, String txt, float txtSize, color btnColor, color textColor, color border, boolean hover) {
  pushStyle();
  rectMode(CORNER);

  if (hover) {
    fill(red(btnColor), green(btnColor), blue(btnColor), 200);
    stroke(red(border), green(border), blue(border),200);
  } else {
    fill(btnColor);
    stroke(border);
  }


  
  rect(x, y, w, h, 4);

  textAlign(CENTER, CENTER);
  fill(textColor);
  textSize(txtSize);

  float centerX = x + (w / 2.0);
  float centerY = y + (h / 2.0) - 2;

  text(txt, centerX, centerY);
  popStyle();
}
