private enum State {
    START, GOLEM_P1, GOLEM_P2, DECK_P1, DECK_P2, TURN_P1, TURN_P2, END;
}

color WHITE = color(255);

State state = State.START;
int mouseScroll;

Player p1, p2;

PImage buttonBackground, buttonUnvalidBackground, buttonValidBackground;
PGraphics gameCanvas;
int[] but_close, but_golem_1, but_golem_2, but_deck_1, but_deck_2, but_start_game, 
    but_clear_selection, but_valid_selection;
int[][] but_golems_list, but_cards_list, but_fields_list;

int[] selected_golems = new int[4], selected_cards = new int[10], selected_fields = new int[2];
int ct_selected_golems, ct_selected_cards, ct_selected_fields;

void setup() {
    fullScreen();

    p1 = new Player("Joueur 1");
    p2 = new Player("Joueur 2");

	gameCanvas = createGraphics(1920, 1080);

    buttonBackground = loadImage("resources/textures/button.png");
    buttonValidBackground = loadImage("resources/textures/buttonValid.png");
    buttonUnvalidBackground = loadImage("resources/textures/buttonUnvalid.png");

    but_close = new int[]{width-60, 10, 50, 50};
    but_golem_1 = new int[]{100, 600, 200, 100};
    but_golem_2 = new int[]{350, 600, 200, 100};
    but_start_game = new int[]{600, 600, 200, 100};
    but_deck_1 = new int[]{850, 600, 200, 100};
    but_deck_2 = new int[]{1100, 600, 200, 100};
    but_clear_selection = new int[]{10, 10, 50, 50};
    but_valid_selection = new int[]{10, 70, 50, 50};

    but_golems_list = new int[golemsList.length][4];
    but_cards_list = new int[magicCardsList.length][4];
    but_fields_list = new int[fieldsList.length][4];

    for (int i = 0; i < golemsList.length; i++) {
        int y = i / 4;
        int x = i % 4;
        but_golems_list[i][0] = 150 + x * 280;
        but_golems_list[i][1] = 220 + y * 180;
        but_golems_list[i][2] = 250;
        but_golems_list[i][3] = 150;
    }

    for (int i = 0; i < magicCardsList.length; i++) {
        int y = i / 5;
        int x = i % 5;

        but_cards_list[i][0] = 100 + x * 250;
        but_cards_list[i][1] = 300 + y * 130;
        but_cards_list[i][2] = 150;
        but_cards_list[i][3] = 100;
    }

    for (int i = 0; i < fieldsList.length; i++) {
        int y = i / 5;
        int x = i % 5;

        but_fields_list[i][0] = 100 + x * 250;
        but_fields_list[i][1] = but_cards_list[magicCardsList.length-1][1] + y * 130;
        but_fields_list[i][2] = 150;
        but_fields_list[i][3] = 100;
    }

    for (int i = 0; i < selected_golems.length; ++i)
        selected_golems[i] = -1;

    for (int i = 0; i < selected_cards.length; ++i)
        selected_cards[i] = -1;

    for (int i = 0; i < selected_fields.length; ++i)
        selected_fields[i] = -1;

    init();
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
        color(0);
        image(p1.isGolemReady() ? buttonValidBackground : buttonUnvalidBackground, but_golem_1);
        image(p2.isGolemReady() ? buttonValidBackground : buttonUnvalidBackground, but_golem_2);
        image(p1.isDeckReady() ? buttonValidBackground : buttonUnvalidBackground, but_deck_1);
        image(p2.isDeckReady() ? buttonValidBackground : buttonUnvalidBackground, but_deck_2);
        image(buttonBackground, but_start_game);
        fill(255, 255, 255);
        write("Select Golems (P1)", but_golem_1);
        write("Select Golems (P2)", but_golem_2);
        write("Select Cards (P1)", but_deck_1);
        write("Select Cards (P2)", but_deck_2);
        write("Start", but_start_game);
        fill(0);
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
        break;
    case TURN_P2 :
        break;
    case END :
        break;
    }
}

void mouseWheel(MouseEvent event) {
    int e = event.getCount();
    if (mouseScroll > - width / 2 && e == 1 ||mouseScroll < - width / 2 + but_cards_list[magicCardsList.length-1][1] && e == -1)
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
        break;
    case TURN_P2 :
        break;
    case END :
        break;
    }
}

void drawSelectionGolemsMenu() {
    fill(color(0, 255, 255));    
    rect(but_clear_selection);
    fill(color(255, 0, 255));    
    rect(but_valid_selection);
    fill(WHITE);
    write("CLEAR", but_clear_selection);
    write("VALID", but_valid_selection);

    for (int i = 0; i < golemsList.length; ++i) {
        int y = i / 4;
        for (int j = 0; j < selected_golems.length; j++)
            if (selected_golems[j] == i) {
                fill(255);
                rect(but_golems_list[i][0]-2, but_golems_list[i][1]-2, but_golems_list[i][2]+4, but_golems_list[i][3]+4);
            }

        switch (y) {
        case 0 :
            fill(color(0, 255, 0));
            break;
        case 1 :
            fill(color(255, 0, 0));
            break;
        case 2 :
            fill(color(0, 0, 255));
            break;
        }
        rect(but_golems_list[i]);
    }
}
void drawSelectionCardsMenu() {
    fill(color(0, 255, 255));    
    rect(but_clear_selection);
    fill(color(255, 0, 255));    
    rect(but_valid_selection);
    fill(WHITE);
    write("CLEAR", but_clear_selection);
    write("VALID", but_valid_selection);

    for (int i = 0; i < magicCardsList.length; i++) {
        for (int j = 0; j < selected_cards.length; j++)
            if (selected_cards[j] == i) {
                fill(WHITE);
                rect(but_cards_list[i][0]-2, but_cards_list[i][1]-2 + mouseScroll, but_cards_list[i][2]+4, but_cards_list[i][3]+4);
            }
        fill(color(125, 0, 125));
        rect(but_cards_list[i], mouseScroll);
    }

    for (int i = 0; i < fieldsList.length; i++) {
        for (int j = 0; j < selected_fields.length; j++)
            if (selected_fields[j] == i) {
                fill(WHITE);
                rect(but_fields_list[i][0]-2, but_fields_list[i][1]-2 + mouseScroll, but_fields_list[i][2]+4, but_fields_list[i][3]+4);
            }
        fill(color(125, 125, 0));
        rect(but_fields_list[i], mouseScroll);
    }
}

void drawGame() {
    fill(WHITE);
    pg.rect(15, 15 ,15 ,15);
}

void validSelectionGolems(Player p) {
    if (isIn(but_clear_selection)) {
        for (int i = 0; i < selected_golems.length; i++)
            selected_golems[i] = -1;
        ct_selected_golems = 0;
    } else if (isIn(but_valid_selection)) {
        if (ct_selected_golems == selected_golems.length) {
            p.setGolems(selected_golems);
            for (int i = 0; i < selected_golems.length; i++)
                selected_golems[i] = -1;
            ct_selected_golems = 0;
            state = State.START;
        }
    } else {
        for (int i = 0; i < golemsList.length; ++i) {
            if (isIn(but_golems_list[i])) {
                boolean isInTab = false;
                for (int j = 0; j < selected_golems.length; j++)
                    isInTab = isInTab || selected_golems[j] == i;
                if (!isInTab && ct_selected_golems < selected_golems.length) {
                    selected_golems[ct_selected_golems++] = i;
                }
            }
        }
    }
}

void validSelectionCards(Player p) {
    if (isIn(but_clear_selection)) {
        for (int i = 0; i < selected_fields.length; i++)
            selected_fields[i] = -1;
        for (int i = 0; i < selected_cards.length; i++)
            selected_cards[i] = -1;
        ct_selected_cards = 0;
        ct_selected_fields = 0;
    } else if (isIn(but_valid_selection)) {
        if (ct_selected_cards == selected_cards.length && ct_selected_fields == selected_fields.length) {
            p.setCards(selected_cards, selected_fields);
            for (int i = 0; i < selected_cards.length; i++)
                selected_cards[i] = -1;
            for (int i = 0; i < selected_fields.length; i++)
                selected_fields[i] = -1;
            ct_selected_cards = 0;
            ct_selected_fields = 0;
            state = State.START;
        }
    } else {
        for (int i = 0; i < magicCardsList.length; ++i) {
            if (isIn(but_cards_list[i], mouseScroll)) {
                boolean isInTab = false;
                for (int j = 0; j < selected_cards.length; j++)
                    isInTab = isInTab || selected_cards[j] == i;
                if (!isInTab && ct_selected_cards < selected_cards.length) {
                    selected_cards[ct_selected_cards++] = i;
                }
            }
        }
        for (int i = 0; i < fieldsList.length; ++i) {
            if (isIn(but_fields_list[i], mouseScroll)) {
                boolean isInTab = false;
                for (int j = 0; j < selected_fields.length; j++)
                    isInTab = isInTab || selected_fields[j] == i;
                if (!isInTab && ct_selected_fields < selected_fields.length) {
                    selected_fields[ct_selected_fields++] = i;
                }
            }
        }
    }
}

void rect(int[] box) {
    rect(box[0], box[1], box[2], box[3]);
}

void rect(int[] box, int scroll) {
    rect(box[0], box[1] + scroll, box[2], box[3]);
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

boolean isIn(int[] box, int offset) {
    return isIn(mouseX, mouseY - offset, box);
}

boolean isIn(int x, int y, int[] box) {
    return (box[0] < x && box[1] < y && box[0] + box[2] > x && box[1] + box[3] > y);
}
