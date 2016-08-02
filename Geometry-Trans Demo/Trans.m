function goal = Trans(model, a1,a2,a3,b1,b2)
%model = mphload('labyrinthine3_matlab.mph');
model.param.set('a1', num2str(a1));
model.param.set('a2', num2str(a2));
model.param.set('a3', num2str(a3));
model.param.set('b1', num2str(b1));
model.param.set('b2', num2str(b2));
model.study('std1').run;
list = mphglobal(model,{'abs(s21)'});



goal = list;
