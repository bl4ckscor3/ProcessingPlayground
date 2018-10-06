Planet sun = new Planet(30.0F, 0.0F, 0.0F, 255, 255, 0);
Planet mercury = new Planet(3.0F, 3.0F, 2.0F, 100, 100, 100);
Planet venus = new Planet(7.0F, mercury.distance + mercury.radius + 7.0F * 2, 4.0F, 255, 211, 155);
Planet earth = new Planet(7.0F, venus.distance + venus.radius + 7.0F * 4, 6.0F, 0, 100, 100);
Planet moon = new Planet(2.0F, 2.0F, 25.0F, 100, 100, 100);
Planet mars = new Planet(5.0F, earth.distance + earth.radius + moon.radius + 5.0F * 5, 8.0F, 255, 0, 0);
Planet jupiter = new Planet(19.0F, mars.distance + mars.radius + 19.0F * 2, 10.0F, 139, 69, 19);
Planet saturn = new Planet(15.0F, jupiter.distance + jupiter.radius + 15.0F * 2, 12.0F, 205, 133, 63);
Planet uranus = new Planet(12.0F, saturn.distance + saturn.radius + 12.0F * 2, 14.0F, 135, 206, 255);
Planet neptune = new Planet(12.0F, uranus.distance + uranus.radius + 12.0F * 2, 16.0F, 0, 0, 255);

void setup()
{
    size(1000, 1000);
    sun.addChild(mercury);
    sun.addChild(venus);
    sun.addChild(earth);
    sun.addChild(mars);
    sun.addChild(jupiter);
    sun.addChild(saturn);
    sun.addChild(uranus);
    sun.addChild(neptune);
    earth.addChild(moon);
}

void draw()
{
    background(0);
    noStroke();
    translate(width / 2, height / 2);
    sun.move();
    sun.draw(null);
}
