function labyrinthine_brutal_multiple_main
aIntval = 0.007;
bIntval = 0.002;
aStart = 0.002;
aEnd = 0.01100001;
meshSize = 6; %2-9 
%model = labyrinthine_brutal_COMSOL;
figure('Visible','off')

aNum = floor((aEnd-aStart)/aIntval)+1;
display(aNum)
bNum = floor((0.0145-0.001)/bIntval);
totNum = aNum*aNum*aNum*bNum*(bNum+1)/2;
counter = 0;
for b2 = 0.001:bIntval:0.0145
    for b1 = 0.001:bIntval:(b2-0.000001)
        for a3 = aStart:aIntval:aEnd
            clf 
            hold on
            figName = ['C:\Research\Simple_Cell\Brutal_Force\Phase\' num2str(b1) '_'  num2str(b2) '_' num2str(a3) 'trans.png'];
            legNum = 1;
            for a2 = aStart:aIntval:aEnd
               for a1 = aStart:aIntval:aEnd
                    tic
                    [phaseList, transList] = Trans_brutal(meshSize, a1,a2,a3,b1,b2);
                    plot(linspace(100,4000,40)',transList)
                    legendInfo{legNum} = ['a1 = ' num2str(a1) ', a2 = ' num2str(a2)];
                    %ylim([0,1])
                    counter = counter +1;
                    legNum = legNum +1;
                    display(['Finish ' num2str(counter) ' in ' num2str(totNum)])
                    toc
                end
            end
            l = legend(legendInfo);
            l.Location = 'southwest';
            display(['a3_' num2str(a3)])
            saveas(gcf,figName,'png');
            hold off
        end
    end
end
