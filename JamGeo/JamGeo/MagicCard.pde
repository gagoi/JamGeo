public enum Stat {
    LEVEL("niveau"),
    HEAL("soin"),
    LIFE("vie"),
    DAMAGE("dégâts"),
    THORN("degats d'épines"),
    SHIELD("boucliers"),
    TAUNT("provocation"),
    MULTIPLE("attaques multiples"),
    POISON("poison");
    
    private final String name;
    
    private Stat(String s) {
        this.name = s;
    }
    
    @Override
    public String toString() {
        return this.name;
    }
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
    
    @Override
    public String toString() {
        return "Rend " + this.hp + " à un golem";
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
    
    @Override
    public String toString() {
        return "Augmente de " + this.hp + " la vie d'un golem";
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
    
    @Override
    public String toString() {
        return "Donne l'effet Thorn (+" + this.th + "dmg/attaque) à un golem";
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
    
    @Override
    public String toString() {
        return "Donne attaque x" + this.mul + " à un golem";
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
    
    @Override
    public String toString() {
        return "Donne un bouclier (+" + this.sh + ") à un golem";
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
    
    @Override
    public String toString() {
        return "Inflige " + this.dmg + " dégâts à un golem";
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
    
    @Override
    public String toString() {
        return "Empoisonne un golem " + (this.poison > 0 ? ("(" + this.poison + " tour)") : "");
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
    
    @Override
    public String toString() {
        return "Donne la capacite 'provocation' à un golem " + (this.tauntLvl > 0 ? ("(" + this.tauntLvl + " tour)") : "");
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
    
    @Override
    public String toString() {
        return "Déséquipe un golem de tous ses équipements";
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
    
    @Override
    public String toString() {
        return "Baisse de " + this.lvlDown + " niveau" + (this.lvlDown > 1 ? "x" : "") + " le niveau d'une carte";
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
    
    @Override
    public String toString() {
        return "Augmentation " + this.stat + " de " + this.number;
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
    
    @Override
    public String toString() {
        return "" + this.card + " pour tout les types \"" + this.type + "\"";
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
	new Equipement("Solution de Cristallisation 1", 1, Stat.SHIELD, 2),
    new Equipement("Solution de Cristallisation 2", 2, Stat.SHIELD, 3),
    new Equipement("Solution de Cristallisation 3", 4, Stat.SHIELD, 5),
    new Equipement("Biochimie 1", 1, Stat.LIFE, 3),
    new Equipement("Biochimie 2", 3, Stat.LIFE, 5),
    new Equipement("Biochimie 3", 6, Stat.LIFE, 10),
    new Equipement("Marteau", 1, Stat.DAMAGE, 3),
    new Equipement("Pioche", 3, Stat.DAMAGE, 5),
    new Equipement("Foreuse", 4, Stat.DAMAGE, 8),
    new Equipement("Lithophine 1", 1, Stat.THORN, 2),
    new Equipement("Lithophine 2", 3, Stat.THORN, 4),
    new Equipement("Lithophine 3", 5, Stat.THORN, 6),
    new Equipement("Chambre Magmatique", 5, Stat.TAUNT, -1),
    new Equipement("Eruption 1", 2, Stat.MULTIPLE, 2),
    new Equipement("Eruption 2", 5, Stat.MULTIPLE, 3),
    new Equipement("Eruption 3", 9, Stat.MULTIPLE, 4),
    new DownLevel("Raffinage 1", 2, 1),
    new DownLevel("Raffinage 2", 5, 3),
    new DownLevel("Raffinage 3", 7, 5),
    new UpLife("Durcissement 1", 2, 3),
    new UpLife("Durcissement 2", 5, 6),
    new UpLife("Durcissement 3", 8, 12),
    new Heal("Refroidissement 1", 1, 3),
    new Heal("Refroidissement 2", 4, 8),
    new Heal("Refroidissement 3", 6, 12),
    new Damage("Dynamite 1", 1, 3),
    new Damage("Dynamite 2", 5, 8),
    new Damage("Dynamite 3", 8, 10),
    new Thorn("Assemblage mineralogique 1", 1, 1),
    new Thorn("Assemblage mineralogique 2", 4, 3),
    new Thorn("Assemblage mineralogique 3", 7, 5),
    new Shield("Cristallisation 1", 2, 2),
    new Shield("Cristallisation 2", 4, 3),
    new Shield("Cristallisation 3", 7, 5),
    new Taunt("Sedimentation 1", 1, 1),
    new Taunt("Sedimentation 2", 3, 3),
    new Taunt("Sedimentation 3", 4, -1),
    new Multiply("Coulee de lave 1", 5, 2),
    new Multiply("Coulee de lave 2", 8, 3),
    new Poison("Erosion 1", 2, 2),
    new Poison("Erosion 2", 5, 4),
    new Poison("Erosion 3", 8, 6),
    new Dequip("Epurement", 7)
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
