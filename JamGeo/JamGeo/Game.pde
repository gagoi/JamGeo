
public enum PlayerTurn {
    PLAYER1,
    PLAYER2;
}
PlayerTurn turn = PlayerTurn.PLAYER1;
/*
 * Fonction de rendu du jeu (utilisée pendant la partie = tours des joueurs).
 */
void drawGame() {
    fill(WHITE);

    color SPLIT_COLOR = color(125, 0, 125);

    gameCanvas.beginDraw();
    gameCanvas.noStroke();
    gameCanvas.fill(SPLIT_COLOR);
    gameCanvas.rect(1148, 0, 8, 1080);
    gameCanvas.rect(1046, 286, 208, 508);
    gameCanvas.rect(1200, 536, 1920, 8);
    gameCanvas.ellipse(1275+45, 310+45, 90, 90);
    gameCanvas.ellipse(1275+45, 420+45, 90, 90);
    gameCanvas.ellipse(1275+45, 570+45, 90, 90);
    gameCanvas.ellipse(1275+45, 680+45, 90, 90);


    gameCanvas.text(p1.name, 50, 550);
    gameCanvas.text(p2.name, 50, 450);

    gameCanvas.endDraw();
    int x = 1200, y = 820;

    for (int i = 0; i < p1.hand.size(); ++i) {
    }
/*
    for (int i = 0; i < p1.g.length; ++i) 
        if (p1.g[i] != null) {
            image(golems_textures[p1.g[i].id], 84 + i * 175, height - 280);
        }

    pushMatrix();
    translate(width/2, height/2);
    rotate(PI);
    translate(0, -height/2);
    for (int i = 0; i < p2.g.length; ++i) 
        if (p2.g[i] != null) {
            image(golems_textures[p2.g[i].id], -25 +i * 175, 500);
        }
    popMatrix(); 
	for (int i = 0; i < p1.g.length; ++i) 
        if (p1.g[i] != null) 
            text(p1.g[i].name, 150 + i * 175, 680); // BAS - TODO : Coefficients à modifier pour alligner correctement
            
    for (int i = 0; i < p2.g.length; ++i) 
        if (p2.g[i] != null) 
            text(p2.g[i].name, 660 + i * -175, 90); // HAUT - TODO : Coefficients à modifier pour alligner correctement
*/
	for(int i = 0; i < p1.g.length; i++) {
    	p1.g[i].drawGolem(84 + i * 175, height - 280, true);
	}
    for(int i = 0; i < p2.g.length; i++) {
        p2.g[i].drawGolem(84 + i * 175, height - 280, false);
    }

    image(gameCanvas, 0, 0, width, height);
    
    //p1.mc[0].drawCard(980, 395, SIZE_MC_X, SIZE_MC_Y);
    //p1.mc[0].drawCard(830, 571, SIZE_MC_X/2, SIZE_MC_Y/2);
    //p1.mc[0].drawCard(835, 15, SIZE_MC_X/2, SIZE_MC_Y/2);
    
    
    p1.turn();
    p1.turn();
    p1.turn();
    p1.turn();
    
    drawDecks();
    if(p1.selected != null)
    	p1.selected.drawCard(10, 10, SIZE_MC_X, SIZE_MC_Y);
    
    
    /*
    switch(turn) {
        case PLAYER1:
            break;
        case PLAYER2:
            break;
    }*/
}

void play() {
    int[] box = new int[]{830, 570, SIZE_MC_X/2, 20};
    for(int i = 0; i < p1.hand.size(); i++) {
        if(isIn(box)) {
        	p1.selected = p1.hand.get(i);
        	println("yolo");
        }
    }
}

void drawDecks() {
    int x = 830, y = 570;
    int i;
    for(i = 0; i < (p1.hand.size()/2); i++) {
        if(p1.hand.get(i) != null) {
        	p1.hand.get(i).drawCard(x, y, SIZE_MC_X/2, SIZE_MC_Y/2);
        	x += 5;
        	y += 20;
        }
    }
    x = x + SIZE_MC_X/2 + 10;
    y = 570;
    for(; i < (p1.hand.size()); i++) {
        //println("p1.hand.get(i): ", p1.hand.get(i));
        if(p1.hand.get(i) != null) {
            p1.hand.get(i).drawCard(x, y, SIZE_MC_X/2, SIZE_MC_Y/2);
            x += 5;
            y += 20;
        }
    }
}
