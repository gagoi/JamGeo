public class Player {
    private Golem[] g;
    private MagicCard[] mc;
    private String name;

    private boolean deckReady, golemReady;

    public Player(String name) {
        this.name = name;	
        g = new Golem[4];
        mc = new MagicCard[12];
    }

    public String getName() {
        return this.name;
    }

    public void setGolems(int[] sg) {
        for (int i = 0; i < sg.length; ++i)
        	g[i] = new Golem(golemsList[sg[i]]);
        this.golemReady = true;
    }
    
    public void setCards(int[] sc, int[] fields) {
        for (int i = 0; i < sc.length; ++i) {
        	if(i < 16)
        		mc[i] = (MagicCard)new Equipement((Equipement)magicCardsList[i]);
        	else if(i < 19)
                mc[i] = (MagicCard)new DownLevel((DownLevel)magicCardsList[i]);
            else if(i < 22)
                mc[i] = (MagicCard)new UpLife((UpLife)magicCardsList[i]);
            else if(i < 25)
                mc[i] = (MagicCard)new Heal((Heal)magicCardsList[i]);
            else if(i < 28)
                mc[i] = (MagicCard)new Damage((Damage)magicCardsList[i]);
            else if(i < 31)
                mc[i] = (MagicCard)new Thorn((Thorn)magicCardsList[i]);
            else if(i < 34)
                mc[i] = (MagicCard)new Shield((Shield)magicCardsList[i]);
            else if(i < 37)
                mc[i] = (MagicCard)new Taunt((Taunt)magicCardsList[i]);
            else if(i < 39)
                mc[i] = (MagicCard)new Multiply((Multiply)magicCardsList[i]);
            else if(i < 42)
                mc[i] = (MagicCard)new Poison((Poison)magicCardsList[i]);
            else
                mc[i] = (MagicCard)new Dequip((Dequip)magicCardsList[i]);
        }
        mc[sc.length - 2] = (MagicCard)new Field((Field)fieldsList[fields[0]]);
        mc[sc.length - 1] = (MagicCard)new Field((Field)fieldsList[fields[1]]);
        	
        this.deckReady = true;
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
