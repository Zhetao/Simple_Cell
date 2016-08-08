function out = labyrinthine3_eigfreq_COMSOL
%
% labyrinthine3_2D_COMSOL.m
%
% Model exported on Aug 7 2016, 23:51 by COMSOL 5.2.0.220.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Research\Simple_Cell\Eigenfrequency Analysis');

model.label('labyrinthine3_matlab - Copy.mph');

model.comments(['Untitled\n\n']);

model.param.set('W', '0.1');
model.param.set('H', '0.025');
model.param.set('a1', '0.00260');
model.param.set('b1', '0.00138');
model.param.set('a2', '0.00408');
model.param.set('b2', '0.00485');
model.param.set('a3', '0.00725');
model.param.set('b3', '0.015');
model.param.set('b4', '0.0084');
model.param.set('a4', '0.006');
model.param.set('a5', '0.006');
model.param.set('b5', '0.0117');
model.param.set('d', '0.001');
model.param.set('D', '0.0008');

model.modelNode.create('comp1');

model.geom.create('geom1', 2);

model.mesh.create('mesh1', 'geom1');

model.geom('geom1').selection.create('csel1', 'CumulativeSelection');
model.geom('geom1').selection('csel1').label('Cumulative Selection 1');
model.geom('geom1').create('r1', 'Rectangle');
model.geom('geom1').feature('r1').set('size', {'W' 'H'});
model.geom('geom1').feature('r1').set('base', 'center');
model.geom('geom1').feature('r1').set('pos', {'0' '0'});
model.geom('geom1').create('b1', 'BezierPolygon');
model.geom('geom1').feature('b1').active(false);
model.geom('geom1').feature('b1').set('p', {'-b1' '-b1'; 'H/2-a1' '-H/2'});
model.geom('geom1').feature('b1').set('contributeto', 'csel1');
model.geom('geom1').feature('b1').set('w', {'1' '1'});
model.geom('geom1').feature('b1').set('degree', {'1'});
model.geom('geom1').create('b2', 'BezierPolygon');
model.geom('geom1').feature('b2').active(false);
model.geom('geom1').feature('b2').set('p', {'-b2' '-b2'; 'H/2' 'a2-H/2'});
model.geom('geom1').feature('b2').set('contributeto', 'csel1');
model.geom('geom1').feature('b2').set('w', {'1' '1'});
model.geom('geom1').feature('b2').set('degree', {'1'});
model.geom('geom1').create('b3', 'BezierPolygon');
model.geom('geom1').feature('b3').active(false);
model.geom('geom1').feature('b3').set('p', {'-b3' '-b3'; 'H/2-a3' '-H/2'});
model.geom('geom1').feature('b3').set('contributeto', 'csel1');
model.geom('geom1').feature('b3').set('w', {'1' '1'});
model.geom('geom1').feature('b3').set('degree', {'1'});
model.geom('geom1').create('r2', 'Rectangle');
model.geom('geom1').feature('r2').set('size', {'d' 'H-a1-2*D'});
model.geom('geom1').feature('r2').set('base', 'center');
model.geom('geom1').feature('r2').set('contributeto', 'csel1');
model.geom('geom1').feature('r2').set('pos', {'-b1' '-a1/2'});
model.geom('geom1').create('r3', 'Rectangle');
model.geom('geom1').feature('r3').set('size', {'d' 'H-a2-2*D'});
model.geom('geom1').feature('r3').set('base', 'center');
model.geom('geom1').feature('r3').set('contributeto', 'csel1');
model.geom('geom1').feature('r3').set('pos', {'-b2' 'a2/2'});
model.geom('geom1').create('r4', 'Rectangle');
model.geom('geom1').feature('r4').set('size', {'d' 'H-a3-2*D'});
model.geom('geom1').feature('r4').set('base', 'center');
model.geom('geom1').feature('r4').set('contributeto', 'csel1');
model.geom('geom1').feature('r4').set('pos', {'-b3+d/2' '-a3/2'});
model.geom('geom1').create('rot1', 'Rotate');
model.geom('geom1').feature('rot1').set('keep', true);
model.geom('geom1').feature('rot1').set('rot', '180');
model.geom('geom1').feature('rot1').selection('input').named('csel1');
model.geom('geom1').create('r5', 'Rectangle');
model.geom('geom1').feature('r5').set('size', {'2*b3' 'D'});
model.geom('geom1').feature('r5').set('base', 'center');
model.geom('geom1').feature('r5').set('pos', {'0' '-H/2+D/2'});
model.geom('geom1').create('r6', 'Rectangle');
model.geom('geom1').feature('r6').set('size', {'2*b3' 'D'});
model.geom('geom1').feature('r6').set('base', 'center');
model.geom('geom1').feature('r6').set('pos', {'0' 'H/2-D/2'});
model.geom('geom1').run;
model.geom('geom1').run('fin');

model.variable.create('var1');
model.variable('var1').model('comp1');
model.variable('var1').set('p_i', 'exp(-1i*acpr.k*x)[Pa]');
model.variable('var1').set('s11', 'intop1(acpr.p_t-p_i)/intop1(p_i)');
model.variable('var1').set('s21', 'intop2(acpr.p_t)/intop1(p_i)');

model.material.create('mat1', 'Common', 'comp1');

model.cpl.create('intop1', 'Integration', 'geom1');
model.cpl.create('intop2', 'Integration', 'geom1');
model.cpl('intop1').selection.geom('geom1', 1);
model.cpl('intop1').selection.set([1]);
model.cpl('intop2').selection.geom('geom1', 1);
model.cpl('intop2').selection.set([42]);

model.physics.create('acpr', 'PressureAcoustics', 'geom1');
model.physics('acpr').selection.set([1]);
model.physics('acpr').create('pwr1', 'PlaneWaveRadiation', 1);
model.physics('acpr').feature('pwr1').selection.set([1 42]);
model.physics('acpr').feature('pwr1').create('ipf1', 'IncidentPressureField', 1);
model.physics('acpr').feature('pwr1').feature('ipf1').selection.set([1 2 3 5 7 11 13 16 20 23 26 30 36 38 41]);
model.physics('acpr').create('ishb1', 'InteriorSoundHard', 1);

model.mesh('mesh1').autoMeshSize(1);

model.material('mat1').label('Air 1');
model.material('mat1').propertyGroup('def').set('density', '1.25*(1-0.005*i)');
model.material('mat1').propertyGroup('def').set('soundspeed', '343/(1-0.005*i)');

model.physics('acpr').feature('pwr1').feature('ipf1').set('dir', {'1'; '0'; '0'});
model.physics('acpr').feature('pwr1').feature('ipf1').set('pamp', '1');

model.mesh('mesh1').run;
model.study.create('std1');
model.study('std1').create('freq', 'Frequency');
model.study('std1').feature('freq').set('plist', 'range(100,100,4000)');


out = model;