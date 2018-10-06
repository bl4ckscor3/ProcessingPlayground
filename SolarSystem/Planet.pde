class Planet
{
    ArrayList<Planet> children = new ArrayList<Planet>();
    float radius;
    float distance;
    float angle;
    float moveSpeed;
    int r, g, b;
    
    Planet(float rad, float d, float s, int colorR, int colorG, int colorB)
    {
        radius = rad;
        distance = d;
        angle = 0;
        moveSpeed = s;
        r = colorR;
        g = colorG;
        b = colorB;
    }
    
    void addChild(Planet p)
    {
        children.add(p);
    }
    
    void move()
    {
        angle = (angle + moveSpeed * 0.1F) % 360;
        
        for(Planet p : children)
        {
            p.move();
        }
    }
    
    void draw(Planet parent)
    {
        pushMatrix();
        fill(color(r, g, b));
        
        if(parent != null)
        {
            rotate(radians(angle));
            translate(parent.radius * 2, 0);
            translate(distance, 0.0F);
        }
        
        ellipse(0.0F, 0.0F, radius * 2.0F, radius * 2.0F);
            
        for(Planet p : children)
        {
            p.draw(this);
        }
        
        popMatrix();
    }
}
