final int space = 10;
final int startX = 100;
final int startY = 100;
Switch[] switches = new Switch[12];

void setup()
{
    size(900, 400);
    textSize(60);
    
    int k = switches.length - 1;
    
    for(int i = 0; i < switches.length; i++)
    {
        switches[i] = new Switch(pow(2, k--), startX + i * Switch.xSize + i * space, startY);
    }
}

void mousePressed()
{
    for(Switch s : switches)
    {
        if(s.clickedOn())
            s.toggle();
    }
}

void draw()
{
    background(51);
    
    int value = 0;
    
    for(Switch s : switches)
    {
        value += s.enabled ? s.value : 0;
        s.draw();
    }
    
    text(("" + value), 100, height - height / 3);
}
