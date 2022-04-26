
speed = initialSpeed * ((lifespan - lifeCounter)/lifespan) + 0.1;
direction += lifeCounter/30;

if (lifeCounter >= lifespan) {
	//Self Destruct
	instance_destroy(self)
}

lifeCounter++;
