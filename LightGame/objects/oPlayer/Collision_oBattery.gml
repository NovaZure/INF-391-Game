
//Destroy the battery object
instance_destroy(other);

//Add charge to the player and adjust charge rate
charge = min(maxCharge, charge + 40);
chargeRate -= 0.01;

playerScore += 100;