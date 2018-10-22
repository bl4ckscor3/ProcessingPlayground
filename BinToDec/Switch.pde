class Switch
{
    static final int xSize = 50;
    static final int ySize = 80;
    boolean enabled = false;
    float value;
    int x;
    int y;

    Switch(float value, int x, int y)
    {
        this.value = value;
        this.x = x;
        this.y = y;
    }
    
    void draw()
    {
        noStroke();
        fill(color(255, 100, 10));
        rect(x, y, xSize, ySize);
        fill(255);
        text(enabled ? "1" : "0", x + xSize / 7, y + ySize / 2 + ySize / 4);
    }
    
    void toggle()
    {
        enabled = !enabled;
    }
    
    boolean clickedOn()
    {
        return mouseX > x && mouseX < x + xSize && mouseY > y && mouseY < y + ySize;
    }
}
