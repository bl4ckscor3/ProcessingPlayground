final int barWidth = 20;
final int barLength = 200;
final color backgroundColor = color(255, 100, 10);
final int barLengthPyth = (int)sqrt(pow(barLength, 2) * 2);
final int barWidthPyth = (int)sqrt(pow(barWidth, 2) * 2);
final int shapeHeight = (int)sqrt(pow(barLengthPyth / 2 + barWidthPyth, 2) + pow(barWidthPyth, 2)) - barWidthPyth / 2 - barWidth / 10;

void setup()
{
    size(800, 800);
}

void draw()
{
    noLoop();
    background(backgroundColor);
    noFill();
    translate(width / 2 + barWidthPyth / 2, height / 2 - shapeHeight + barWidthPyth / 2);
    drawTwoShapes(0, 0);
    translate(-barWidthPyth, barLengthPyth);
    rotate(radians(180));
    drawTwoShapes(0, 0);
}

void drawTwoShapes(int x, int y)
{
    drawShapePart(x, y, 45);
    drawShapePart(barLengthPyth / 2 - barWidthPyth / 2, shapeHeight, 135);
}

void drawShapePart(int x, int y, float rotation)
{
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    color white = color(255);
    color black = color(0);
    int corner = barWidth;
    
    for(int i = 0; i < barLength - barWidth; i++)
    {
        stroke(lerpColor(white, black, map(i, 0, barLength - barWidth, 1, 0)));
        
        if(i < barWidth)
            line(0, i, barLength - corner--, i);
        else
            line(0, i, barWidth, i);
    }
    
    popMatrix();
}
