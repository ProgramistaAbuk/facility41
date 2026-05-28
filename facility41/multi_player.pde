HashMap<String, Object[]> mp_buttons = new HashMap<String, Object[]>();
HashMap<String, Object[]> OPTIONS_mp_diff_buttons = new HashMap<String, Object[]>();
HashMap<String, Object[]> OPTIONS_mp_pc_buttons = new HashMap<String, Object[]>();
boolean pass_type_selected = false;
boolean POPUP = false;
String mp_c_button_clicked() {
  for (String id : mp_buttons.keySet()) {
      Object[] data = mp_buttons.get(id);
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


void setDiff_mp(int diff) {
    log("INFO", "Setting difficulty to: " + diff);
    Object[] btn = (Object[]) mp_buttons.get("diff");
    btn[4] = diff_map.get(diff); // update x

}

void startTypeMPC_pass() {
    log("INFO", "Getting use type input for pass");
    pass_type_selected = true;
    Object[] btn = (Object[]) mp_buttons.get("pass");
    btn[4] = pass_text;
    btn[6] = color(#26547C);
}



void mp_c_setup() {
    mp_buttons.put("diff", new Object[]{ ((width/2)-280), 475, 560, 50, "Difficulty", 24.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
    mp_buttons.put("pass", new Object[]{ ((width/2)-280), 535, 560, 50, "Game pass (click to type)", 21.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
    mp_buttons.put("play", new Object[]{ ((width/2)-280), 595, 560, 50, "Play", 18.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
    mp_buttons.put("back", new Object[]{ (50), 30, 125, 50, "Back", 18.0f, color(0,0,0), color(255,255,255), color(0,0,0) });


    OPTIONS_mp_diff_buttons.put("easy", new Object[]{ ((width/2)-280), 415, 560, 50, "Easy", 24.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
    OPTIONS_mp_diff_buttons.put("med", new Object[]{ ((width/2)-280), 485, 560, 50, "Medium", 24.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
    OPTIONS_mp_diff_buttons.put("hard", new Object[]{ ((width/2)-280), 555, 560, 50, "Hard", 24.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
    OPTIONS_mp_diff_buttons.put("xtr", new Object[]{ ((width/2)-280), 625, 560, 50, "Extreme", 24.0f, color(0,0,0), color(255,255,255), color(0,0,0) });

    OPTIONS_mp_pc_buttons.put("2", new Object[]{ ((width/2)-280), 415, 560, 50, "2", 24.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
    OPTIONS_mp_pc_buttons.put("3", new Object[]{ ((width/2)-280), 485, 560, 50, "3", 24.0f, color(0,0,0), color(255,255,255), color(0,0,0) });
    OPTIONS_mp_pc_buttons.put("4", new Object[]{ ((width/2)-280), 555, 560, 50, "4", 24.0f, color(0,0,0), color(255,255,255), color(0,0,0) });


}
//diff
//player cap
//password
//survival or hardcore?
//world name

void mp_c() {
  background(#7D8CA3);
  //Init buttons
  if (POPUP == false) {
        for (String id : mp_buttons.keySet()) {
            Object[] data = mp_buttons.get(id);
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
    } else {
        popup(POP_tit, POP_op);
    }
}