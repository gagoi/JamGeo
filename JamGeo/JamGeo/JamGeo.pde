private enum State {
	START, GOLEM_P1, GOLEM_P2, DECK_P1, DECK_P2, TURN_P1, TURN_P2, END;
}

State state = State.START;

PImage buttonBackground;
int[] but_close, but_golem_1, but_golem_2, but_deck_1, but_deck_2, but_start_game;


void setup() {
    fullScreen();
    
    buttonBackground = loadImage("resources/textures/button.png");
    but_close = new int[]{width-60, 10, 50, 50};
    but_golem_1 = new int[]{100, 600, 200, 100};
    but_golem_2 = new int[]{350, 600, 200, 100};
    but_start_game = new int[]{600, 600, 200, 100};
    but_deck_1 = new int[]{850, 600, 200, 100};
    but_deck_2 = new int[]{1100, 600, 200, 100};
    
	init();
}

void draw() {
    switch (state) {
        case START :
        	background(color(0));
        	color(0);
        	image(buttonBackground, but_golem_1);
            image(buttonBackground, but_golem_2);
            image(buttonBackground, but_deck_1);
            image(buttonBackground, but_deck_2);
            image(buttonBackground, but_start_game);
            fill(255, 0, 0);
            rect(but_close[0], but_close[1], but_close[2], but_close[3]);
            fill(255, 255, 255);
            write("EXIT", but_close);
            write("Select Golems (P1)", but_golem_1);
            write("Select Golems (P2)", but_golem_2);
            write("Select Cards (P1)", but_deck_1);
            write("Select Cards (P2)", but_deck_2);
            write("Start", but_start_game);
            fill(0);
        	break;
        case GOLEM_P1 :
        	for (Golem g : g) {
        		println(g);
        	}
        	break;
        case GOLEM_P2 :
        	break;
        case DECK_P1 :
        	break;
        case DECK_P2 :
        	break;
        case TURN_P1 :
        	break;
        case TURN_P2 :
        	break;
        case END :
        	break;
    }
}

void mousePressed() {
    switch (state) {
        case START :
        	if (isIn(but_close))
        		exit();
        	if (isIn(but_golem_1))
        		state = State.GOLEM_P1;
            break;
        case GOLEM_P1 :
            break;
        case GOLEM_P2 :
            break;
        case DECK_P1 :
            break;
        case DECK_P2 :
            break;
        case TURN_P1 :
            break;
        case TURN_P2 :
            break;
        case END :
            break;
    }
}

void image(PImage img, int[] box) {
   	image(img, box[0], box[1], box[2], box[3]);
}

void write(String txt, int[] box) {
    textAlign(CENTER, CENTER);
    text(txt, box[0], box[1], box[2], box[3]);
}

boolean isIn(int[] box) {
	return isIn(mouseX, mouseY, box);
}

boolean isIn(int x, int y, int[] box) {
	return (box[0] < x && box[1] < y && box[0] + box[2] > x && box[1] + box[3] > y);
}
