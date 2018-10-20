
public class Card {
    
    protected int level;
    
    public Card(int level) {
        this.level = level;
    }
    
    public int getLevel() {
        return this.level;
    }
    
    public void setLevel(int lvl) {
        this.level = lvl;
    }
    
    public void upLevel(int up) {
        this.level += up;
    }
}

private enum Type {
    SEDIMENTAIRE, 
    MAGMATIQUE, 
    METAMORPHIQUE;
}

public static final int GRES = 0;
public static final int GYSPE = 1;
public static final int BAUXITE = 2;
public static final int CELESTINE = 3;
public static final int GRANITE = 4;
public static final int DIORITE = 5;
public static final int BASALTE = 6;
public static final int GRANODIORITE = 7;
public static final int SHISPE = 8;
public static final int ZEOLITE = 9;
public static final int AMPHIBOLITE = 10;
public static final int GRANULITE = 11;

public Golem[] golemsList = {
    new Golem(Type.SEDIMENTAIRE, "Gres", 1, 3, 1), 
    new Golem(Type.SEDIMENTAIRE, "Gypse", 2, 7, 3), 
    new Golem(Type.SEDIMENTAIRE, "Bauxite", 3, 12, 6), 
    new Golem(Type.SEDIMENTAIRE, "Celestine", 4, 20, 8), 
    new Golem(Type.MAGMATIQUE, "Granite", 1, 1, 3), 
    new Golem(Type.MAGMATIQUE, "Diorite", 2, 2, 4), 
    new Golem(Type.MAGMATIQUE, "Basalte", 3, 5, 6), 
    new Golem(Type.MAGMATIQUE, "Granodiorite", 4, 7, 6), 
    new Golem(Type.METAMORPHIQUE, "Shiste", 1, 2, 2), 
    new Golem (Type.METAMORPHIQUE, "Zeolite", 2, 5, 5), 
    new Golem(Type.METAMORPHIQUE, "Amphibolite", 3, 9, 9), 
    new Golem  (Type.METAMORPHIQUE, "Granulite", 4, 13, 13)
};

public class Golem extends Card {

    private Type type;
    private String name;
    private int maxLife;
    private int life;
    private int damage;
    
    private int thorn;
    private int maxShield;
    private int shield;
    private int taunt;
    
    private int up_life;
    private int up_damage;
    private int multipleAttack = 1;
    private int poison;
    
    private ArrayList<Equipement> equipements = new ArrayList(); 


    private Golem(Type t, String name, int lvl, int hp, int dmg) {
        super(lvl);
        this.type = t;
        this.name = name;
        this.level = lvl;
        this.maxLife = hp;
        this.life = hp;
        this.damage = dmg;
    }

    public Golem(Golem c) {
        this(c.type, c.name, c.level, c.life, c.damage);
    }
    
    @Override
    public String toString() {
        return this.name + ": " + this.type + " l:" + this.level
        + " hp:" + this.life + " dmg:" + this.damage + " th:" + this.thorn + " maxsh:" + this.maxShield + " sh:" + this.shield
        + " upHp:" + this.up_life + " upDmg:" + this.up_damage + " taunt:" + this.taunt + " multiple:" + this.multipleAttack + " poison:" + this.poison;
    }
    
    public Type getType() {
        return this.type;
    }

    public int getMaxLife() {
        return this.maxLife;
    }
    
    public void setMaxLife(int max) {
        this.maxLife = max;
    }
    
    public void upMaxLife(int up) {
        this.maxLife += up;
    }

    public int getLife() {
        return this.life;
    }
    
    public void setLife(int life) {
        if(life > getMaxLife())
        	this.life = getMaxLife();
        else
        	this.life = life;
    }

    public void upLife(int up) {
        upMaxLife(up);
        this.life += up;
    }

	//damage n'a pas de setter, adder
    public int getDamage() {
        return this.damage;
    }

    public int getThorn() {
        return this.thorn;
    }

    public void upThorn(int up) {
        if(this.thorn + up < 0)
            this.thorn = 0;
        else
            this.thorn += up;
    }

    public int getMaxShield() {
        return this.maxShield;
    }
    
    public void setMaxShield(int max) {
        this.shield = max;
        this.maxShield = max;
    }

    public void upMaxShield(int up) {
        this.shield += up;
        this.maxShield += up;
    }

    public int getShield() {
        return this.shield;
    }

    public void upShield(int up) {
        if(this.shield + up < 0)
            this.shield = 0;
        else if(this.shield + up > this.maxShield)
            this.shield = this.maxShield;
        else
            this.shield += up;
    }
    
    public int getTaunt() {
        return this.taunt;
    }
    
    public void setTaunt(int t) {
        this.taunt = t;
    }

    public int getUpDamage() {
        return this.up_damage;
    }

    public void upDamage(int up) {
        this.up_damage += up;
    }
    
    public int getMultiple() {
        return this.multipleAttack;
    }
    
    public void setMultiple(int mul) {
        if(mul < 1)
            this.multipleAttack = 1;
        else
            this.multipleAttack = mul;
    }
    
    public void upMultiple(int up) {
        if(this.multipleAttack + up < 1)
            this.multipleAttack = 1;
        else
            this.multipleAttack += up;
    }
    
    public int getPoison() {
        return this.poison;
    }
    
    public void setPoison(int p) {
        this.poison = p;
    }
    
    public void upPoison(int up) {
        this.poison += up;
    }
    /*
    public void addEquipement(MagicCard c) {
        this.equipements.add(c);
        HashMap<Stat, Integer> equipement = c.getEquipementStat();
        for (Stat k : equipement.keySet()) {
            upLevel(equipement.getOrDefault(Stat.LEVEL, 0));
            upLife(equipement.getOrDefault(Stat.LIFE, 0));
            setLife(equipement.getOrDefault(Stat.HEAL, getLife()));
            upDamage(equipement.getOrDefault(Stat.DAMAGE, 0));
            upThorn(equipement.getOrDefault(Stat.THORN, 0));
            upMaxShield(equipement.getOrDefault(Stat.SHIELD, 0));
            setTaunt(equipement.getOrDefault(Stat.TAUNT, getTaunt()));
            upMultiple(equipement.getOrDefault(Stat.MULTIPLE, 0));
            upPoison(equipement.getOrDefault(Stat.POISON, 0));
        }
    }
    
    public void removeEquipements() {
        for(int i = 0; i < this.equipements.size(); i++) {
            HashMap<Stat, Integer> map = this.equipements.get(i).getEquipementStat();
                for (Stat k : map.keySet()) {
                    upLevel(-map.getOrDefault(Stat.LEVEL, 0));
                    upLife(-map.getOrDefault(Stat.LIFE, 0));
            		setLife(-map.getOrDefault(Stat.HEAL, getLife()));
                    upDamage(-map.getOrDefault(Stat.DAMAGE, 0));
                    upThorn(-map.getOrDefault(Stat.THORN, 0));
                    upMaxShield(-map.getOrDefault(Stat.SHIELD, 0));
                    setTaunt(-map.getOrDefault(Stat.TAUNT, getTaunt()));
                    upMultiple(-map.getOrDefault(Stat.MULTIPLE, 0));
                    upPoison(-map.getOrDefault(Stat.POISON, 0));
                }
            this.equipements.remove(i);
        }
    }
    */
    
    public void addEquipement(Equipement e) {
        equipements.add(e);
        switch(e.stat) {
            case LEVEL:
            	upLevel(e.getNumber());
            	break;
            case LIFE:
            	upLife(e.getNumber());
                break;
            case HEAL:
            	setLife(e.getNumber());
                break;
            case DAMAGE:
            	upDamage(e.getNumber());
                break;
            case THORN:
            	upThorn(e.getNumber());
                break;
            case SHIELD:
            	upMaxShield(e.getNumber());
                break;
            case TAUNT:
            	setTaunt(e.getNumber());
                break;
            case MULTIPLE:
            	upMultiple(e.getNumber());
                break;
            case POISON:
            	upPoison(e.getNumber());
                break;
        }
    }
    
    public void removeEquipement() {
     	equipements.clear();
    }
    
    public int getAttack() {
        return (getDamage() + getUpDamage()) * getMultiple();
    }
    
    public void receiveDamage(int dmg) {
        int attack = dmg;
        int diff = getShield() - attack;
        upShield(-attack);
        attack = abs(diff);
        setLife(getLife() - attack);
    }
}

/*	Baisse la vie en fonction de l'attaque du 1er (damage + upDamage), de la défense du 2eme (life + upLife + shield)
 * 	Gere la baisse de vie grace au thorn et le shield
 *	Renvoie -1 si l'attaquant meurt
 *			0 si personne ne meurt
 *          1 si le defenseur meurt
 *          2 si les deux meurent
 */
public int fight(Golem a, Golem d) {
    int res = 0;
    int attack;
    
    //Life et Shield
    attack = a.getAttack();
    d.receiveDamage(attack);
    
    //Thorn
    attack = d.getThorn() * a.getMultiple();
    a.receiveDamage(attack);
    
    if(d.getLife() <= 0)
        res = a.getLife() <= 0 ? 2 : 1;
    else if(a.getLife() <= 0)
    	res = -1;
    
    return res;
}
