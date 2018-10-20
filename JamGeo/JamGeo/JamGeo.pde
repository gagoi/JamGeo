private enum State {
	START, GOLEM_P1, GOLEM_P2, DECK_P1, DECK_P2, TURN_P1, TURN_P2, END;
}

State state = State.START;

PImage buttonBackground;
int[] closeButton;


void setup() {
    fullScreen();
    
    buttonBackground = loadImage("resources/textures/button.png");
    closeButton = new int[]{width-60, 10, 50, 50};
    
	init();
}

void draw() {
    switch (state) {
        case START :
        	background(color(0));
        	color(0);
        	image(buttonBackground, 100, 600, 200, 100); // GOLEM 1
            image(buttonBackground, 350, 600, 200, 100); // GOLEM 2
            image(buttonBackground, 600, 600, 200, 100); // GAME
            image(buttonBackground, 100, 600, 200, 100); // DECK 1
            image(buttonBackground, 100, 600, 200, 100); // DECK 2
            fill(255, 0, 0);
            rect(closeButton[0], closeButton[1], closeButton[2], closeButton[3]);
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

void mousePressed() {
    switch (state) {
        case START :
        	if (isIn(mouseX, mouseY, closeButton))
        		exit();
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

boolean isIn(int x, int y, int[] box) {
	return (box[0] < x && box[1] < y && box[0] + box[2] > x && box[1] + box[3] > y);
}
