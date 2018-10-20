/*
public enum Stat {
    LEVEL,
    HEAL,
    LIFE,
    DAMAGE,
    THORN,
    SHIELD,
    TAUNT,
    MULTIPLE,
    POISON;
}

private enum MagicType {
    STAT_MODIFICATION,
    EQUIPEMENT,
    
}

Golem[] empty;
HashMap<Stat, Integer> emptyStats;
HashMap<Stat, Integer> shield2 = new HashMap();
shield2.put(Stat.SHIELD, new Integer(2));

MagicCard EquipementShield2 = new MagicCard(MagicType.STAT_MODIFICATION, 1, empty, empty, null, null, emptyStats, shield2);

public class MagicCard extends Card {
    
    private int level;
    private MagicType type;
    private Golem[] g1;
    private Golem[] g2;
    private Card c;
    private Golem g;
    private HashMap<Stat, Integer> stats;
    private HashMap<Stat, Integer> equipementStats;
    
    public MagicCard(MagicType type, int lvl, Golem[] g1, Golem[] g2, Card c, Golem g, HashMap<Stat, Integer> stats, HashMap<Stat, Integer> equipementStats) {
        this.type = type;
        this.level = lvl;
        this.g1 = g1;
        this.g2 = g2;
        this.c = c;
        this.g = g;
        this.stats = stats;
        this.equipementStats = equipementStats;
        switch(type) {
         	case STAT_MODIFICATION:
         		modifyStat(g, stats);
         	case EQUIPEMENT:
         		equip(g);
        }   
    }
    
    public MagicCard(MagicCard card) {
        this(card.type, card.level, card.g1, card.g2, card.c, card.g, card.stats, card.equipementStats);
    }
    
    public void modifyStat(Golem g, HashMap<Stat, Integer> stats) {
        for (Stat k : stats.keySet()) {
            g.upLevel(stats.getOrDefault(Stat.LEVEL, 0));
            g.upLife(stats.getOrDefault(Stat.LIFE, 0));
        	g.setLife(stats.getOrDefault(Stat.HEAL, g.getLife()));
        	g.upDamage(stats.getOrDefault(Stat.DAMAGE, 0));
            g.upThorn(stats.getOrDefault(Stat.THORN, 0));
            g.upMaxShield(stats.getOrDefault(Stat.SHIELD, 0));
            g.setTaunt(stats.getOrDefault(Stat.TAUNT, g.getTaunt()));
            g.upMultiple(stats.getOrDefault(Stat.MULTIPLE, 0));
            g.upPoison(stats.getOrDefault(Stat.POISON, 0));
        }
    }
    
    public void equip(Golem g) {
        g.addEquipement(this);
    }
    
    public HashMap<Stat, Integer> getEquipementStat() {
        return this.equipementStats;
    }
    
    //public abstract void effect(Object...o);
}*/
