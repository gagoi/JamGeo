public class Player {
    private Golem[] g;
    private MagicCard[] mc;
    private ArrayList<MagicCard> deck, hand, destroyed;
    private String name;
    private MagicCard selected;

    private boolean deckReady, golemReady;

    public Player(String name) {
        this.name = name;
        this.hand = new ArrayList();
        this.destroyed = new ArrayList();
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

    public void setCards(int[] sc, int[] sf) {
        for (int i = 0; i < sc.length; ++i) {
            if (sc[i] < 16)
                mc[i] = (MagicCard)new Equipement((Equipement)magicCardsList[sc[i]]);
            else if (sc[i] < 19)
                mc[i] = (MagicCard)new DownLevel((DownLevel)magicCardsList[sc[i]]);
            else if (sc[i] < 22)
                mc[i] = (MagicCard)new UpLife((UpLife)magicCardsList[sc[i]]);
            else if (sc[i] < 25)
                mc[i] = (MagicCard)new Heal((Heal)magicCardsList[sc[i]]);
            else if (sc[i] < 28)
                mc[i] = (MagicCard)new Damage((Damage)magicCardsList[sc[i]]);
            else if (sc[i] < 31)
                mc[i] = (MagicCard)new Thorn((Thorn)magicCardsList[sc[i]]);
            else if (sc[i] < 34)
                mc[i] = (MagicCard)new Shield((Shield)magicCardsList[sc[i]]);
            else if (sc[i] < 37)
                mc[i] = (MagicCard)new Taunt((Taunt)magicCardsList[sc[i]]);
            else if (sc[i] < 39)
                mc[i] = (MagicCard)new Multiply((Multiply)magicCardsList[sc[i]]);
            else if (sc[i] < 42)
                mc[i] = (MagicCard)new Poison((Poison)magicCardsList[sc[i]]);
            else
                mc[i] = (MagicCard)new Dequip((Dequip)magicCardsList[sc[i]]);
        }
        mc[mc.length - 2] = (MagicCard)new Field((Field) fieldsList[sf[0]]);
        mc[mc.length - 1] = (MagicCard)new Field((Field) fieldsList[sf[1]]);

        this.deck = new ArrayList<MagicCard>(java.util.Arrays.asList(mc));    



        deckShuffle();
        this.deckReady = true;
    }

    public void turn() {
        if (deck.size() <= 0) {
            for (MagicCard c : destroyed)
                deck.add(c);
            destroyed.clear();
            deckShuffle();
        }
        if (deck.size() > 0) {
            MagicCard c = deck.remove(0);
            hand.add(c);
        }
    }

    public boolean hasLost() {
        return g[0] == null && g[1] == null && g[2] == null && g[3] == null;
    }

    public void deckShuffle() {
        java.util.Collections.shuffle(deck);
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
