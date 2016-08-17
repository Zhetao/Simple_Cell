function goal = CompFreq(a1,a2,a3,b1,b2)
model = Labyrinthine3__EigOpt_setup;
model.param.set('a1', num2str(a1));
model.param.set('a2', num2str(a2));
model.param.set('a3', num2str(a3));
model.param.set('b1', num2str(b1));
model.param.set('b2', num2str(b2));
%model.param.set('b3', num2str(b3));
%model.mesh('mesh1').autoMeshSize(meshSize);


model.study('std1').run;
temp = mphglobal(model,{'freq'});
display(temp);
goal = sum(temp);