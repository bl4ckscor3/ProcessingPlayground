public class Segment
{
    boolean on = false;
    int x, y, width, height;
    
    public Segment(int x, int y, int width, int height)
    {
        this. x = x;
        this. y = y;
        this. width = width;
        this. height = height;
    }
    
    void draw()
    {
        noStroke();
        
        if(on)
            fill(color(255, 8, 0));
        else
            fill(color(124, 10, 2));
            
        rect(x, y, width, height);
    }
    
    void toggle()
    {
        set(!on);
    }
    
    void set(boolean state)
    {
        on = state;
    }
    
    boolean clickedOn(int mouseX, int mouseY)
    {
        return mouseX > x && mouseX < x + width && mouseY > y && mouseY < y + height;
    }
}
