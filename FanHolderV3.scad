// Cooling Fan Bracket
$fs = 0.2;		// Circle edges 


fan_length = 46;
fan_width = 30;
// fan_width = 30;


wall_thickness = 5;
pillar_width=12.0;
pillar_length=10.0;
pillar_height=41.0;

fan_dist = 38.5;  // gap between fan mount posts
pillar_distx = 5; // distance from left side to pillar left side
pillar_disty = 5; // distance from front side to pillar front side


m4_bolt = 2.2;
m3_bolt = 1.75;
m25_bolt = 1.2;


difference()
	{
	union()
		{
		cube(size=[fan_length, fan_width, wall_thickness] );
	
		translate(v=[0,-18,0] )
			cube(size=[20,30, wall_thickness]);

		// Cable guide
		translate(v=[8,-13,2] )
			rotate(a=[-20,0,0])
				cube(size=[10, wall_thickness/2, 15]);
		
		}

	translate(v=[m3_bolt * 2, fan_width - m3_bolt * 3, 0 ] )
		cylinder(r=m3_bolt, h=wall_thickness );
	translate(v=[m3_bolt * 2 + fan_dist, fan_width - m3_bolt * 3, 0 ] )
		cylinder(r=m3_bolt, h=wall_thickness );

	translate(v=[m3_bolt * 2, fan_width - m3_bolt * 3 - fan_dist, 0 ] )
		cylinder(r=m3_bolt, h=wall_thickness );

	translate(v=[0,-10,0] )
			cube(size=[8,10, wall_thickness]);

	}



translate(v=[pillar_distx, pillar_disty,5 ] )
	rotate(a=[-20, 0,0 ] )
		bracket();

translate(v=[pillar_distx, pillar_disty + pillar_width,5 ] )
	rotate(a=[-20, 0,0 ] )
		cube(size=[20, 5, pillar_height+8] );




module bracket()
	{
	difference()
		{
		union()
			{
			cube( size=[pillar_length, pillar_width, pillar_height] );
	
			translate(v=[0, pillar_width/2, pillar_height] )
				rotate( a=[0,90,0] )
					cylinder(r=pillar_width/2, h=pillar_length);
			}
			translate(v=[-0.5, pillar_width/2, pillar_height] )
				rotate( a=[0,90,0] )
					cylinder(r=m3_bolt, h=pillar_length+1);

			translate(v=[-0.5, pillar_width/2, pillar_height-5] )
				rotate( a=[0,90,0] )
					cylinder(r=m3_bolt, h=pillar_length+1);

		}
}