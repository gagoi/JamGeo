public class Player {
    private Golem[] g;
    private String name;

    private boolean deckReady, golemReady;

    public Player(String name) {
        this.name = name;	
        g = new Golem[4];
    }

    public String getName() {
        return this.name;
    }

    public void chooseGolems() {
    }

	public void setGolemReady(boolean golemReady) {
		this.golemReady = golemReady;
	}

	public void setDeckReady(boolean deckReady) {
		this.deckReady = deckReady;
	}

    public boolean isDeckReady() {
        return deckReady;
    }

    public boolean isGolemReady() {
        return golemReady;
    }
}
