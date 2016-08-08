function labyrinthine3_eigfreq_main
transList = Trans_eigfreq(2, 0.00260,0.00408,0.00725,0.00138,0.00485);
hold on 
plot(linspace(100,4000,40)',transList);
y1 = get(gca,'ylim');
hold on
plot([2053 2053],y1)
plot([2871 2871],y1)
plot([3732 3732],y1)
ylim([0,1])
