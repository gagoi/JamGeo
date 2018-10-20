
private enum Type {
    SEDIMENTAIRE, 
    MAGMATIQUE, 
    METAMORPHIQUE;
}

public Monster
    Gres = new Monster(Type.SEDIMENTAIRE, "Gres", 1, 3, 1, 0, 0), 
    Gypse = new Monster(Type.SEDIMENTAIRE, "Gypse", 2, 7, 3, 0, 0), 
    Bauxite = new Monster(Type.SEDIMENTAIRE, "Bauxite", 3, 12, 6, 0, 0), 
    Celestine = new Monster(Type.SEDIMENTAIRE, "Celestine", 4, 20, 8, 0, 0), 
    Granite    = new Monster(Type.MAGMATIQUE, "Granite", 1, 1, 3, 0, 0), 
    Diorite = new Monster(Type.MAGMATIQUE, "Diorite", 2, 2, 4, 0, 0), 
    Basalte = new Monster(Type.MAGMATIQUE, "Basalte", 3, 5, 6, 0, 0), 
    Granodiorite = new Monster(Type.MAGMATIQUE, "Granodiorite", 4, 7, 6, 0, 0), 
    Shiste = new Monster(Type.METAMORPHIQUE, "Shiste", 1, 2, 2, 0, 0), 
    Zeolite = new Monster (Type.METAMORPHIQUE, "Zeolite", 2, 5, 5, 0, 0), 
    Amphibolite = new Monster(Type.METAMORPHIQUE, "Amphibolite", 3, 9, 9, 0, 0), 
    Granulite  = new Monster  (Type.METAMORPHIQUE, "Granulite", 4, 13, 13, 0, 0);
    
public class Monster {

    private Type type;
    private String name;
    private int level;
    private int life;
    private int damage;
    
    private int thorn;
    private int maxShield;
    private int shield;
    
    private int up_life;
    private int up_damage;
    private int multiple;
    private int poison;


    private Monster(Type t, String name, int lvl, int hp, int dmg, int th, int sh) {
        this.type = t;
        this.name = name;
        this.level = lvl;
        this.life = hp;
        this.damage = dmg;
        this.thorn = th;
        this.maxShield = sh;
        this.shield = sh;
    }

    public Monster(Monster c) {
        this(c.type, c.name, c.level, c.life, c.damage, c.thorn, c.shield);
    }
    
    @Override
    public String toString() {
        return this.name + ": " + this.type + " l:" + this.level
        + " hp:" + this.life + " dmg:" + this.damage + " th:" + this.thorn + " maxsh:" + this.maxShield + " sh:" + this.shield
        + " upHp:" + this.up_life + " upDmg:" + this.up_damage;
    }
    
    public Type getType() {
        return this.type;
    }

    public int getLevel() {
        return this.level;
    }

    public int getLife() {
        return this.life;
    }
    
    public void setLife(int life) {
        this.life = life;
    }

    public int getDamage() {
        return this.damage;
    }

    public int getThorn() {
        return this.thorn;
    }

    public int getMaxShield() {
        return this.maxShield;
    }

    public int getShield() {
        return this.shield;
    }

    public int getUpLife() {
        return this.up_life;
    }

    public int getUpDamage() {
        return this.up_damage;
    }

    public void upLife(int up) {
        this.up_life += up;
    }

    public void upDamage(int up) {
        this.up_damage += up;
    }

    public void upThorn(int up) {
        if(this.thorn + up < 0)
        	this.thorn = 0;
        else
        	this.thorn += up;
    }

    public void upMaxShield(int up) {
        this.shield += up;
        this.maxShield += up;
    }

    public void upShield(int up) {
        if(this.shield + up < 0)
        	this.shield = 0;
        else if(this.shield + up > this.maxShield)
        	this.shield = this.maxShield;
        else
        	this.shield += up;
    }
    
    public int getAttack() {
        return getDamage() + getUpDamage();
    }
}

/*	Baisse la vie en fonction de l'attaque du 1er (damage + upDamage), de la défense du 2eme (life + upLife + shield)
 * 	Gere la baisse de vie grace au thorn et le shield
 *	Renvoie -1 si l'attaquant meurt
 *			0 si personne ne meurt
 *          1 si le defenseur meurt
 *          2 si les deux meurent
 */
public int fight(Monster a, Monster d) {
    int res = 0;
    int attack = a.getAttack();
    
    //Shield
    int diff = d.getShield() - attack;
    d.upShield(-attack);
    attack = abs(diff);
    
    //Life
    d.setLife(d.getLife() - attack);
    
    //Thorn
    attack = d.getThorn();
    diff = a.getShield() - attack;
    a.upShield(-attack);
    attack = abs(diff);
    a.setLife(a.getLife() - attack);
    
    if(d.getLife() <= 0)
        res = a.getLife() <= 0 ? 2 : 1;
    else if(a.getLife() <= 0)
    	res = -1;
    
    return res;
}
