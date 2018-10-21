
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

    int x = 1200, y = 820;

    for (int i = 0; i < p1.hand.size(); ++i) {
    }

    for (int i = 0; i < p1.g.length; ++i) 
        if (p1.g[i] != null) {
            image(golems_textures[p1.g[i].id], 100 + i * 150, height - 280);
        }
	
	pushMatrix();
	translate(width/2, height/2);
	rotate(PI/2);
    for (int i = 0; i < p2.g.length; ++i) 
        if (p2.g[i] != null) {
            image(golems_textures[p2.g[i].id], 100 + i * 150,  280);
        }
	rotate(-PI/2);
	translate(-width/2, -height/2);
    gameCanvas.endDraw();

    image(gameCanvas, 0, 0, width, height);
}

void play() {
}
