function labyrinthine_brutal_main
intval = 0.0008;
aStart = 0.0001;
aEnd = 0.0013;
meshSize = 6; %2-9 
model = labyrinthine_brutal_COMSOL;
figure('Visible','off')

for a1 = aStart:intval:aEnd
    for a2 = aStart:intval:aEnd
        for a3 = aStart:intval:aEnd
            for b2 = 0.0001:intval:0.0015
                for b1 = 0.0001:intval:b2
                    figName = ['C:\Research\Simple_Cell\Brutal_Force\Test\' num2str(a1) '_' num2str(a2) '_' num2str(a3) '_' num2str(b1) '_' num2str(b2) '.png'];
                    transList = Trans(model,a1,a2,a3,b1,b2,meshSize);
                    plot(linspace(100,4000,40)',transList)
                    saveas(gcf,figName,'png');
                    display('aha')
                end
            end
        end
    end
end
