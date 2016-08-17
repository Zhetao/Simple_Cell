function out = model
%
% Labyrinthine3__EigOpt_opt.m
%
% Model exported on Aug 17 2016, 14:13 by COMSOL 5.2.0.220.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Research\Simple_Cell\Eigenfrequency Opt');

model.label('Labyrinthine3__EigOpt_matlab.mph');

model.comments(['Untitled\n\n']);

model.param.set('W', '0.1');
model.param.set('H', '0.025');
model.param.set('a1', '0.845[mm]', '0.845[mm]');
model.param.set('b1', '0.845[mm]', '0.845[mm]');
model.param.set('a2', '1.22[mm]', '1.22[mm]');
model.param.set('b2', '3.45[mm]', '3.45[mm]');
model.param.set('a3', '7.24[mm]', '7.24[mm]');
model.param.set('b3', '0.0125');
model.param.set('b4', '0.0084');
model.param.set('a4', '0.006');
model.param.set('a5', '0.006');
model.param.set('b5', '0.0117');
model.param.set('d', '0.001');
model.param.set('D', '0.001');
model.param.set('loss', '0.005', '0.026');

model.modelNode.create('comp1');

model.geom.create('geom1', 2);

model.file.create('libres1');
model.file.create('libres2');
model.file.create('libres3');
model.file.create('libres4');
model.file.create('libres5');
model.file.create('libres6');
model.file.create('libres7');
model.file.create('libres8');
model.file.create('libres9');
model.file.create('libres10');
model.file.create('libres11');
model.file.create('libres12');
model.file.create('libres13');
model.file.create('libres14');
model.file.create('libres15');
model.file.create('libres16');
model.file.create('libres17');
model.file.create('libres18');
model.file.create('libres19');
model.file.create('libres20');
model.file.create('libres21');
model.file.create('libres22');
model.file.create('libres23');
model.file.create('libres24');
model.file.create('libres25');
model.file.create('libres26');

model.mesh.create('mesh1', 'geom1');

model.geom('geom1').selection.create('csel1', 'CumulativeSelection');
model.geom('geom1').selection('csel1').label('Cumulative Selection 1');
model.geom('geom1').create('r1', 'Rectangle');
model.geom('geom1').feature('r1').set('size', {'W' 'H'});
model.geom('geom1').feature('r1').set('base', 'center');
model.geom('geom1').feature('r1').set('pos', {'0' '0'});
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
model.geom('geom1').feature('r5').set('contributeto', 'csel1');
model.geom('geom1').feature('r5').set('pos', {'-b3' '-H/2'});
model.geom('geom1').create('r6', 'Rectangle');
model.geom('geom1').feature('r6').set('size', {'2*b3' 'D'});
model.geom('geom1').feature('r6').set('contributeto', 'csel1');
model.geom('geom1').feature('r6').set('pos', {'-b3' 'H/2-D'});
model.geom('geom1').create('uni1', 'Union');
model.geom('geom1').feature('uni1').set('intbnd', false);
model.geom('geom1').feature('uni1').selection('input').set({'r2' 'r3' 'r4' 'r5' 'r6' 'rot1'});
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
model.cpl('intop2').selection.set([36]);

model.physics.create('acpr', 'PressureAcoustics', 'geom1');
model.physics('acpr').selection.set([1]);
model.physics('acpr').create('pwr1', 'PlaneWaveRadiation', 1);
model.physics('acpr').feature('pwr1').selection.set([1 36]);
model.physics('acpr').feature('pwr1').create('ipf1', 'IncidentPressureField', 1);
model.physics('acpr').feature('pwr1').feature('ipf1').selection.set([1 2 3 5 9 10 12 20 28 32 35]);
model.physics('acpr').create('ishb1', 'InteriorSoundHard', 1);

model.mesh('mesh1').autoMeshSize(1);

model.ode.create('conpar1');
model.ode.create('conpar2');
model.ode.create('conpar3');
model.ode.create('conpar4');
model.ode.create('conpar5');

model.material('mat1').label('Air 1');
model.material('mat1').propertyGroup('def').set('density', '1.25*(1-loss*i)');
model.material('mat1').propertyGroup('def').set('soundspeed', '343/(1-loss*i)');

model.physics('acpr').feature('pwr1').feature('ipf1').set('dir', {'1'; '0'; '0'});
model.physics('acpr').feature('pwr1').feature('ipf1').set('pamp', '1');

model.mesh('mesh1').run;

model.ode('conpar1').state({'a1'});
model.ode('conpar2').state({'a2'});
model.ode('conpar3').state({'a3'});
model.ode('conpar4').state({'b1'});
model.ode('conpar5').state({'b2'});

model.study.create('std1');
model.study('std1').create('eig', 'Eigenfrequency');
model.study.create('std2');
model.study('std2').create('opt', 'Optimization');
model.study('std1').feature('eig').set('shiftactive', true);
model.study('std1').feature('eig').set('shift', '100[Hz]');
model.study('std2').feature('opt').set('constrmethod', 'augLagrange');
model.study('std2').feature('opt').set('pname', {'a1' 'a2' 'a3' 'b1' 'b2'});
model.study('std2').feature('opt').set('optobjEvaluateFor', {''});
model.study('std2').feature('opt').set('optobj', {'xxx'});
model.study('std2').feature('opt').set('initval', {'0.845[mm]' '1.22[mm]' '7.24[mm]' '0.845[mm]' '3.45[mm]'});
model.study('std2').feature('opt').set('scale', {'1' '1' '1' '1' '1'});
model.study('std2').feature('opt').set('lbound', {'0.1[mm]' '0.1[mm]' '1[mm]' '0.5[mm]' '3[mm]'});
model.study('std2').feature('opt').set('descr', {''});
model.study('std2').feature('opt').set('opttol', '0.0001');
model.study('std2').feature('opt').set('ubound', {'4[mm]' '4[mm]' '8[mm]' '2[mm]' '5[mm]'});
model.study('std2').feature('opt').set('optsolver', 'bobyqa');

out = model;
