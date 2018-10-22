public class Segment
{
    boolean on = false;
    int x, y, segmentWidth, segmentHeight;
    
    public Segment(int x, int y, int segmentWidth, int segmentHeight)
    {
        this. x = x;
        this. y = y;
        this. segmentWidth = segmentWidth;
        this. segmentHeight = segmentHeight;
    }
    
    void draw()
    {
        noStroke();
        
        if(on)
            fill(color(255, 8, 0));
        else
            fill(color(124, 10, 2));
            
        rect(x, y, segmentWidth, segmentHeight);
    }
    
    void toggle()
    {
        set(!on);
    }
    
    void set(boolean state)
    {
        on = state;
    }
    
    boolean clickedOn()
    {
        return mouseX > x && mouseX < x + segmentWidth && mouseY > y && mouseY < y + segmentHeight;
    }
}
