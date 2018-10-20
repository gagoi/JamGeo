void init() {
    
  Golem GolemList[] = {new Golem(Gres), new Golem(Gres)};
  
  GolemList[0].upDamage(1);
  GolemList[0].setMultiple(2);
  GolemList[0].upMaxShield(2);
  GolemList[1].upMaxShield(2);
  GolemList[1].upThorn(2);
  
  println(GolemList[0]);
  println(GolemList[1] + "\n");
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
  
  println(GolemList[0]);
  println(GolemList[1]);
}

void affichage(){
  ellipse(10, 10, 10, 10);
}
