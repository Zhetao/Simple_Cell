function [tranList, phaseList] = Trans(model, a1,a2,a3,b1,b2, b3)
%model = mphload('labyrinthine3_matlab.mph');
model.param.set('a1', num2str(a1));
model.param.set('a2', num2str(a2));
model.param.set('a3', num2str(a3));
model.param.set('b1', num2str(b1));
model.param.set('b2', num2str(b2));
model.param.set('b3', num2str(b3));
model.study('std1').run;
tranList = mphglobal(model,{'abs(s21)'});
phaseList = mphglobal(model,{'arg(intop2(p_i)/intop2(acpr.p_t))*180/pi'});

