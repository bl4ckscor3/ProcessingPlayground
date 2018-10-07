class TheSnake
{
    ArrayList<PVector> positions = new ArrayList<PVector>();
    PVector head; //variable is only for easier and more intuitive access, it's the same datum as positions.get(0)
    PVector direction = new PVector(1, 0);
    int moveSpeed = 10;
    
    TheSnake(int moveSpeed)
    {
        this.moveSpeed = moveSpeed;
        positions.add(new PVector());
        head = positions.get(0);
    }
    
    void draw()
    {
        fill(255);
        
        for (PVector v : positions)
        {
            rect(v.x, v.y, moveSpeed, moveSpeed);
        }
    }

    boolean tryEat(PVector food)
    {
        if(head.x == food.x && head.y == food.y)
        {
            positions.add(positions.get(positions.size() - 1).copy());
            return true;
        }
        else return false;
    }
    
    void checkDeath()
    {
        for(int i = 1; i < positions.size(); i++)
        {
            if(head.x == positions.get(i).x && head.y == positions.get(i).y)
            {
                positions.clear();
                positions.add(new PVector());
                head = positions.get(0);
                setDirection(1, 0);
                return;
            }
        }
    }

    void move()
    {
        checkDeath();
        positions.remove(positions.size() - 1);
        positions.add(0, head.copy());
        head.x = wrap((int)(head.x + direction.x * moveSpeed), 0, width);
        head.y = wrap((int)(head.y + direction.y * moveSpeed), 0, height);
    }

    void setDirection(int x, int y)
    {
        direction.x = x;
        direction.y = y;
    }
    
    /**
     * Constrains the snake to the bound of min and max.
     * If value exceed a bound, the method will wrap it around to the other bound.
     */
    int wrap(int value, int min, int max)
    {
        if(value > max)
            return min;
        else if(value < min)
            return max;
        else return value;
    }
}
