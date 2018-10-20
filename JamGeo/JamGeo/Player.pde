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

    public void setGolems(int[] sg) {
        for (int i = 0; i < sg.length; ++i)
        	g[i] = new Golem(golemsList[sg[i]]);
        this.golemReady = true;
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
