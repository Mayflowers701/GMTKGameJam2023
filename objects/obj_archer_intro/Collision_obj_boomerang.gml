/// @description Collect Boomerang

if( !bow && !other.held && !other.hold_cooldown ){
	boomerang = true;
	other.held = true;
}

holding = other.id;
