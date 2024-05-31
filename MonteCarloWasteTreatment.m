clc
tic

%range = readtable('Figure 4.xlsx','sheet','Monte Carlo');
range = readtable('Carbon Content.xls','sheet','SUT_Products_C_Range');
FCC=[table2array(range(:,5)),table2array(range(:,4)),table2array(range(:,6))];
durables=string(table2array(range(1:10,1)));
%FCC=table2array(range(1:10,[2:4]));
m=length(FCC);% m是污水厂的数量
n=100000;% n是循环次数 

%% 5% Margin
sim10=zeros(m,n);
for i=1:m
    if FCC(i,1)~=FCC(i,2) && FCC(i,1)~=FCC(i,3)
    sim10(i,:)=random(makedist('Triangular','A',FCC(i,1),'B',(FCC(i,1)+FCC(i,3))/2,'C',FCC(i,3)),1,n); 
    end
end
Low_5=quantile(sim10,0.025,2);% EF_IPCC_CH4_pro_sim 上下边界
High_5=quantile(sim10,0.975,2);

for i=1:10
if Low_5(i)==0
    Low_5(i)=FCC(i,2);
end
if High_5(i)==0
    High_5(i)=FCC(i,2);
end

end


wastetreatment=table2array(range(15:24,2:5));
sum(sum(wastetreatment))

newrange=[Low_5,FCC(:,2),High_5];

WasteLow5=wastetreatment./FCC(:,2).*Low_5;
WasteLow5ErrMar=sum(wastetreatment)-sum(wastetreatment./FCC(:,1).*Low_5);
sum(sum(WasteLow5))

WasteHigh5=sum(sum(wastetreatment./FCC(:,2).*High_5));
WasteHigh5ErrMar=sum(wastetreatment)-sum(wastetreatment./FCC(:,3).*Low_5);
sum(sum(WasteHigh5))
writematrix(newrange,'Discharge to Landfill.xlsx','sheet','New Monte Carlo Range');

% %% 10% Margin
% sim10=zeros(m,n);
% for i=1:m
%     sim10(i,:)=random(makedist('Triangular','A',MarH(i,1),'B',MarH(i,2),'C',MarH(i,3)),1,n); 
% end
% Low_10=quantile(sim10,0.025,2);% EF_IPCC_CH4_pro_sim 上下边界
% High_10=quantile(sim10,0.975,2);
% sum(sum(FCC))
% 
% WasteLow10=sum(FCC./MarH(:,2).*Low_10)
% WasteLow10ErrMar=sum(FCC)-sum(FCC./MarH(:,2).*Low_10)
% 
% WasteHigh10=sum(sum(FCC./MarH(:,2).*High_10))
% WasteHigh10ErrMar=sum(FCC./MarH(:,2).*High_10)-sum(FCC)






