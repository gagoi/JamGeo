
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
    public MagicCard(int lvl) {
     	super(lvl);
    }
    
    public MagicCard(MagicCard c) {
        this(c.level);
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
    
    public Heal(Heal h) {
        this(h.level, h.hp);
    }
    
    public void effect(Golem g) {
        g.setLife(g.getLife() + this.hp);
    }
}

public class Thorn extends MagicCard implements IonGolem {
    
    private int th;
    
    public Thorn(int lvl, int th) {
         super(lvl);
         this.th = th;
    }
    
    public Thorn(Thorn h) {
        this(h.level, h.th);
    }
    
    public void effect(Golem g) {
        g.upThorn(this.th);
    }
}

public class Multiply extends MagicCard implements IonGolem {
    
    private int mul;
    
    public Multiply(int lvl, int mul) {
         super(lvl);
         this.mul = mul;
    }
    
    public Multiply(Multiply h) {
        this(h.level, h.mul);
    }
    
    public void effect(Golem g) {
        g.upMultiple(this.mul);
    }
}

public class Shield extends MagicCard implements IonGolem {
    
    private int sh;
    
    public Shield(int lvl, int sh) {
         super(lvl);   
         this.sh = sh;
    }
    
    public Shield(Shield s) {
        this(s.level, s.sh);
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
    
    public Damage(Damage s) {
        this(s.level, s.dmg);
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
    
    public Poison(Poison s) {
        this(s.level, s.poison);
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
    
    public Taunt(Taunt s) {
        this(s.level, s.tauntLvl);
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
    
    public DownLevel(DownLevel s) {
        this(s.level, s.lvlDown);
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
    
    public Equipement(Equipement s) {
        this(s.level, s.stat, s.number);
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
    
    public Field(int lvl, Equipement c, Type t) {
         super(lvl);
         this.card = c;
         this.type = t;
    }
    
    public Field(Field s) {
        this(s.level, s.card, s.type);
    }
    
    public void effects(Golem[] golems) {
        for(Golem g : golems) {
            if(g.getType() == this.type)
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
public static final int HEAL10 = 6;
public static final int TAUNT1 = 2;
public static final int TAUNT2 = 3;
public static final int TAUNT3 = 4;
public static final int TAUNT = 5;

public MagicCard[] magicCardsList = {
	new Equipement(1, Stat.SHIELD, 2),
    new Equipement(2, Stat.SHIELD, 3),
    new Equipement(4, Stat.SHIELD, 5),
    new Equipement(1, Stat.LIFE, 3),
    new Equipement(3, Stat.LIFE, 5),
    new Equipement(6, Stat.LIFE, 10),
    new Equipement(1, Stat.DAMAGE, 3),
    new Equipement(3, Stat.DAMAGE, 5),
    new Equipement(4, Stat.DAMAGE, 8),
    new Equipement(1, Stat.THORN, 2),
    new Equipement(3, Stat.THORN, 4),
    new Equipement(5, Stat.THORN, 6),
    new Equipement(2, Stat.TAUNT, 3),
    new Equipement(3, Stat.TAUNT, 4),
    new Equipement(5, Stat.TAUNT, 6),
    new Heal(4, 10),
    new Taunt(1, 1),
    new Taunt(2, 2),
    new Taunt(3, 3),
    new Taunt(4, -1)

};

public Field[] fieldsList = {
    new Field(4, (Equipement)magicCardsList[EMAXLIFE5], Type.SEDIMENTAIRE),
    new Field(4, (Equipement)magicCardsList[EMAXLIFE5], Type.SEDIMENTAIRE),
    new Field(4, (Equipement)magicCardsList[EMAXLIFE5], Type.SEDIMENTAIRE),
}
//30 cartes a faire
