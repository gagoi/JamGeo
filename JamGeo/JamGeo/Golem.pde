
private enum Type {
    SEDIMENTAIRE, 
    MAGMATIQUE, 
    METAMORPHIQUE;
}

public Golem
    Gres = new Golem(Type.SEDIMENTAIRE, "Gres", 1, 3, 1), 
    Gypse = new Golem(Type.SEDIMENTAIRE, "Gypse", 2, 7, 3), 
    Bauxite = new Golem(Type.SEDIMENTAIRE, "Bauxite", 3, 12, 6), 
    Celestine = new Golem(Type.SEDIMENTAIRE, "Celestine", 4, 20, 8), 
    Granite    = new Golem(Type.MAGMATIQUE, "Granite", 1, 1, 3), 
    Diorite = new Golem(Type.MAGMATIQUE, "Diorite", 2, 2, 4), 
    Basalte = new Golem(Type.MAGMATIQUE, "Basalte", 3, 5, 6), 
    Granodiorite = new Golem(Type.MAGMATIQUE, "Granodiorite", 4, 7, 6), 
    Shiste = new Golem(Type.METAMORPHIQUE, "Shiste", 1, 2, 2), 
    Zeolite = new Golem (Type.METAMORPHIQUE, "Zeolite", 2, 5, 5), 
    Amphibolite = new Golem(Type.METAMORPHIQUE, "Amphibolite", 3, 9, 9), 
    Granulite  = new Golem  (Type.METAMORPHIQUE, "Granulite", 4, 13, 13);
    
public class Golem {

    private Type type;
    private String name;
    private int level;
    private int maxLife;
    private int life;
    private int damage;
    
    private int thorn;
    private int maxShield;
    private int shield;
    private boolean taunt;
    
    private int up_life;
    private int up_damage;
    private int multipleAttack = 1;
    private int poison;


    private Golem(Type t, String name, int lvl, int hp, int dmg) {
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

    public int getLevel() {
        return this.level;
    }
    
    public void setLevel(int lvl) {
        this.level = lvl;
    }
    
    public void upLevel(int up) {
        this.level += up;
    }

    public int getMaxLife() {
        return this.maxLife;
    }
    
    public void setMaxLife(int max) {
        this.maxLife = max;
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
    
    public boolean getTaunt() {
        return this.taunt;
    }
    
    public void setTaunt(boolean t) {
        this.taunt = t;
    }

    public int getUpLife() {
        return this.up_life;
    }

    public void upLife(int up) {
        this.up_life += up;
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
