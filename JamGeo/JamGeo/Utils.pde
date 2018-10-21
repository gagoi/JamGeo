color BLACK = color(0);
color WHITE = color(255);

PImage[] cards_textures, golems_textures;

void loadTextures() {
    int i;
    golems_textures = new PImage[12];
    for (i = 0; i < golems_textures.length; i++)
        golems_textures[i] = loadImage("resources/textures/golems/golem_" + i + ".png");
    cards_textures = new PImage[magicCardsList.length + fieldsList.length];
    for (i = 0; i < magicCardsList.length; i++)
        cards_textures[i] = loadImage("resources/textures/card.png");
    for (; i < fieldsList.length; i++)
        cards_textures[i] = loadImage("resources/textures/card2.png");
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

void clearTab(int[] tab) {
    for (int i = 0; i < tab.length; ++i)
        tab[i] = -1;
}
