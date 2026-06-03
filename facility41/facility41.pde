enum Screen {
  MAIN_MENU, SINGLE_PLAYER, MULTI_PLAYER_CREATE, CREDITS, LEVELS
}

enum Level {
  ONE,TWO,THREE,FOUR, NONE
}

Level level = Level.NONE;

Screen screen = Screen.MAIN_MENU;
HashMap<Integer, String> diff_map = new HashMap<Integer, String>();


void setup() {
  log("INFO", "Starting");
  fullScreen();
  size(1920, 1080);
  //Menu buttons init
  menu_setup();
  mp_c_setup();

  //Setup fonts
  font_setup();
  img_load();
  levels_setup();
  credits_setup();

  diff_map.put(0, "Easy");
  diff_map.put(1, "Medium");
  diff_map.put(2, "Hard");
  diff_map.put(3, "Extreme");
}

void draw() {
  switch (screen) {
    case MAIN_MENU:
      menu();
      break;
    case SINGLE_PLAYER:
      single_player();
      break;
    case LEVELS:
      levels();
      break;
    case MULTI_PLAYER_CREATE:
      mp_c();
      break;
    case CREDITS:
      credits();
      break;

    }
}


  String pass_text = "";
void keyPressed() {
  Object[] btn = (Object[]) mp_buttons.get("pass");
  if (pass_type_selected) {


    if (key == '\n' || key == '\r') {
      log("INFO", "Done typing");
      btn[6] = color(0,0,0);
      pass_type_selected = false;
    } else if (key == BACKSPACE && pass_text.length() > 0) {
      pass_text = pass_text.substring(0, pass_text.length() - 1);
    } else if (key != BACKSPACE && key != CODED && pass_text.length() < 18) {
      pass_text += key;
      
    }

    if (pass_text.length() == 18 && pass_type_selected) {
      btn[6] = color(#C6173F);
    } else if (pass_type_selected){
      btn[6] = color(#26547C);
    }
    log("INFO", "Text: " + pass_text);
    btn[4] = pass_text;
  }

}   
void mouseClicked() {
  switch (screen) {
    case MAIN_MENU:
      String menu_buttonPressed = menu_button_clicked();
      log("INFO", "Mouse pressed button: " + menu_buttonPressed);
      switch (menu_buttonPressed) {
        case "single_player":
          screen = Screen.LEVELS;
          break;
        case "multi_player":
          screen = Screen.MULTI_PLAYER_CREATE;
          break;
        case "credits":
          screen = Screen.CREDITS;
          loadingBarDone = false;
          break;
        case "quit":
          log("INFO", "Exiting");
          exit();
      }
      break;
    case LEVELS:
      String levels_pressed = levels_buttonPressed();
      log("INFO", "Mouse pressed button: " + levels_pressed);
      switch (levels_pressed) {
        case "back":
          screen = Screen.MAIN_MENU;
          break;
        case "1":
          log("INFO", "Level 1 selected");
          level = Level.ONE;
          screen = Screen.SINGLE_PLAYER;
          break;
        case "2":
          log("INFO", "Level 2 selected");  
          level = Level.TWO;
          screen = Screen.SINGLE_PLAYER;
          break;
        case "3":
          log("INFO", "Level 3 selected");
          level = Level.THREE;
          screen = Screen.SINGLE_PLAYER;
          break;
        case "4":
          log("INFO", "Level 4 selected");
          level = Level.FOUR;
          screen = Screen.SINGLE_PLAYER;
          break;
      }
      break;
    case SINGLE_PLAYER:
      break;
    case MULTI_PLAYER_CREATE:
      String mp_c_buttonPressed = mp_c_button_clicked();
      log("INFO", "Mouse pressed button: " + mp_c_buttonPressed);
      if (POPUP == false) {
        if (mp_c_buttonPressed != "pass") {
          pass_type_selected = false;
          Object[] btn = (Object[]) mp_buttons.get("pass");
          btn[6] = color(0,0,0);
        }

        switch (mp_c_buttonPressed) {
          case "diff":
            startPopup("Choose difficulty", OPTIONS_mp_diff_buttons); 
            break;
          case "pass":
            startTypeMPC_pass();
            break;
          case "back":
            screen = Screen.MAIN_MENU;
            log("INFO", "Going to main menu");  
            break;

        }
      } else {
        String POP_button_pressed = popup_button_clicked();
        log("INFO", "Mouse pressed button (popup): " + POP_button_pressed);
        switch (POP_button_pressed) {
          case "easy":
            setDiff_mp(0);
            break;
          case "med":
            setDiff_mp(1);
            break;
          case "hard":
            setDiff_mp(2);
            break;
          case "xtr":
            setDiff_mp(3);
            break;
        }
        closePopup();
      }

      break;
    case CREDITS:
      String cbp = credits_button_clicked();
      switch (cbp) {
        case "back":
          screen = Screen.MAIN_MENU;
          break;
      }
      break;
  }

}
