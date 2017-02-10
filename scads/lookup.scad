
function get_cylinder_h(p) = lookup(p,
	[
		[ -200, 10 ],
		[ 100, 80 ],
		[  ]
	]);

for (i = [-400:5:400])
{
	// echo(i, get_cylinder_h(i));
	translate([ i, 0, 0 ]) cylinder(r1 = 12, r2 = 5, h = get_cylinder_h(i));
}
