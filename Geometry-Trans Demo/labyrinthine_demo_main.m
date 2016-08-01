function out = model
%
% labyrinthine3_matlab.m
%
% Model exported on Aug 1 2016, 11:30 by COMSOL 5.2.0.220.
global model

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('/home/zhetao/Research/Simple_Cell');

model.label('labyrinthine3_matlab.mph');

model.comments(['Untitled\n\n']);

model.param.set('W', '0.1');
model.param.set('H', '0.025');
model.param.set('a1', '0.005');
model.param.set('b1', '0.003');
model.param.set('a2', '0.005');
model.param.set('b2', '0.009');
model.param.set('a3', '0.009');
model.param.set('b3', '0.015');
model.param.set('b4', '0.0084');
model.param.set('a4', '0.006');
model.param.set('a5', '0.006');
model.param.set('b5', '0.0117');

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
model.geom('geom1').feature('b1').set('p', {'-b1' '-b1'; 'H/2-a1' '-H/2'});
model.geom('geom1').feature('b1').set('contributeto', 'csel1');
model.geom('geom1').feature('b1').set('w', {'1' '1'});
model.geom('geom1').feature('b1').set('degree', {'1'});
model.geom('geom1').create('b2', 'BezierPolygon');
model.geom('geom1').feature('b2').set('p', {'-b2' '-b2'; 'H/2' 'a2-H/2'});
model.geom('geom1').feature('b2').set('contributeto', 'csel1');
model.geom('geom1').feature('b2').set('w', {'1' '1'});
model.geom('geom1').feature('b2').set('degree', {'1'});
model.geom('geom1').create('b3', 'BezierPolygon');
model.geom('geom1').feature('b3').set('p', {'-b3' '-b3'; 'H/2-a3' '-H/2'});
model.geom('geom1').feature('b3').set('contributeto', 'csel1');
model.geom('geom1').feature('b3').set('w', {'1' '1'});
model.geom('geom1').feature('b3').set('degree', {'1'});
model.geom('geom1').create('rot1', 'Rotate');
model.geom('geom1').feature('rot1').set('keep', true);
model.geom('geom1').feature('rot1').set('rot', '180');
model.geom('geom1').feature('rot1').selection('input').named('csel1');
model.geom('geom1').create('b4', 'BezierPolygon');
model.geom('geom1').feature('b4').active(false);
model.geom('geom1').feature('b4').set('p', {'-b4' '-b4'; 'H/2-a4' '-H/2'});
model.geom('geom1').feature('b4').set('contributeto', 'csel1');
model.geom('geom1').feature('b4').set('w', {'1' '1'});
model.geom('geom1').feature('b4').set('degree', {'1'});
model.geom('geom1').create('b5', 'BezierPolygon');
model.geom('geom1').feature('b5').active(false);
model.geom('geom1').feature('b5').set('p', {'-b5' '-b5'; 'H/2' 'a5-H/2'});
model.geom('geom1').feature('b5').set('contributeto', 'csel1');
model.geom('geom1').feature('b5').set('w', {'1' '1'});
model.geom('geom1').feature('b5').set('degree', {'1'});
model.geom('geom1').create('rot2', 'Rotate');
model.geom('geom1').feature('rot2').active(false);
model.geom('geom1').feature('rot2').set('keep', true);
model.geom('geom1').feature('rot2').set('rot', '180');
model.geom('geom1').feature('rot2').selection('input').named('csel1');
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
model.cpl('intop2').selection.set([16]);

model.physics.create('acpr', 'PressureAcoustics', 'geom1');
model.physics('acpr').create('pwr1', 'PlaneWaveRadiation', 1);
model.physics('acpr').feature('pwr1').selection.set([1 16]);
model.physics('acpr').feature('pwr1').create('ipf1', 'IncidentPressureField', 1);
model.physics('acpr').feature('pwr1').feature('ipf1').selection.set([1 2 3 5 7 9 11 13 15]);
model.physics('acpr').create('ishb1', 'InteriorSoundHard', 1);
model.physics('acpr').feature('ishb1').selection.set([4 6 8 10 12 14]);

model.mesh('mesh1').autoMeshSize(2);

model.view('view1').axis.set('abstractviewxscale', '7.392473344225436E-5');
model.view('view1').axis.set('ymin', '-0.03452884405851364');
model.view('view1').axis.set('xmax', '0.05249999836087227');
model.view('view1').axis.set('abstractviewyscale', '7.392473344225436E-5');
model.view('view1').axis.set('abstractviewbratio', '-0.859468400478363');
model.view('view1').axis.set('abstractviewtratio', '0.859468400478363');
model.view('view1').axis.set('abstractviewrratio', '0.049999989569187164');
model.view('view1').axis.set('xmin', '-0.05249999836087227');
model.view('view1').axis.set('abstractviewlratio', '-0.049999989569187164');
model.view('view1').axis.set('ymax', '0.03452884405851364');

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
