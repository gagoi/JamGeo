
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

public abstract class MagicCard extends Card {
    
    public MagicCard(String name, int lvl) {
     	super(name, lvl);
    }
    
    public MagicCard(MagicCard c) {
        this(c.name, c.level);
    }
}

public class Heal extends MagicCard {
    
    private int hp;
    
    public Heal(String name, int lvl, int hp) {
         super(name, lvl);
         this.hp = hp;
    }
    
    public Heal(Heal h) {
        this(h.name, h.level, h.hp);
    }
    
    public void effect(Golem g) {
        g.setLife(g.getLife() + this.hp);
    }
}

public class UpLife extends MagicCard {
    
    private int hp;
    
    public UpLife(String name, int lvl, int hp) {
         super(name, lvl);
         this.hp = hp;
    }
    
    public UpLife(UpLife h) {
        this(h.name, h.level, h.hp);
    }
    
    public void effect(Golem g) {
        g.upMaxLife(this.hp);
    }
}

public class Thorn extends MagicCard {
    
    private int th;
    
    public Thorn(String name, int lvl, int th) {
         super(name, lvl);
         this.th = th;
    }
    
    public Thorn(Thorn h) {
        this(h.name, h.level, h.th);
    }
    
    public void effect(Golem g) {
        g.upThorn(this.th);
    }
}

public class Multiply extends MagicCard {
    
    private int mul;
    
    public Multiply(String name, int lvl, int mul) {
         super(name, lvl);
         this.mul = mul;
    }
    
    public Multiply(Multiply h) {
        this(h.name, h.level, h.mul);
    }
    
    public void effect(Golem g) {
        g.upMultiple(this.mul);
    }
}

public class Shield extends MagicCard {
    
    private int sh;
    
    public Shield(String name, int lvl, int sh) {
         super(name, lvl);   
         this.sh = sh;
    }
    
    public Shield(Shield s) {
        this(s.name, s.level, s.sh);
    }
    
    public void effect(Golem g) {
        g.upMaxShield(this.sh);
    }
}

public class Damage extends MagicCard {
    
    private int dmg;
    
    public Damage(String name, int lvl, int dmg) {
         super(name, lvl);
         this.dmg = dmg;
    }
    
    public Damage(Damage s) {
        this(s.name, s.level, s.dmg);
    }
    
    public void effect(Golem g) {
        g.receiveDamage(this.dmg);
    }
}

public class Poison extends MagicCard {
    
    private int poison;
    
    public Poison(String name, int lvl, int poison) {
         super(name, lvl);
         this.poison = poison;
    }
    
    public Poison(Poison s) {
        this(s.name, s.level, s.poison);
    }
    
    public void effect(Golem g) {
        g.setPoison(this.poison);
    }
}

public class Taunt extends MagicCard {
    
    private int tauntLvl;
    
    public Taunt(String name, int lvl, int taunt) {
         super(name, lvl);
         this.tauntLvl = taunt;
    }
    
    public Taunt(Taunt s) {
        this(s.name, s.level, s.tauntLvl);
    }
    
    public void effect(Golem g) {
        g.setTaunt(this.tauntLvl);
    }
}

public class Dequip extends MagicCard {
    
    public Dequip(String name, int lvl) {
         super(name, lvl);
    }
    
    public Dequip(Dequip s) {
        this(s.name, s.level);
    }
    
    public void effect(Golem g) {
        g.removeEquipement();
    }
}

public class DownLevel extends MagicCard {
    
    private int lvlDown;
    
    public DownLevel(String name, int lvl, int lvlDown) {
         super(name, lvl);
         this.lvlDown = lvlDown;
    }
    
    public DownLevel(DownLevel s) {
        this(s.name, s.level, s.lvlDown);
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
    
    public Equipement(String name, int lvl, Stat stat, int nb) {
         super(name, lvl);
         this.number = nb;
         this.stat = stat;
    }
    
    public Equipement(Equipement s) {
        this(s.name, s.level, s.stat, s.number);
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

public class Field extends MagicCard {
    
    private Equipement card;
    private Type type;
    
    public Field(String name, int lvl, Equipement c, Type t) {
         super(name, lvl);
         this.card = c;
         this.type = t;
    }
    
    public Field(Field s) {
        this(s.name, s.level, s.card, s.type);
    }
    
    public void effects(Golem[] golems) {
        for(Golem g : golems) {
            if(g.getType() == this.type)
            	card.affect(g);
        }
    }
}

public static final int E_SHIELD_2 = 0;
public static final int E_SHIELD_3 = 1;
public static final int E_SHIELD_5 = 2;
public static final int E_MAXLIFE_3 = 3;
public static final int E_MAXLIFE_5 = 4;
public static final int E_MAXLIFE_10 = 5;
public static final int E_DAMAGE_3 = 6;
public static final int E_DAMAGE_5 = 7;
public static final int E_DAMAGE_8 = 8;
public static final int E_THORN_2 = 9;
public static final int E_THORN_4 = 10;
public static final int E_THORN_6 = 11;
public static final int E_TAUNT_I = 12;
public static final int E_MULTIPLE_2 = 13;
public static final int E_MULTIPLE_3 = 14;
public static final int E_MULTIPLE_4 = 15;
public static final int DOWN_LEVEL_1 = 16;
public static final int DOWN_LEVEL_3 = 17;
public static final int DOWN_LEVEL_5 = 18;
public static final int UP_LIFE_3 = 19;
public static final int UP_LIFE_6 = 20;
public static final int UP_LIFE_12 = 21;
public static final int HEAL_3 = 22;
public static final int HEAL_8 = 23;
public static final int HEAL_12 = 24;
public static final int DAMAGE_3 = 25;
public static final int DAMAGE_8 = 26;
public static final int DAMAGE_10 = 27;
public static final int THORN_1 = 28;
public static final int THORN_3 = 29;
public static final int THORN_5 = 30;
public static final int SHIELD_2 = 31;
public static final int SHIELD_3 = 32;
public static final int SHIELD_5 = 33;
public static final int TAUNT_1 = 34;
public static final int TAUNT_3 = 35;
public static final int TAUNT_I = 36;
public static final int MULTIPLY_2 = 37;
public static final int MULTIPLY_3 = 38;
public static final int POISON_2 = 39;
public static final int POISON_4 = 40;
public static final int POISON_6 = 41;
public static final int DEQUIP = 42;

public MagicCard[] magicCardsList = {
	new Equipement("Cristallisation 1", 1, Stat.SHIELD, 2),
    new Equipement("Cristallisation 2", 2, Stat.SHIELD, 3),
    new Equipement("Cristallisation 3", 4, Stat.SHIELD, 5),
    new Equipement("Biochimie 1", 1, Stat.LIFE, 3),
    new Equipement("Biochimie 2", 3, Stat.LIFE, 5),
    new Equipement("Biochimie 3", 6, Stat.LIFE, 10),
    new Equipement("Pioche", 1, Stat.DAMAGE, 3),
    new Equipement("Foreuse", 3, Stat.DAMAGE, 5),
    new Equipement("Dynamite", 4, Stat.DAMAGE, 8),
    new Equipement("", 1, Stat.THORN, 2),
    new Equipement("", 3, Stat.THORN, 4),
    new Equipement("", 5, Stat.THORN, 6),
    new Equipement("", 5, Stat.TAUNT, -1),
    new Equipement("", 2, Stat.MULTIPLE, 2),
    new Equipement("", 5, Stat.MULTIPLE, 3),
    new Equipement("", 9, Stat.MULTIPLE, 4),
    new DownLevel("", 2, 1),
    new DownLevel("", 5, 3),
    new DownLevel("", 7, 5),
    new UpLife("", 2, 3),
    new UpLife("", 5, 6),
    new UpLife("", 8, 12),
    new Heal("", 1, 3),
    new Heal("", 4, 8),
    new Heal("", 6, 12),
    new Damage("", 1, 3),
    new Damage("", 5, 8),
    new Damage("", 8, 10),
    new Thorn("", 1, 1),
    new Thorn("", 4, 3),
    new Thorn("", 7, 5),
    new Shield("", 2, 2),
    new Shield("", 4, 3),
    new Shield("", 7, 5),
    new Taunt("", 1, 1),
    new Taunt("", 3, 3),
    new Taunt("", 4, -1),
    new Multiply("", 5, 2),
    new Multiply("", 8, 3),
    new Poison("", 2, 2),
    new Poison("", 5, 4),
    new Poison("", 8, 6),
    new Dequip("", 7)
};


public static final int F_B_SEDIMENTAIRE = 0;
public static final int F_B_MAGMATIQUE = 1;
public static final int F_B_METAMORPHIQUE = 2;
public static final int F_M_SEDIMENTAIRE = 3;
public static final int F_M_MAGMATIQUE = 4;
public static final int F_M_METAMORPHIQUE = 5;

Equipement malusSed = new Equipement("", 0, Stat.THORN, -2);
Equipement malusMag = new Equipement("", 0, Stat.MULTIPLE, 1);
Equipement malusMet = new Equipement("", 0, Stat.SHIELD, -2);

public Field[] fieldsList = {
    new Field("", 4, (Equipement)magicCardsList[E_THORN_2], Type.SEDIMENTAIRE), //Bonus Sedimentaire
    new Field("", 5, (Equipement)magicCardsList[E_MULTIPLE_2], Type.MAGMATIQUE),  //Bonus Magmatique
    new Field("", 5, (Equipement)magicCardsList[E_SHIELD_2], Type.METAMORPHIQUE),//Bonus metamorphique
    new Field("", 4, malusSed, Type.SEDIMENTAIRE), //Malus Sedimentaire
    new Field("", 5, malusMag, Type.MAGMATIQUE),  //Malus Magmatique
    new Field("", 5, malusMet, Type.METAMORPHIQUE),//Malus metamorphique
};
//30 cartes a faire
