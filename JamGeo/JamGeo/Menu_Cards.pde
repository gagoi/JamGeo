int[] selected_cards = new int[10]; // Liste des IDs des magies sélectionnées actuellement.
int[] selected_fields = new int[2]; // Liste des IDs des terrains sélectionnés actuellement.
int[][] but_cards_list; // Tableau contenant les coordonnées de chaque bouton : tab[i] = {x, y, w, h}.
int[][] but_fields_list; // Tableau contenant les coordonnées de chaque bouton : tab[i] = {x, y, w, h}.
int ct_selected_cards; // Nombre de magies actuellement sélectionnés.
int ct_selected_fields; // Nombre de terrains actuellement sélectionnés.

/*
 * Fonction contenant l'initialisation des boutons de sélection des magies et terrains.
 * Initialise également la sélection à rien (id = -1).
 */
void initCardsMenu() {
    but_cards_list = new int[magicCardsList.length][4];
    but_fields_list = new int[fieldsList.length][4];
    
    for (int i = 0; i < magicCardsList.length; i++) {
        but_cards_list[i][0] = 100 + i % 5* 250;
        but_cards_list[i][1] = 300 + (int) (i / 5) * 130;
        but_cards_list[i][2] = 150;
        but_cards_list[i][3] = 100;
    }

    for (int i = 0; i < fieldsList.length; i++) {
        but_fields_list[i][0] = 100 + i % 5 * 250;
        but_fields_list[i][1] = but_cards_list[magicCardsList.length-1][1] + (int) (i / 5) * 130;
        but_fields_list[i][2] = 150;
        but_fields_list[i][3] = 100;
    }

    clearTab(selected_cards);
    clearTab(selected_fields);
}

/* 
 * Fonction de rendu du menu de sélection des cartes (magies et terrains).
 
 * Affiche tout d'abord les boutons pour valider et remettre à 0 la sélection.
 * Puis les maiges dans un tableau de x lignes et 5 colonnes.
 * Et enfin les terrains de la même manière.
 */
void drawSelectionCardsMenu() {
    // Ajout des boutons de validation et remise à 0.
    fill(color(0, 255, 255));    
    rect(but_clear_selection);
    fill(color(255, 0, 255));    
    rect(but_valid_selection);
    fill(WHITE);
    write("CLEAR", but_clear_selection);
    write("VALID", but_valid_selection);

    // Affiche toutes les cartes.
    for (int i = 0; i < magicCardsList.length; i++) {
        for (int j = 0; j < selected_cards.length; j++)
            if (selected_cards[j] == i) {
                fill(WHITE);
                rect(but_cards_list[i][0]-2, but_cards_list[i][1]-2 + mouseScroll, but_cards_list[i][2]+4, but_cards_list[i][3]+4);
            }
        fill(color(125, 0, 125));
        rect(but_cards_list[i], mouseScroll);
        fill(color(BLACK));
        text(magicCardsList[i].name, but_cards_list[i][0], but_cards_list[i][1] + mouseScroll, but_cards_list[i][2], but_cards_list[i][3]);
    }

    for (int i = 0; i < fieldsList.length; i++) {
        for (int j = 0; j < selected_fields.length; j++)
            if (selected_fields[j] == i) {
                fill(WHITE);
                rect(but_fields_list[i][0]-2, but_fields_list[i][1]-2 + mouseScroll, but_fields_list[i][2]+4, but_fields_list[i][3]+4);
            }
        fill(color(125, 125, 0));
        rect(but_fields_list[i], mouseScroll);
        fill(color(BLACK));
        text(fieldsList[i].name, but_fields_list[i][0], but_fields_list[i][1] + mouseScroll, but_fields_list[i][2], but_fields_list[i][3]);
    }
}

/*
 * Fonction gérant les clics du menu de sélection des cartes.
 * 
 * Si le bouton de remise à 0 est cliqué, on vide le tableau et on remet le compteur à 0.
 * Sinon si le bouton de validation est cliqué on vérifie que le joueur à sélectionné le bon nombre de cartes.
 */
void validSelectionCards(Player p) {
    if (isIn(but_clear_selection)) {
        clearAll();
    } else if (isIn(but_valid_selection)) {
        if (ct_selected_cards == selected_cards.length && ct_selected_fields == selected_fields.length) {
            p.setCards(selected_cards, selected_fields);
            clearAll();
            state = State.START;
        }
    } else {
        for (int i = 0; i < magicCardsList.length; ++i) {
            if (isIn(but_cards_list[i], mouseScroll)) {
                boolean isInTab = false;
                for (int j = 0; j < selected_cards.length; j++)
                    isInTab = isInTab || selected_cards[j] == i;
                if (!isInTab && ct_selected_cards < selected_cards.length)
                    selected_cards[ct_selected_cards++] = i;
            }
        }
        for (int i = 0; i < fieldsList.length; ++i) {
            if (isIn(but_fields_list[i], mouseScroll)) {
                boolean isInTab = false;
                for (int j = 0; j < selected_fields.length; j++)
                    isInTab = isInTab || selected_fields[j] == i;
                if (!isInTab && ct_selected_fields < selected_fields.length)
                    selected_fields[ct_selected_fields++] = i;
            }
        }
    }
}

void clearAll() {
    clearTab(selected_fields);
    clearTab(selected_cards);
    clearTab(selected_golems);
    ct_selected_golems = 0;
    ct_selected_cards = 0;
    ct_selected_fields = 0;
}
