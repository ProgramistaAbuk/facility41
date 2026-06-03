PImage bg_main;
PImage bg_levels;
PImage title_text;
PImage credits;

void img_load() {
    bg_main = loadImage("bg_main.png");
    bg_main.resize(0, height); 

    bg_levels = loadImage("bg_levels.png");
    bg_levels.resize(0,height);

    title_text = loadImage("title_text.png");
    title_text.resize(0,height);

    credits = loadImage("credits.png");
    credits.resize(0,height);
}