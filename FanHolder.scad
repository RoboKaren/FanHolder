// Cooling Fan Bracket
$fs = 0.2;		// Circle edges 


bearing_id = 8.0;
bearing_od = 22.0;
bearing_w = 7.0;

fan_length = 46;
fan_width = 20;

wall_thickness = 3;
pillar_width=8.0;
pillar_height=20.0;

fan_dist = 38.0 ;
bracket_dist = 16.0;


widget_offset = 10; // amount of x-travel to side of y-tray
bearing_offset = -0.5; // amount of bearing height from tray

m4_bolt = 2.05;
m3_bolt = 1.55;



difference()
	{
	cube(size=[fan_length, fan_width, wall_thickness] );
	
	translate(v=[m3_bolt * 2, fan_width - m3_bolt * 2, 0 ] )
		cylinder(r=m3_bolt, h=wall_thickness );
	translate(v=[m3_bolt * 2 + fan_dist, fan_width - m3_bolt * 2, 0 ] )
		cylinder(r=m3_bolt, h=wall_thickness );
	}



translate(v=[pillar_width , 0,0 ] )
	bracket();

translate(v=[pillar_width * 2 + bracket_dist, 0,0 ] )
	bracket();




module bracket()
	{
	difference()
		{
		union()
			{
			cube( size=[pillar_width, pillar_width, pillar_height] );
	
			translate(v=[0, pillar_width/2, pillar_height] )
				rotate( a=[0,90,0] )
					cylinder(r=pillar_width/2, h=pillar_width);
			}
			translate(v=[0, pillar_width/2, pillar_height] )
				rotate( a=[0,90,0] )
					cylinder(r=m4_bolt, h=pillar_width);
		}
}