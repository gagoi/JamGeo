void init() {
  Monster MonsterList[] = {new Monster(Gres), new Monster(Gres)};
  
  MonsterList[0].upDamage(3);
  MonsterList[0].upMaxShield(2);
  MonsterList[1].upMaxShield(2);
  MonsterList[1].upThorn(3);
  
  println(MonsterList[0]);
  println(MonsterList[1] + "\n");
  switch(fight(MonsterList[0], MonsterList[1])) {
      case -1:
      	MonsterList[0] = null;
      	break;
      case 0:
          break;
      case 1:
          MonsterList[1] = null;
          break;
      case 2:
          MonsterList[0] = null;
          MonsterList[1] = null;
          break;
  }
  
  println(MonsterList[0]);
  println(MonsterList[1]);
}

void affichage(){
  ellipse(10, 10, 10, 10);
}
