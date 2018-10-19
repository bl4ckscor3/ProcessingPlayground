enum Direction
{
    TOP(0),
    RIGHT(1),
    BOTTOM(2),
    LEFT(3);
    
    int n;
    
    private Direction(int n)
    {
        this.n = n;
    }
    
    static Direction fromIndex(int n)
    {
        for(Direction d : values())
        {
            if(d.n == n)
                return d;
        }
        
        println("INVALID INDEX ERMAGHERD");
        return TOP;
    }
    
    Direction opposite()
    {
        switch(this)
        {
            case TOP:
                return BOTTOM;
            case RIGHT:
                return LEFT;
            case BOTTOM:
                return TOP;
            case LEFT:
                return RIGHT;
            default:
                println("THIS SHOULD NEVER HAPPEN ERMAGHERD");
                return TOP;
        }   
    }
}
