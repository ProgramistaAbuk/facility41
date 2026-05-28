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
            if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
            menu_makeButton(x,y,w,h,txt,txtSz,btnC,txtC, border, true);
            } else {
            menu_makeButton(x,y,w,h,txt,txtSz,btnC,txtC,border, false);
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