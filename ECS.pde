abstract class Processable {
  abstract void update(float delta);
  abstract void display();
  
  void mouseClicked(MouseEvent event) {}
  void mouseDragged(MouseEvent event) {}
  void mouseMoved(MouseEvent event) {}
  void mousePressed(MouseEvent event) {}
  void mouseReleased(MouseEvent event) {}
  void mouseWheel(MouseEvent event) {}
  
  void keyPressed(KeyEvent event) {}
  void keyReleased(KeyEvent event) {}
  void keyTyped(KeyEvent event) {}
}

abstract class Component extends Processable {
  Entity entity;
  
  Component(Entity entity) {
    this.entity = entity;
  }
}

class Entity extends Processable {
  PVector position;
  float rotation;
  int zIndex = 0;
  HashMap<Class<? extends Component>, Component> components;
  
  Entity(float x, float y, float a) {
    position = new PVector(x, y);
    rotation = a;
    components = new HashMap();
  }
  
  void addComponent(Component component) {
    components.put(component.getClass(), component);
  }
  
  void update(float delta) {
    for (Component component : components.values()) {
      component.update(delta);
    }
  }
  void display() {
    for (Component component : components.values()) {
      component.display();
    }
  }
  
  void mouseClicked(MouseEvent event) {
    for (Component component : components.values()) {
      component.mouseClicked(event);
    }
  }
  void mouseDragged(MouseEvent event) {
    for (Component component : components.values()) {
      component.mouseDragged(event);
    }
  }
  void mouseMoved(MouseEvent event) {
    for (Component component : components.values()) {
      component.mouseMoved(event);
    }
  }
  void mousePressed(MouseEvent event) {
    for (Component component : components.values()) {
      component.mousePressed(event);
    }
  }
  void mouseReleased(MouseEvent event) {
    for (Component component : components.values()) {
      component.mouseReleased(event);
    }
  }
  void mouseWheel(MouseEvent event) {
    for (Component component : components.values()) {
      component.mouseWheel(event);
    }
  }
  
  void keyPressed(KeyEvent event) {
    for (Component component : components.values()) {
      component.keyPressed(event);
    }
  }
  void keyReleased(KeyEvent event) {
    for (Component component : components.values()) {
      component.keyReleased(event);
    }
  }
  void keyTyped(KeyEvent event) {
    for (Component component : components.values()) {
      component.keyTyped(event);
    }
  }
}
