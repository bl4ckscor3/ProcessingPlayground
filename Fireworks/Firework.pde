class Firework
{
    int x, y;
    int explodeHeight;
    color effectColor;
    int effectAmount;
    boolean hasExploded = false;
    int ticksToLive;
    int ticksLeftToLive;
    boolean dead = false;
    
    public Firework(int x, int explodeHeight, color effectColor, int effectAmount, int ticksToLive)
    {
        this.x = x;
        this.y = height;
        this.explodeHeight = explodeHeight;
        this.effectColor = effectColor;
        this.effectAmount = effectAmount;
        this.ticksToLive = ticksLeftToLive = ticksToLive;
    }
    
    void update()
    {
        if(hasExploded)
            ticksLeftToLive--;
        else if(y <= explodeHeight)
            hasExploded = true;
        else
            y -= 5;
            
        if(ticksLeftToLive == 0)
            dead = true;
    }
    
    void draw()
    {
        if(!hasExploded)
        {
            noFill();
            stroke(255);
            point(x, y);
        }
        else
        {
            for(int i = 1; i <= effectAmount; i++)
            {
                pushMatrix();
                stroke(color(effectColor), map(ticksLeftToLive, 0, ticksToLive, 0, 255));
                translate(x, y);
                rotate(360 / i);
                translate(ticksToLive - ticksLeftToLive, 0);
                point(0, 0);
                popMatrix();
            }
        }
    }
}
