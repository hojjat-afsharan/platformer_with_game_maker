/// @description 

#region input
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_jump = keyboard_check_pressed(vk_space);
#endregion 

#region movement

	#region Horizontal movement
		var move = key_right - key_left;
		hsp = move * walksp;
	
		if(place_meeting(x+hsp, y, wall_obj)){
			//if too near the wall
			while(!place_meeting(x+sign(hsp), y, wall_obj)){
				x += sign(hsp);
			}
			hsp = 0;
		}
		x += hsp;
	#endregion
	
	#region Verical movement
		vsp += grv;
		
		//jump
		if(key_jump and place_meeting(x, y+1, wall_obj)){
			vsp = -7;
		}
		if(place_meeting(x, y+vsp, wall_obj)){
			//if too near to ground
			while(!place_meeting(x, y+sign(vsp), wall_obj)){
				y += sign(vsp);
			}
			vsp = 0;
		}
		y += vsp;
	#endregion

#endregion