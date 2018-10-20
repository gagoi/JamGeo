
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
/*
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


public abstract class MagicCard extends Card {
    public MagicCard(int lvl) {
     	super(lvl);   
    }
}

public interface IonGolem {
    public void effect(Golem g);
}

public class Heal extends MagicCard implements IonGolem {
    
    private int hp;
    
    public Heal(int lvl, int hp) {
         super(lvl);
         this.hp = hp;
    }
    
    public void effect(Golem g) {
        g.setLife(g.getLife() + this.hp);
    }
}

public class Shield extends MagicCard implements IonGolem {
    
    private int sh;
    
    public Shield(int lvl, int sh) {
         super(lvl);   
         this.sh = sh;
    }
    
    public void effect(Golem g) {
        g.upMaxShield(this.sh);
    }
}

public class Damage extends MagicCard implements IonGolem {
    
    private int dmg;
    
    public Damage(int lvl, int dmg) {
         super(lvl);
         this.dmg = dmg;
    }
    
    public void effect(Golem g) {
        g.receiveDamage(this.dmg);
    }
}

public class Poison extends MagicCard  implements IonGolem{
    
    private int poison;
    
    public Poison(int lvl, int poison) {
         super(lvl);
         this.poison = poison;
    }
    
    public void effect(Golem g) {
        g.setPoison(this.poison);
    }
}

public class Taunt extends MagicCard  implements IonGolem {
    
    private int tauntLvl;
    
    public Taunt(int lvl, int taunt) {
         super(lvl);
         this.tauntLvl = taunt;
    }
    
    public void effect(Golem g) {
        g.setTaunt(this.tauntLvl);
    }
}

public class DownLevel extends MagicCard  implements IonGolem{
    
    private int lvlDown;
    
    public DownLevel(int lvl, int lvlDown) {
         super(lvl);
         this.lvlDown = lvlDown;
    }
    
    public void effect(Card c) {
        c.upLevel(-this.lvlDown);
    }
    
    public void effect(Golem c) {
        c.upLevel(-this.lvlDown);
    }
}

public class Equipement extends MagicCard {
    
    private int number;
    private Stat stat;
    
    public Equipement(int lvl, Stat stat, int nb) {
         super(lvl);
         this.number = nb;
         this.stat = stat;
    }
    
    public Stat getStat() {
        return stat;
    }
    
    public int getNumber() {
        return number;
    }
    
    public void affect(Golem g) {
        g.addEquipement(this);
    }
}

public class Map extends MagicCard {
    
    private Equipement card;
    
    public Map(int lvl, Equipement c) {
         super(lvl);
         this.card = c;
    }
    
    public void effects(Golem[] golems) {
        for(Golem g : golems) {
            card.affect(g);
        }
    }
}

public static final int ESHIELD2 = 0;
public static final int ESHIELD5 = 1;
public static final int EMAXLIFE3 = 2;
public static final int EMAXLIFE5 = 3;
public static final int EMAXLIFE7 = 4;
public static final int EMAXLIFE10 = 5;
public static final int TAUNT1 = 2;
public static final int TAUNT2 = 3;
public static final int TAUNT3 = 4;
public static final int TAUNT = 5;

public MagicCard[] magicCardsList = {
	new Equipement(1, Stat.SHIELD, 2),
    new Equipement(4, Stat.SHIELD, 5),
    new Equipement(1, Stat.LIFE, 3),
    new Equipement(3, Stat.LIFE, 5),
    new Equipement(4, Stat.LIFE, 7),
    new Equipement(6, Stat.LIFE, 10),
    new Equipement(1, Stat.DAMAGE, 3),
    new Equipement(3, Stat.DAMAGE, 5),
    new Equipement(4, Stat.DAMAGE, 8),
    new Taunt(1, 1),
    new Taunt(2, 2),
    new Taunt(3, 3),
    new Taunt(4, -1)

};


//30 cartes a faire
