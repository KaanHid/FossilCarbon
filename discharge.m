%%
LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet','lifetime_funct','PreserveVariableNames',true);
LifeTime.Properties.RowNames=string(table2array(LifeTime(:,1)));
LifeTime(:,1:3)=[];%read and arrange LT data

durables=[55,57,58,62,81,86,96,97,104,117,118,119,120,121,122,125];%durables HSUT index
durableLT=table2array(LifeTime(durables,:));
MVLT=[0.109,0.211,0.317,0.217,0.116,0.011,	0.008,	0.006,0.003,0.0005,0.0005,0.0004,0.0004,0.0002];
mvlt=zeros(1,99);
mvlt(1:length(MVLT))=MVLT;
durableLT=[durableLT ;mvlt];%Lifetime matrix of durables
%mix of FC in durables, 2011,  according to mass
mix=[0.026045,0.003259,0.003022,0.011648,0.248192,0.182133,0.061722,0.122233,0.030213,0.109685,0.018231,0.070826,0.041724,0.017422,0.030564,0.023082];
%Estimated mass for years according to GDP per sector per years, from Exiobase monetary tables, deflators applied
%to real gdp
years=readtable('DurablesUsed2011.xlsx','Sheet','Summary Sheet','PreserveVariableNames',true);
%Estimation of Discharge for FC Excel Sheet ---> FC Acc. Each Year Durable
years=table2array(years(:,[3,4]));
sum(sum(years(:,2)))
sum(sum(est))

est=[];
for i=1:length(years)
est(:,i)=mix(:,2)'.*years(i,1)';
end

discharge=[];
for i=1:16 %number of durable products
    for j=1:16%number of years
        for k=1:99 %number of discharge years
        discharge(i,j,k)=durableLT(i,k)*est(i,j);
        end
    end
    i
end
sum(sum(sum(discharge)))
discharge=permute(discharge, [1 3 2]);

for i=1:size(discharge,3)
    xlswrite('discharge.xlsx',discharge(:,:,i),i);
end

dischargeperyear=sum(discharge,1);
dischargeperyear=squeeze(dischargeperyear);
xlswrite('dischargeperyear.xlsx',dischargeperyear');
permute(sum(discharge,1), [2 1]);


sum(sum(use_d.*UseFCBal.*durablesSUT))