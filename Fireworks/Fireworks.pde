color[] colorPool = {
    #e6194b, #3cb44b, #ffe119, #4363d8, #f58231, #911eb4,
    #46f0f0, #f032e6, #bcf60c, #fabebe, #008080, #e6beff,
    #9a6324, #fffac8, #800000, #aaffc3, #808000, #ffd8b1,
    #000075, #808080
};
ArrayList<Firework> fireworks = new ArrayList<Firework>();
float chance = 0.1;

void setup()
{
    size(1000, 800);
    strokeWeight(2);
}

void draw()
{
    background(51);
    
    if(random(1) <= chance) //spawn a firework
        fireworks.add(new Firework(floor(random(width)), floor(random(height / 5, height - height / 3)), colorPool[floor(random(colorPool.length))], floor(random(8, 180)), floor(random(20, 150))));
    
    for(Firework f : (ArrayList<Firework>)fireworks.clone())
    {
        if(f.dead)
        {
            fireworks.remove(f);
            continue;
        }
        
        f.update();
        f.draw();
    }
}
