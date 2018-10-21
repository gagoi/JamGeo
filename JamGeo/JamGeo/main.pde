void init() {
    
  Golem GolemList[] = {new Golem(golemsList[0]), new Golem(golemsList[1])};
  //MagicCard MCList[] = {new MagicCard(magicCardsList[HEAL10]), magicCardsList[EMAXLIFE3]};
  //MagicCard MCHeal = (MagicCard)new Heal((Heal)magicCardsList[HEAL10]);
  //MagicCard MCField = (MagicCard)new Field((Field)magicCardsList[0]);
  MagicCard MCField = (MagicCard)new Field(fieldsList[F_B_SEDIMENTAIRE]);
  
  GolemList[0].upDamage(1);
  GolemList[0].setMultiple(2);
  GolemList[0].upMaxShield(2);
  GolemList[1].upMaxShield(2);
  GolemList[1].upThorn(2);
  
  //println(GolemList[0]);
  //println(GolemList[1] + "\n");
  switch(fight(GolemList[0], GolemList[1])) {
      case -1:
      	GolemList[0] = null;
      	break;
      case 0:
          break;
      case 1:
          GolemList[1] = null;
          break;
      case 2:
          GolemList[0] = null;
          GolemList[1] = null;
          break;
  }
  
  //println(GolemList[0]);
  //println(GolemList[1] + "\n");
  
  //((Equipement)MCList[0]).affect(GolemList[0]);
  //((Equipement)MCList[1]).affect(GolemList[1]);
  ((Field)MCField).effects(GolemList);
  
  //println(GolemList[0]);
  //println(GolemList[1]);
  
  
}

void affichage(){
  ellipse(10, 10, 10, 10);
}

void shuffleArray(int[] array) {
  for (int i = array.length; i > 1; i--) {
    int j = (int)random(i);
 
    int tmp = array[j];
    array[j] = array[i-1];
    array[i-1] = tmp;
  }
}
