ArrayList<Entity> entities;
int timestamp = 0;

void addEntity(Entity entity) {
  int i=0;
  while (i<entities.size() && entities.get(i).zIndex <= entity.zIndex) {
    i ++;
  }
  entities.add(i, entity);
}

void setup() {
  size(960, 540);
  
  entities = new ArrayList();
  addEntity(new Player(800, 450, 0, color(255, 0, 0), 50, 200));
  
  Entity map = new Entity(0, 0, 0);
  map.addComponent(new Component(map) {
    void update(float delta) {}
    
    void display() {
      stroke(255, 0, 255);
      
      for (int i=0; i<=16; i++) {
        line(i * 100, 0, i * 100, 900);
      }
      for (int i=0; i<=9; i++) {
        line(0, i * 100, 1600, i * 100);
      }
    }
  });
  map.zIndex = -1;
  addEntity(map);
}

void draw() {
  background(0);
  
  float delta = float(millis() - timestamp) / 1000;
  for (Entity entity : entities) {
    entity.update(delta);
  }
  timestamp = millis();
  
  for (Entity entity : entities) {
    entity.display();
  }
}

void mouseClicked(MouseEvent event) {
  for (Entity entity : entities) {
    entity.mouseClicked(event);
  }
}
void mouseDragged(MouseEvent event) {
  for (Entity entity : entities) {
    entity.mouseDragged(event);
  }
}
void mouseMoved(MouseEvent event) {
  for (Entity entity : entities) {
    entity.mouseMoved(event);
  }
}
void mousePressed(MouseEvent event) {
  for (Entity entity : entities) {
    entity.mousePressed(event);
  }
}
void mouseReleased(MouseEvent event) {
  for (Entity entity : entities) {
    entity.mouseReleased(event);
  }
}
void mouseWheel(MouseEvent event) {
  for (Entity entity : entities) {
    entity.mouseWheel(event);
  }
}

void keyPressed(KeyEvent event) {
  for (Entity entity : entities) {
    entity.keyPressed(event);
  }
}
void keyReleased(KeyEvent event) {
  for (Entity entity : entities) {
    entity.keyReleased(event);
  }
}
void keyTyped(KeyEvent event) {
  for (Entity entity : entities) {
    entity.keyTyped(event);
  }
}
