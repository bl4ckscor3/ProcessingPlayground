import java.awt.event.KeyEvent;

Segment[] segments = new Segment[7];
int segmentWidth = 50;
int segmentLength = 200;

void setup()
{
    size(300, 550);
    
    segments[0] = new Segment(segmentWidth, 0, segmentLength, segmentWidth); //top
    segments[1] = new Segment(0, segmentWidth, segmentWidth, segmentLength); //top left
    segments[2] = new Segment(segmentWidth + segmentLength, segmentWidth, segmentWidth, segmentLength); //top right
    segments[3] = new Segment(segmentWidth, segmentWidth + segmentLength, segmentLength, segmentWidth); //middle
    segments[4] = new Segment(0, segmentWidth * 2 + segmentLength, segmentWidth, segmentLength); //bottom left
    segments[5] = new Segment(segmentWidth + segmentLength, segmentWidth * 2 + segmentLength, segmentWidth, segmentLength); //bottom right
    segments[6] = new Segment(segmentWidth, segmentWidth * 2 + segmentLength * 2, segmentLength, segmentWidth); //bottom
}

void draw()
{
    background(51);
    
    for(Segment s : segments)
    {
        s.draw();
    }
}

void mousePressed()
{
    for(Segment s : segments)
    {
        if(s.clickedOn(mouseX, mouseY))
        {
            s.toggle();
            break;
        }
    }
}

void keyPressed()
{
    switch(keyCode)
    {
        case KeyEvent.VK_NUMPAD0:
            setSegments(true, true, true, false, true, true, true);
            break;
        case KeyEvent.VK_NUMPAD1:
            setSegments(false, false, true, false, false, true, false);
            break;
        case KeyEvent.VK_NUMPAD2:
            setSegments(true, false, true, true, true, false, true);
            break;
        case KeyEvent.VK_NUMPAD3:
            setSegments(true, false, true, true, false, true, true);
            break;
        case KeyEvent.VK_NUMPAD4:
            setSegments(false, true, true, true, false, true, false);
            break;
        case KeyEvent.VK_NUMPAD5:
            setSegments(true, true, false, true, false, true, true);
            break;
        case KeyEvent.VK_NUMPAD6:
            setSegments(false, true, false, true, true, true, true);
            break;
        case KeyEvent.VK_NUMPAD7:
            setSegments(true, false, true, false, false, true, false);
            break;
        case KeyEvent.VK_NUMPAD8:
            setSegments(true, true, true, true, true, true, true);
            break;
        case KeyEvent.VK_NUMPAD9:
            setSegments(true, true, true, true, false, true, true);
            break;
    }
}

void setSegments(boolean... set)
{
    for(int i = 0; i < segments.length; i++)
    {
        segments[i].set(set[i]);
    }
}
