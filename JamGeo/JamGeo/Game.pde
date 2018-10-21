
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
    gameCanvas.endDraw();

    image(gameCanvas, 0, 0, width, height);
}
