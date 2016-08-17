function out = labyrinthine_isotropic_COMSOL
%
% labyrinthine_isotropic_COMSOL.m
%
% Model exported on Aug 15 2016, 13:24 by COMSOL 5.2.0.220.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Research\Simple_Cell\Isotropic Zero Index\Brutal');

model.label('Isotropic.mph');

model.comments(['Untitled\n\n']);

model.param.set('a1', '0.42[mm]');
model.param.set('a2', '0.61[mm]');
model.param.set('a3', '3.62[mm]');
model.param.set('b1', '0.42[mm]');
model.param.set('b2', '1.72[mm]');
model.param.set('b3', '6.25[mm]');
model.param.set('H', '12.5[mm]');
model.param.set('W', '0.1');
model.param.set('d', '0.5[mm]');
model.param.set('inc_W', '100[mm]');
model.param.set('inc_H', '26[mm]');
model.param.set('loss', '0.005');

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
model.geom('geom1').feature('r1').set('size', {'d' 'H-a3-d'});
model.geom('geom1').feature('r1').set('base', 'center');
model.geom('geom1').feature('r1').set('contributeto', 'csel1');
model.geom('geom1').feature('r1').set('pos', {'0' 'H/2+a3/2'});
model.geom('geom1').create('r2', 'Rectangle');
model.geom('geom1').feature('r2').set('size', {'d' 'H-a2-3/2*d'});
model.geom('geom1').feature('r2').set('base', 'center');
model.geom('geom1').feature('r2').set('contributeto', 'csel1');
model.geom('geom1').feature('r2').set('pos', {'b2-b3' 'H/2-a2/2-1/4*d'});
model.geom('geom1').create('r3', 'Rectangle');
model.geom('geom1').feature('r3').set('size', {'d' 'H-a1-d'});
model.geom('geom1').feature('r3').set('base', 'center');
model.geom('geom1').feature('r3').set('contributeto', 'csel1');
model.geom('geom1').feature('r3').set('pos', {'b1-b3' 'H/2+a1/2'});
model.geom('geom1').create('rot1', 'Rotate');
model.geom('geom1').feature('rot1').set('pos', {'-b3' 'H/2'});
model.geom('geom1').feature('rot1').set('contributeto', 'csel1');
model.geom('geom1').feature('rot1').set('keep', true);
model.geom('geom1').feature('rot1').set('rot', '180');
model.geom('geom1').feature('rot1').selection('input').named('csel1');
model.geom('geom1').create('r4', 'Rectangle');
model.geom('geom1').feature('r4').set('size', {'b2+b3+d' 'd'});
model.geom('geom1').feature('r4').set('contributeto', 'csel1');
model.geom('geom1').feature('r4').set('pos', {'-b2-b3-d/2' 'H-d/2'});
model.geom('geom1').create('rot2', 'Rotate');
model.geom('geom1').feature('rot2').set('keep', true);
model.geom('geom1').feature('rot2').set('rot', '90');
model.geom('geom1').feature('rot2').selection('input').named('csel1');
model.geom('geom1').create('rot3', 'Rotate');
model.geom('geom1').feature('rot3').set('keep', true);
model.geom('geom1').feature('rot3').set('rot', '180');
model.geom('geom1').feature('rot3').selection('input').named('csel1');
model.geom('geom1').create('r5', 'Rectangle');
model.geom('geom1').feature('r5').set('size', {'inc_W' 'inc_H'});
model.geom('geom1').feature('r5').set('base', 'center');
model.geom('geom1').run;
model.geom('geom1').run('fin');

model.variable.create('var1');
model.variable('var1').model('comp1');
model.variable('var1').set('p_i', 'exp(-1i*acpr.k*x)[Pa]');
model.variable('var1').set('s11', 'intop1(acpr.p_t-p_i)/intop1(p_i)');
model.variable('var1').set('s21', 'intop2(acpr.p_t)/intop1(p_i)');

model.material.create('mat1', 'Common', 'comp1');
model.material('mat1').selection.set([1]);

model.cpl.create('intop1', 'Integration', 'geom1');
model.cpl.create('intop2', 'Integration', 'geom1');
model.cpl('intop1').selection.geom('geom1', 1);
model.cpl('intop1').selection.set([1]);
model.cpl('intop2').selection.geom('geom1', 1);
model.cpl('intop2').selection.set([124]);

model.physics.create('acpr', 'PressureAcoustics', 'geom1');
model.physics('acpr').selection.set([1]);
model.physics('acpr').create('ishb1', 'InteriorSoundHard', 1);
model.physics('acpr').feature('ishb1').selection.all;
model.physics('acpr').create('pwr1', 'PlaneWaveRadiation', 1);
model.physics('acpr').feature('pwr1').selection.set([1 124]);
model.physics('acpr').feature('pwr1').create('ipf1', 'IncidentPressureField', 1);
model.physics('acpr').feature('pwr1').feature('ipf1').selection.set([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123]);

model.mesh('mesh1').autoMeshSize(2);

model.material('mat1').label('Air 1');
model.material('mat1').propertyGroup('def').set('density', '1.25*(1-loss*i)');
model.material('mat1').propertyGroup('def').set('soundspeed', '343/(1-loss*i)');

model.physics('acpr').feature('pwr1').feature('ipf1').set('dir', {'1'; '0'; '0'});
model.physics('acpr').feature('pwr1').feature('ipf1').set('pamp', '1');

model.mesh('mesh1').run;

model.study.create('std1');
model.study('std1').create('freq', 'Frequency');
model.study('std1').feature('freq').set('plist', 'range(100,100,4000)');


out = model;
