int[] box = new int[]{10, 10, 40, 40};
boolean hasEnded = false;


public enum PlayerTurn {
    PLAYER1, 
        PLAYER2;
}
PlayerTurn turn = PlayerTurn.PLAYER1;

public static final int SEPARATION_X = 5;
public static final int SEPARATION_Y = 20;

Golem select;

/*
 * Fonction de rendu du jeu (utilisée pendant la partie = tours des joueurs).
 */
void drawGame() {
    fill(WHITE);

    color SPLIT_COLOR = color(125, 0, 125);

    gameCanvas.beginDraw();
    gameCanvas.noStroke();
    gameCanvas.background(BLACK);
    gameCanvas.fill(SPLIT_COLOR);
    gameCanvas.rect(1148, 0, 8, 1080);
    gameCanvas.rect(1046, 286, 208, 508);
    gameCanvas.rect(0, 536, 1920, 8);
    gameCanvas.ellipse(1275+45, 310+45, 90, 90);
    gameCanvas.ellipse(1275+45, 420+45, 90, 90);
    gameCanvas.ellipse(1275+45, 570+45, 90, 90);
    gameCanvas.ellipse(1275+45, 680+45, 90, 90);

    gameCanvas.textSize(30);
    gameCanvas.text(p1.name, 50, 600);
    gameCanvas.text(p2.name, 50, 500);
    if (state == State.TURN_P1)
        gameCanvas.ellipse( 10, 600, 20, 20);
    else 
    gameCanvas.ellipse( 10, 500, 20, 20);
    gameCanvas.endDraw();

    image(gameCanvas, 0, 0, width, height);

    for (int i = 0; i < p1.g.length; i++) {
        p1.g[i].drawGolem(84 + i * 175, height - 280, true);
    }
    for (int i = 0; i < p2.g.length; i++) {
        p2.g[i].drawGolem(84 + i * 175, height - 280, false);
    }


    displayHand();
    if (p1.selected != null) {
        p1.selected.drawCard(1020, 400, 300, 150);
        text(p1.selected.toString(), 1040, 420, 260, 110);
    } 
    if (p2.selected != null) {
        p2.selected.drawCard(1020, 220, 300, 150);
        text(p2.selected.toString(), 1040, 220, 260, 110);
    }


    /*
    switch(turn) {
     case PLAYER1:
     break;
     case PLAYER2:
     break;
     }*/
}

void play() {
    if (isIn(box)) {
        hasEnded = true;
    } else {
        int nbC = p1.hand.size()/2;
        int i;
        for (i = 0; i < p1.hand.size(); i++) {
            int[] box = new int[4];
            if (i == nbC - 1 || i == p1.hand.size() - 1)
                box = new int[]{830 + (i % nbC) * SEPARATION_X + (i / nbC) * (SIZE_MC_X/2 + 40), 
                    570 + (i % nbC) * SEPARATION_Y, 
                    SIZE_MC_X/2, 
                    SIZE_MC_Y/2};
            else
                box = new int[]{830 + (i % nbC) * SEPARATION_X + (i / nbC) * (SIZE_MC_X/2 + 40), 
                    570 + (i % nbC) * SEPARATION_Y, 
                    SIZE_MC_X/2, 
                    SEPARATION_Y};

            if (isIn(box)) {
                p1.selected = p1.hand.get(i);
                break;
            }
        }
        if (i == p1.hand.size()) {
            for (i = 0; i < p2.hand.size(); i++) {
                int[] box = new int[4];
                if (i == nbC - 1 || i == p1.hand.size() - 1)
                    box = new int[]{830 + (i % nbC) * SEPARATION_X + (i / nbC) * (SIZE_MC_X/2 + 40), 
                        10 + (i % nbC) * SEPARATION_Y, 
                        SIZE_MC_X/2, 
                        SIZE_MC_Y/2};
                else
                    box = new int[]{830 + (i % nbC) * SEPARATION_X + (i / nbC) * (SIZE_MC_X/2 + 40), 
                        10 + (i % nbC) * SEPARATION_Y, 
                        SIZE_MC_X/2, 
                        SEPARATION_Y};

                if (isIn(box)) {
                    p2.selected = p2.hand.get(i);
                    break;
                }
            }
        }

        if (state == State.TURN_P1) {
            for (int i = 0; i < p1.g.length; ++i) {
                int[] b = new int[]{84 + i * 175, height - 280, SIZE_GOLEM_X, SIZE_GOLEM_Y};
                if (isIn(b) && select == null) {
                    select = p1.g[i];
                }	
                else if (isIn(b)) {
                    fight(select, p1.g[i]);
                    select = null;
                }
            }
        } else {
            for (int i = 0; i < p2.g.length; ++i) {
                int[] b = new int[]{84 + i * 175, 280, SIZE_GOLEM_X, SIZE_GOLEM_Y};
                if (isIn(b) && select == null) {
                    select = p2.g[i];
                } else if (isIn(b)) {
                    fight(select, p2.g[i]);
                    select = null;
                }
            }
        }
    }
}


void displayHand() {
    int x = 830, y = 570, y2 = 10;
    int i;

    fill(color(50, 142, 255));
    rect(box);

    fill(BLACK);
    stroke(WHITE);
    strokeWeight(2);
    if (p1.hand.size() > 1) {
        for (i = 0; i < (p1.hand.size()/2); i++) {
            if (p1.hand.get(i) != null) {
                p1.hand.get(i).drawCard(x + i * SEPARATION_X, y + i * SEPARATION_Y, SIZE_MC_X/2, SIZE_MC_Y/2);
            }
        }

        for (; i < (p1.hand.size()); i++) {
            if (p1.hand.get(i) != null) {
                p1.hand.get(i).drawCard(x + i * SEPARATION_X + SIZE_MC_X/2 + 10, 
                    y + i % (p1.hand.size() / 2) * SEPARATION_Y, 
                    SIZE_MC_X/2, 
                    SIZE_MC_Y/2);
            }
        }
    }
    if ( p2.hand.size() > 1) {
        for (i = 0; i < (p2.hand.size()/2); i++) {
            if (p1.hand.get(i) != null) {
                p1.hand.get(i).drawCard(x + i * SEPARATION_X, y2 + i * SEPARATION_Y, SIZE_MC_X/2, SIZE_MC_Y/2);
            }
        }

        for (; i < (p2.hand.size()); i++) {
            if (p1.hand.get(i) != null) {
                p1.hand.get(i).drawCard(x + i * SEPARATION_X + SIZE_MC_X/2 + 10, 
                    y2 + i % (p1.hand.size() / 2) * SEPARATION_Y, 
                    SIZE_MC_X/2, 
                    SIZE_MC_Y/2);
            }
        }
    }
}
