/// @description Collect Bow

if( !bow && !other.held && !other.hold_cooldown ){
	bow = true;
	other.held = true;
}

holding = other.id;