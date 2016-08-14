function labyrinthine_brutal_main
intval = 0.0003;
aStart = 0.0001;
aEnd = 0.0013;
meshSize = 6; %2-9 
%model = labyrinthine_brutal_COMSOL;
figure('Visible','off')

aNum = floor((aEnd-aStart)/intval)+1;
bNum = floor((0.0015-0.0001)/intval)+1;
totNum = aNum*aNum*aNum*bNum*(bNum-1)/2;
counter = 0;
for a1 = aStart:intval:aEnd
    for a2 = aStart:intval:aEnd
        for a3 = aStart:intval:aEnd
            for b2 = 0.0001:intval:0.0015
                for b1 = 0.0001:intval:(b2-0.00001)
                    tic
                    figName = ['C:\Research\Simple_Cell\Brutal_Force\Test\' num2str(a1) '_' num2str(a2) '_' num2str(a3) '_' num2str(b1) '_' num2str(b2) '.png'];
                    transList = Trans_brutal(a1*0.0003,a2,a3,b1,b2,meshSize);
                    plot(linspace(100,4000,40)',transList)
                    ylim([0,1])
                    saveas(gcf,figName,'png');
                    counter = counter +1;
                    display(['Finish ' num2str(counter) ' in ' num2str(totNum)])
                    toc
                end
            end
        end
    end
end
