final int depth = 10;

void setup()
{
    size(900, 900);
}

void draw()
{
    noLoop();
    color(0);
    branch(0, height / 2, width / 2, height, width / 2, height / 2);
}

void branch(int d, int length, int x1, int y1, int x2, int y2)
{
    if(d == depth)
        return;

    int newLength = length / 2;

    d++;
    line(x1, y1, x2, y2);

    //right branch
    pushMatrix();
    translate(x2, y2);
    rotate(radians(33));
    branch(d, newLength, 0, 0, 0, -newLength);
    popMatrix();
    
    //left branch
    pushMatrix();
    translate(x2, y2);
    rotate(radians(-33));
    branch(d, newLength, 0, 0, 0, -newLength);
    popMatrix();
}
