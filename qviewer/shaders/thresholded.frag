/*****************************************************************************\

thresholded.frag

qviewer is distributed under the terms of the GNU General Public License.
See the COPYING file for details.

\*****************************************************************************/

// interpolated values
varying vec3			  vert_pos_camera;
varying vec3			  vert_normal_camera;

void main()
{
	float diffuse = max(dot(normalize(vert_normal_camera), -normalize(vert_pos_camera)),0.0);
	
	vec4 out_col;
	if(diffuse > 0.4)
	 	out_col.rgb = vec3(1);
	else
	 	out_col.rgb = vec3(0);
  out_col.a = 1.0;
  gl_FragColor = out_col;
}
