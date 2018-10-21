int[] selected_golems = new int[4]; // Liste des IDs des golems sélectionnés actuellement.
int[][] but_golems_list; // Tableau contenant les coordonnées de chaque bouton : tab[i] = {x, y, w, h}.
int ct_selected_golems; // Nombre de golems actuellement sélectionnés.

/*
 * Fonction contenant l'initialisation des boutons de sélection des golems.
 * Initialise également la sélection à rien (id = -1).
 */
void initGolemsMenu() {
    but_golems_list = new int[golemsList.length][4];

    for (int i = 0; i < golemsList.length; i++) {
        but_golems_list[i][0] = 150 + (int) (i % 4) * 280;
        but_golems_list[i][1] = 220 + (i / 4) * 180;
        but_golems_list[i][2] = 250;
        but_golems_list[i][3] = 150;
    }

    clearTab(selected_golems);
}


/*
 * Rendu du menu de sélection des golems.
 * 
 * Affiche tout d'abord les boutons pour valider et remettre à 0 la sélection.
 * Puis les golems dans un tableau de 3 lignes et 4 colonnes. (Une ligne correspond à un type de Golem).
 */
void drawSelectionGolemsMenu() {
    // Ajout des boutons de validation et remise à 0.
    fill(color(0, 255, 255));    
    rect(but_clear_selection);
    fill(color(255, 0, 255));    
    rect(but_valid_selection);
    fill(WHITE);
    write("CLEAR", but_clear_selection);
    write("VALID", but_valid_selection);

    // Affiche tous les golems.
    for (int i = 0; i < golemsList.length; ++i) {
        for (int j = 0; j < selected_golems.length; j++)
            if (selected_golems[j] == i) {
                fill(WHITE);
                rect(but_golems_list[i][0]-2, but_golems_list[i][1]-2, but_golems_list[i][2]+4, but_golems_list[i][3]+4);
            }

        switch (i / 4) {
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
void validSelectionGolems(Player p) {
    if (isIn(but_clear_selection)) {
        clearAll(); // Clear all vide toutes les sélections (voir Menu_Cards).
    } else if (isIn(but_valid_selection)) {
        if (ct_selected_golems == selected_golems.length) {
            clearAll(); // Clear all vide toutes les sélections (voir Menu_Cards).
            state = State.START;
        }
    } else {
        for (int i = 0; i < golemsList.length; ++i) {
            if (isIn(but_golems_list[i])) {
                boolean isInTab = false;
                for (int j = 0; j < selected_golems.length; j++)
                    isInTab = isInTab || selected_golems[j] == i;
                if (!isInTab && ct_selected_golems < selected_golems.length)
                    selected_golems[ct_selected_golems++] = i;
            }
        }
    }
}
