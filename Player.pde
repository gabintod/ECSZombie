class Player extends Entity {
  Player(float x, float y, float a, color c, float d, float s) {
    super(x, y, a);
    addComponent(new PlayerComponent(this, c, d, s));
  }
}

class PlayerComponent extends Component {
  boolean left, up, down, right;
  
  color colour;
  float diameter;
  float speed;
  
  PlayerComponent(Entity entity, color c, float d, float s) {
    super(entity);
    colour = c;
    diameter = d;
    speed = s;
    
    left = up = down = right = false;
  }
  
  void update(float delta) {
    PVector direction = new PVector(0, 0);
    direction.x = (right ? 1 : 0) - (left ? 1 : 0);
    direction.y = (down ? 1 : 0) - (up ? 1 : 0);
    direction.normalize();
    
    PVector speedVector = new PVector(direction.x, direction.y);
    speedVector.mult(speed);
    speedVector.mult(delta);
    
    entity.position.add(speedVector);
    
    translate(width/2 - entity.position.x, height/2 - entity.position.y);
  }
  
  void display() {
    noStroke();
    fill(colour);
    pushMatrix();
    
    translate(entity.position.x, entity.position.y);
    rotate(entity.rotation);
    
    circle(0, 0, diameter);
    circle(diameter/2, 0, diameter/2);
    
    popMatrix();
    
  }
  
  void keyPressed(KeyEvent event) {
    if (event.getKeyCode() == 90) {
      up = true;
    }
    if (event.getKeyCode() == 81) {
      left = true;
    }
    if (event.getKeyCode() == 83) {
      down = true;
    }
    if (event.getKeyCode() == 68) {
      right = true;
    }
  }
  
  void keyReleased(KeyEvent event) {
    if (event.getKeyCode() == 90) {
      up = false;
    }
    if (event.getKeyCode() == 81) {
      left = false;
    }
    if (event.getKeyCode() == 83) {
      down = false;
    }
    if (event.getKeyCode() == 68) {
      right = false;
    }
  }
}
