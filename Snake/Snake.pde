int gridSize = 10;
TheSnake snake = new TheSnake(gridSize);
int move = 0;
PVector food;

void setup()
{
    size(600, 600);
    food = newFood();
}

void draw()
{
    background(0);
    noStroke();
    fill(color(255, 0, 0));
    rect(food.x, food.y, gridSize, gridSize);

    if(move++ == snake.moveSpeed)
    {
        move = 0;
        snake.move();
        
        if(snake.tryEat(food))
            food = newFood();
    }
    
    snake.draw();
}

void keyPressed()
{
    if(keyCode == LEFT && snake.direction.x != 1)
        snake.setDirection(-1, 0);
    else if(keyCode == RIGHT && snake.direction.x != -1)
        snake.setDirection(1, 0);
    else if(keyCode == UP && snake.direction.y != 1)
        snake.setDirection(0, -1);
    else if(keyCode == DOWN && snake.direction.y != -1)
        snake.setDirection(0, 1);
    else snake.positions.add(0, snake.head.copy());
}

PVector newFood()
{
    float x = floor(random(width));
    float y = floor(random(height));
    
    x = (int)(x / gridSize) * gridSize;
    y = (int)(y / gridSize) * gridSize;
    return new PVector(x, y);
}
