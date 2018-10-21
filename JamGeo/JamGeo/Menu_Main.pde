int[] but_close; // Tableau contenant les coordonnées du bouton pour quitter le jeu.
int[] but_start_game; // Tableau contenant les coordonnées du bouton pour lancer une partie.
int[] but_clear_selection; // Tableau contenant les coordonnées du bouton pour vider la sélection de cartes/golems.
int[] but_valid_selection; // Tableau contenant les coordonnées du bouton pour valider la sélection de cartes/golems.
int[] but_golem_1, but_golem_2; // Tableau contenant les coordonnées des boutons accédant au menu de selection des golems.
int[] but_deck_1, but_deck_2; // Tableau contenant les coordonnées des boutons accédant au menu de selection des cartes.

/*
 * Fonction contenant l'initialisation des tableaux si dessus (les coordonnées des différents boutons du menu principal).
 */
void initMainMenu() {
    but_close = new int[]{width-60, 10, 50, 50};
    but_golem_1 = new int[]{100, 600, 200, 100};
    but_golem_2 = new int[]{350, 600, 200, 100};
    but_start_game = new int[]{600, 600, 200, 100};
    but_deck_1 = new int[]{850, 600, 200, 100};
    but_deck_2 = new int[]{1100, 600, 200, 100};
    but_clear_selection = new int[]{10, 10, 50, 50};
    but_valid_selection = new int[]{10, 70, 50, 50};
}


/*
 * Fonction de rendu du menu principal.
 */
void drawMainMenu() {
    // Pour les boutons renvoyant vers d'autres menus, on vérifie si les joueurs sont déjà prêts.
    // Si ils le sont on affiche le bouton en vert, sinon en rouge.
    image(p1.isGolemReady() ? buttonValidBackground : buttonUnvalidBackground, but_golem_1);
    image(p2.isGolemReady() ? buttonValidBackground : buttonUnvalidBackground, but_golem_2);
    image(p1.isDeckReady() ? buttonValidBackground : buttonUnvalidBackground, but_deck_1);
    image(p2.isDeckReady() ? buttonValidBackground : buttonUnvalidBackground, but_deck_2);
    image(buttonBackground, but_start_game);
    fill(WHITE);
    write("Select Golems (P1)", but_golem_1);
    write("Select Golems (P2)", but_golem_2);
    write("Select Cards (P1)", but_deck_1);
    write("Select Cards (P2)", but_deck_2);
    write("Start", but_start_game);
}
