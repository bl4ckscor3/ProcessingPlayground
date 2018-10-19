Cell[][] cells;
ArrayList<Cell> path = new ArrayList<Cell>();
Cell current;

void setup()
{
    size(600, 600);
    frameRate(1000);
    cells = new Cell[width / Cell.cellSize][height / Cell.cellSize];
    
    for(int x = 0; x < cells.length; x++)
    {
        for(int y = 0; y < cells[x].length; y++)
        {
            cells[x][y] = new Cell(x, y);
        }
    }
    
    current = cells[30][30];
    current.visited = true;
    path.add(current);
}

void draw()
{
    update();
    background(51);
    
    for(Cell[] row : cells)
    {
        for(Cell col : row)
        {
            col.draw();
        }
    }
    
    fill(color(0, 255, 0));
    noStroke();
    
    if(current != null)
        rect(current.x * Cell.cellSize, current.y * Cell.cellSize, Cell.cellSize, Cell.cellSize);
}

void update()
{
    Direction direction = null;
    Cell next = null;
    
    while(true) //check if a cell only has visited neighbors, if so go to previous position and repeat check until a non visited neighbor has been found
    {
        int amountVisited = 0;
        
        if(current.y - 1 >= 0)
        {
            if(cells[current.x][current.y - 1].visited)
                amountVisited++;
        }
        else
            amountVisited++; //no cell there to visit, so say that another cells has been visited for amountVisited == 4 check below
        
        if(current.x + 1 < cells.length)
        {
            if(cells[current.x + 1][current.y].visited)
                amountVisited++;
        }
        else
            amountVisited++; //no cell there to visit, so say that another cells has been visited for amountVisited == 4 check below
            
        if(current.y + 1 < cells[current.x].length)
        {
            if(cells[current.x][current.y + 1].visited)
                amountVisited++;
        }
        else
            amountVisited++; //no cell there to visit, so say that another cells has been visited for amountVisited == 4 check below
            
        if(current.x - 1 >= 0)
        {
            if(cells[current.x - 1][current.y].visited)
                amountVisited++;
        }
        else
            amountVisited++; //no cell there to visit, so say that another cells has been visited for amountVisited == 4 check below
        
        if(amountVisited == 4)
        {
            if(path.size() != 0)
            {
                current = path.get(path.size() - 1);
                path.remove(path.size() - 1);
            }
            else
            {
                current = null;
                noLoop();
                return;
            }
        }
        else
            break;
    }
    
    boolean found = false;
    
    while(!found)
    {
        direction = Direction.fromIndex((int)Math.floor(random(0, 4)));
        
        try
        {
            switch(direction)
            {
                case TOP:
                    next = cells[current.x][current.y - 1];
                    
                    if(!next.visited)
                        found = true;
                    break;
                case RIGHT:
                    next = cells[current.x + 1][current.y];
                    
                    if(!next.visited)
                        found = true;
                    break;
                case BOTTOM:
                    next = cells[current.x][current.y + 1];
                    
                    if(!next.visited)
                        found = true;
                    break;
                case LEFT:
                    next = cells[current.x - 1][current.y];
                    
                    if(!next.visited)
                        found = true;
                    break;
            }
        }
        catch(ArrayIndexOutOfBoundsException e){}
    }

    if(direction != null && next != null) //shouldn't happen that one of them is null
    {
        current.removeWall(direction);
        next.removeWall(direction.opposite());
        current = next;
        current.visited = true;
        path.add(current);
    }
}
