
/*
 * Fonction de rendu du jeu (utilisée pendant la partie = tours des joueurs).
 */
void drawGame() {
    fill(WHITE);
    
    color SPLIT_COLOR = color(125, 0, 125);
    
    gameCanvas.beginDraw();
    gameCanvas.noStroke();
    gameCanvas.fill(SPLIT_COLOR);
    gameCanvas.rect(1148, 0 , 8, 1080);
    gameCanvas.rect(1046, 286 , 208, 508);
    gameCanvas.rect(1200, 536 , 1920, 8);
    gameCanvas.ellipse(1275+45, 310+45, 90, 90);
    gameCanvas.ellipse(1275+45, 420+45, 90, 90);
    gameCanvas.ellipse(1275+45, 570+45, 90, 90);
    gameCanvas.ellipse(1275+45, 680+45, 90, 90);
    gameCanvas.endDraw();

    image(gameCanvas, 0, 0, width, height);
}

void play(Player p1, Player p2) {
}
