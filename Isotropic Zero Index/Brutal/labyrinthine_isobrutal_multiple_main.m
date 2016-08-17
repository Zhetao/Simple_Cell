function labyrinthine_isobrutal_multiple_main
aIntval = 0.004;
bIntval = 0.0003;
aStart = 0.0001;
aEnd = 0.0055001;
b2Start = 0.00077;
b2End = 0.0052;
b1Start = 0.0007;
meshSize = 6; %2-9 
%model = labyrinthine_isotropic_COMSOL;
figure('Visible','off')

aNum = floor((aEnd-aStart)/aIntval)+1;

bNum = 0;
for b2 = b2Start:bIntval:b2End
    for b1 = b1Start:bIntval:(b2-0.000501)
        bNum = bNum +1;
    end
end
totNum = aNum*aNum*bNum;
display(totNum)
counter = 0;
for b2 = b2Start:bIntval:b2End 
    for b1 = b1Start:bIntval:(b2-0.000501)
        %for a3 = aStart:aIntval:aEnd
            clf 
            hold on
            figName = ['C:\Research\Simple_Cell\Isotropic Zero Index\Brutal\Res\' num2str(b1) '_'  num2str(b2) 'trans.png'];
            legNum = 1;
            for a2 = aStart:aIntval:aEnd
               for a1 = aStart:aIntval:aEnd
                    tic
                    [phaseList, transList] = Trans_brutal(meshSize, a1,a2,b1,b2);
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

            saveas(gcf,figName,'png');
            hold off
       % end
    end
end
