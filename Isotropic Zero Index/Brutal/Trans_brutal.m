function [phaseList, transList] = Trans_brutal(meshSize, a1,a2,b1,b2)
model = labyrinthine_isobrutal_COMSOL;
model.param.set('a1', num2str(a1));
model.param.set('a2', num2str(a2));
model.param.set('b1', num2str(b1));
model.param.set('b2', num2str(b2));
%model.param.set('b3', num2str(b3));
model.mesh('mesh1').autoMeshSize(meshSize);


model.study('std1').run;
transList = mphglobal(model,{'abs(s21)'});
phaseList = mphglobal(model,{'arg(intop2(p_i)/intop2(acpr.p_t))*180/pi'});

