private enum State {
    START, GOLEM_P1, GOLEM_P2, DECK_P1, DECK_P2, TURN_P1, TURN_P2, END;
}

State state = State.START;
int mouseScroll;

Player p1, p2;

PImage buttonBackground, buttonUnvalidBackground, buttonValidBackground;
PGraphics gameCanvas;

void setup() {
    fullScreen(P2D);

    p1 = new Player("Joueur 1");
    p2 = new Player("Joueur 2");

    p1.setGolems(new int[]{0, 1, 6, 11});
    p2.setGolems(new int[]{4, 5, 2, 7});
    p1.setCards(new int[]{2, 5, 8, 9, 13, 16, 17, 20, 24, 25}, new int[]{0, 2});
    p2.setCards(new int[]{26, 29, 31, 34, 38, 40, 42, 11, 20}, new int[]{1, 5});

    gameCanvas = createGraphics(1920, 1080);

    buttonBackground = loadImage("resources/textures/button.png");
    buttonValidBackground = loadImage("resources/textures/buttonValid.png");
    buttonUnvalidBackground = loadImage("resources/textures/buttonUnvalid.png");

    init();
    initMainMenu();
    initGolemsMenu();
    initCardsMenu();

    loadTextures();
}

void draw() {
    stroke(0);
    background(color(0));
    fill(255, 0, 0);
    rect(but_close[0], but_close[1], but_close[2], but_close[3]);
    fill(255, 255, 255);
    write("EXIT", but_close);
    switch (state) {
    case START :
        drawMainMenu();
        
        break;
    case GOLEM_P1 :
        drawSelectionGolemsMenu();
        break;
    case GOLEM_P2 :
        drawSelectionGolemsMenu();
        break;
    case DECK_P1 :
        drawSelectionCardsMenu();
        break;
    case DECK_P2 :
        drawSelectionCardsMenu();
        break;
    case TURN_P1 :
        drawGame();
    case TURN_P2 :
        drawGame();
        break;
    case END :
    	if (p1.hasLost()) text("GG " + p2.name, 0, 0, width, height);
    	else text("GG " + p2.name, 0, 0, width, height);
        break;
    }
}

void mouseWheel(MouseEvent event) {
    int e = event.getCount();
    if (mouseScroll > - but_fields_list[but_fields_list.length - 1][1] + but_cards_list[0][1] && e == 1 || mouseScroll < 0 && e == -1)
        mouseScroll -= e*8;
}

void mousePressed() {
    if (isIn(but_close))
        exit();
    switch (state) {
    case START :
        if (isIn(but_golem_1))
            state = State.GOLEM_P1;
        else if (isIn(but_golem_2))
            state = State.GOLEM_P2;
        else if (isIn(but_deck_1)) {
            state = State.DECK_P1;
            mouseScroll = 0;
        } else if (isIn(but_deck_2)) {
            state = State.DECK_P2;
            mouseScroll = 0;
        } else if (isIn(but_start_game)) {
            state = State.TURN_P1;
            p1.turn();
        }
        break;
    case GOLEM_P1 :
        validSelectionGolems(p1);
        break;
    case GOLEM_P2 :
        validSelectionGolems(p2);
        break;
    case DECK_P1 :
        validSelectionCards(p1);
        break;
    case DECK_P2 :
        validSelectionCards(p2);
        break;
    case TURN_P1 :
        play();
        println(hasEnded);
        if (p2.hasLost()) {
            state = State.END;
        }
        if (hasEnded) {
            hasEnded = false;
            state = State.TURN_P2;
            p2.turn();
            select = null;
    }
        break;
    case TURN_P2 :
    	println("D3");
        play();        //<>//
        
        if (p1.hasLost()) {
            state = State.END;
        }
        
        if (hasEnded) {
            hasEnded = false;
            state = State.TURN_P1;
            p1.turn();
            select = null;
        }
        break;
    case END :
    	
        break;
    }
}
