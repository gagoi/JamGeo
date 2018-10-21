color BLACK = color(0);
color WHITE = color(255);


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