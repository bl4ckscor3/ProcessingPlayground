class Cell
{
    static final int cellSize = 10;
    int x, y;
    boolean wallTop, wallRight, wallBottom, wallLeft;
    boolean visited;
    
    Cell(int x, int y)
    {
        this.x = x;
        this.y = y;
        wallTop = true;
        wallRight = true;
        wallBottom = true;
        wallLeft = true;
    }
    
    void removeWall(Direction direction)
    {
        switch(direction)
        {
            case TOP: wallTop = false; break;
            case RIGHT: wallRight = false; break;
            case BOTTOM: wallBottom = false; break;
            case LEFT: wallLeft = false;
        }
    }
    
    void draw()
    {
        pushMatrix();
        translate(x * cellSize, y * cellSize);
        
        if(visited)
        {
            noStroke();
            fill(color(255, 100, 10));
            rect(0, 0, cellSize, cellSize);
            noFill();
            stroke(255);
            
            if(wallTop)
                line(0, 0, cellSize, 0);
                
            if(wallLeft)
                line(0, 0, 0, cellSize);
        }
        else
        {
            noFill();
            stroke(255);
        }
        
        if(wallRight)
            line(cellSize, 0, cellSize, cellSize);
    
        if(wallBottom)
            line(0, cellSize, cellSize, cellSize);
    
        popMatrix();
    }
}
