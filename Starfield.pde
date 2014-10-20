int normLength = 200;
Particle[] chubz = new Particle[normLength];
boolean scatter = false;
boolean clock = false;

void setup()
{
	background(0);
	size(300,300);
	rectMode(CENTER);
	rect(150, 150, 90, 90);
	for (int i = 0; i < normLength-1; ++i) 
	{
		if(i%2 == 0)
		{
			chubz[i] = new NormalParticle();
		}
		else
		{
			chubz[i] = new OddballParticle();
		}
	}
	chubz[normLength-1] = new Jumbo();
	/*chubz[normLength-3] = new OddballParticle();
	chubz[normLength-2] = new OddballParticle();
	chubz[normLength-1] = new OddballParticle();*/

}
void draw()
{
	//background(0);
	//ellipse(150, 150, 200, 200);
	for (int i = 0; i < normLength; ++i) 
	{
		chubz[i].move();
		chubz[i].show();
	}
}

void keyPressed()
{
	if(key == '0')
	{
		scatter = !scatter;
	}
	if(key == CODED)
	{
		if(keyCode == LEFT)
		{
			clock = false;
		}
		if(keyCode == RIGHT)
		{
			clock = true;
		}
	}

}

class NormalParticle implements Particle
{
	double x, y, distance, angle, centerX, centerY, siz1, siz2;
	NormalParticle()
	{
		centerX = 150;
		centerY = 250;
		distance = 50.0;
		siz1 = 10.0;
		siz2 = 5.0;
		angle = (Math.random()*2)*Math.PI;

	}
	public void move()
	{
		x = centerX + Math.cos(angle)*distance;
		y = centerY + Math.sin(angle)*distance;
		
		if(clock)
		{
			angle -= 0.04;
			if(centerX < 250 && centerY == 50)
			{
				centerX+=2;
			}
			if(centerX == 50 && centerY > 50)
			{
				centerY-=2;
			}
			if(centerX > 50 && centerY == 250)
			{
				centerX-=2;
			}
			if(centerX == 250 && centerY < 250)
			{
				centerY+=2;
			}
			
		}
		else if(!clock)
		{
			angle += 0.04;
			if(centerX < 250 && centerY == 250)
			{
				centerX+=2;
			}
			if(centerX == 250 && centerY > 50)
			{
				centerY-=2;
			}
			if(centerX > 50 && centerY == 50)
			{
				centerX-=2;
			}
			if(centerX == 50 && centerY < 250)
			{
				centerY+=2;
			}
		}
		//distance+=0.15;
	}
	public void show()
	{

		if(!scatter)
		{
			stroke(255);
			fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
			ellipse((float)x, (float)y, (float)siz1, (float)siz1);
		}
		else 
		{
			stroke(0);
			fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
			ellipse((float)x+((float)(Math.random()*7)-3), (float)y+((float)(Math.random()*7)-3), (float)siz2, (float)siz2);
			ellipse((float)x-((float)(Math.random()*7)-3), (float)y-((float)(Math.random()*7)-3), (float)siz2, (float)siz2);
		}
	}
}

interface Particle
{
	public void move();
	public void show();
}

class OddballParticle implements Particle
{
	double x, y, distance, angle, centerX, centerY, siz;
	OddballParticle()
	{
		centerX = 120;
		centerY = 170;
		distance = 13.0;
		siz = 3.75;
		angle = (Math.random()*2)*Math.PI;
	}
	public void move()
	{
		x = centerX + Math.cos(angle)*distance;
		y = centerY + Math.sin(angle)*distance;
		angle += 0.055;
		if(!clock)
		{
			angle -= 0.04;
			if(centerX < 180 && centerY == 120)
			{
				centerX+=2;
			}
			if(centerX == 120 && centerY > 120)
			{
				centerY-=2;
			}
			if(centerX > 120 && centerY == 180)
			{
				centerX-=2;
			}
			if(centerX == 180 && centerY < 180)
			{
				centerY+=2;
			}

		}
		else
		{
			angle += 0.04;
			if(centerX < 180 && centerY == 180)
			{
				centerX+=2;
			}
			if(centerX == 180 && centerY > 120)
			{
				centerY-=2;
			}
			if(centerX > 120 && centerY == 120)
			{
				centerX-=2;
			}
			if(centerX == 120 && centerY < 180)
			{
				centerY+=2;
			}
		}
		//distance+=0.15;
	}
	public void show()
	{
		if(scatter)
		{
			stroke(255);
			fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
			ellipse((float)x, (float)y, 5, 5);
		}
		else 
		{
			stroke(0);
			fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
			ellipse((float)x+((float)(Math.random()*3)-1), (float)y+((float)(Math.random()*3)-1), (float)siz, (float)siz);
			ellipse((float)x-((float)(Math.random()*3)-1), (float)y-((float)(Math.random()*3)-1), (float)siz, (float)siz);
		}
	}
}

class Jumbo extends NormalParticle
{
Jumbo()
{
siz1 = 40.0;
siz2 = 20.0;
}
}


