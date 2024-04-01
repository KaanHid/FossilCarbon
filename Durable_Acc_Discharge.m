%Durable Lifetime 2011
%LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet','lifetime_funct_normal','PreserveVariableNames',true);
%baseline
LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet','LT_funct_baseline','PreserveVariableNames',true);
%triangular
%LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet','lifetime_funct_triangular','PreserveVariableNames',true);

LifeTime.Properties.RowNames=string(table2array(LifeTime(:,1)));
LifeTime(:,1:2)=[];%read and arrange LT data
LifeTime(1,:)=[];%read and arrange LT data
LifeTime=table2array(LifeTime);
LifeTime(isnan(LifeTime))=0;

durables=[55,57,62,63,81,96,97,104,117,118,119,120,121,122,123,125];
%durables HSUT index, plastic lifetime assumed same as rubber

durableLT=LifeTime(durables,:);
%normal distribution for MV, LT 14 years, mean =14/2 years,sd= 14/4 years
mvlt=zeros(1,size(durableLT,2));
MVLT=[0.016169801,0.027488222,0.043066146,0.062183156,0.082747884,0.101481862,0.114701036,0.119479569,0.114701036,0.101481862,0.082747884,0.062183156,0.043066146,0.027488222];
mvlt(1:length(MVLT))=MVLT;
durableLT(15,:)=mvlt;%Lifetime matrix of durables

mix=readtable('Figure 1 Detailed Flows.xlsx','Sheet','2011 Durable Mix','PreserveVariableNames',true);
mix=mix(13:28,[1,2,4]);
mix.Properties.RowNames=string(table2array(mix(:,2)));
mix(:,2)=[];
mix=table2array(mix);

%years=readtable('DurablesUsed2011.xlsx','Sheet','Summary Sheet','PreserveVariableNames',true);
years=readtable('1995_2019_durables.xlsx','Sheet','Figure 3','PreserveVariableNames',true);

years=table2array(years(1:25,[2,8]));
%years(26,:)=[];
est=[];
for i=1:length(years)
est(:,i)=years(i,2)'.*mix(:,2)/100;
end

sum(est(:,17))
sum(sum(est))
sum(sum(durableLT))
discharge=[];
for i=1:16 %number of durable products
    for j=1:25%number of years
        for k=1:size(LifeTime,2) %eol lifespan
        discharge(i,k,j)=durableLT(i,k)*est(i,j);
        end
    end
    i
end
sum(sum(sum(discharge)))
sum(sum(est))
%discharge=permute(discharge, [1 3 2]); % order in dimensions: durables, discharge years, number of years
%discharge(18,:,:)=sum(dischare
sum(sum(discharge(:,:,24)))
discharge=discharge/(sum(sum(sum(discharge)))/sum(sum(est)));
discharge=squeeze(sum(discharge));
discharge=permute(discharge, [2 1]);

xlswrite(['EoLUncertainty.xlsx'],discharge',sheet,'Triangular');

%% Triangular
%triangular
LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet','lifetime_funct_triangular','PreserveVariableNames',true);

LifeTime.Properties.RowNames=string(table2array(LifeTime(:,1)));
LifeTime(:,1:2)=[];%read and arrange LT data
%LifeTime(1,:)=[];%read and arrange LT data
LifeTime=table2array(LifeTime);
LifeTime(isnan(LifeTime))=0;

durables=[55,57,62,63,81,96,97,104,117,118,119,120,121,122,123,125];
%durables HSUT index, plastic lifetime assumed same as rubber

durableLT=LifeTime(durables,:);
%normal distribution for MV, LT 14 years, mean =mean/2 years,sd= mean/4 years
mvlt=zeros(1,size(durableLT,2));
MVLT=[0.016169801,0.027488222,0.043066146,0.062183156,0.082747884,0.101481862,0.114701036,0.119479569,0.114701036,0.101481862,0.082747884,0.062183156,0.043066146,0.027488222];
mvlt(1:length(MVLT))=MVLT;
durableLT(15,:)=mvlt;%Lifetime matrix of durables

mix=readtable('Figure 1 Detailed Flows.xlsx','Sheet','2011 Durable Mix','PreserveVariableNames',true);
mix=mix(13:28,[1,2,4]);
mix.Properties.RowNames=string(table2array(mix(:,2)));
mix(:,2)=[];
mix=table2array(mix);

%years=readtable('DurablesUsed2011.xlsx','Sheet','Summary Sheet','PreserveVariableNames',true);
years=readtable('1995_2019_durables.xlsx','Sheet','Figure 3','PreserveVariableNames',true);

years=table2array(years(1:25,[2,8]));
%years(26,:)=[];
%Extrapolation
est=[];
for i=1:length(years)
est(:,i)=years(i,2)'.*mix(:,2)/100;
end

sum(est(:,17))
sum(sum(est))
sum(sum(durableLT))
discharge=[];
for i=1:16 %number of durable products
    for j=1:25%number of years
        for k=1:size(durableLT,2) %number of discharge years
        discharge(i,k,j)=durableLT(i,k)*est(i,j);
        end
    end
    i
end
sum(sum(sum(discharge)))
sum(sum(est))
%discharge=permute(discharge, [1 3 2]); % order in dimensions: durables, discharge years, number of years
%
sum(sum(discharge(:,:,24)))
%discharge=discharge/(sum(sum(sum(discharge)))/sum(sum(est)));
discharge=squeeze(sum(discharge));
discharge=permute(discharge, [2 1]);

xlswrite(['EoLUncertainty.xlsx'],discharge,'Triangular');
%% lifetime + 25%

LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet',5,'PreserveVariableNames',true);

LifeTime.Properties.RowNames=string(table2array(LifeTime(:,1)));
LifeTime(:,1:3)=[];%read and arrange LT data
LifeTime(1,:)=[];%read and arrange LT data
LifeTime=table2array(LifeTime);
LifeTime(isnan(LifeTime))=0;

sum(est(:,17))
sum(sum(est))
sum(sum(durableLT))
discharge=[];
for i=1:16 %number of durable products
    for j=1:25%number of years
        for k=1:size(LifeTime,2) %number of discharge years
        discharge(i,k,j)=LifeTime(i,k)*est(i,j);
        end
    end
    i
end
sum(sum(sum(discharge)))
sum(sum(est))
%discharge=permute(discharge, [1 3 2]); % order in dimensions: durables, discharge years, number of years
%
sum(sum(discharge(:,:,24)))
%discharge=discharge/(sum(sum(sum(discharge)))/sum(sum(est)));
discharge=squeeze(sum(discharge));
discharge=permute(discharge, [2 1]);

xlswrite(['EoLUncertainty.xlsx'],discharge,'lifetime + 25%');
%% lifetime + 50%
LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet',6,'PreserveVariableNames',true);

LifeTime.Properties.RowNames=string(table2array(LifeTime(:,1)));
LifeTime(:,1:3)=[];%read and arrange LT data
LifeTime(1,:)=[];%read and arrange LT data
LifeTime=table2array(LifeTime);
LifeTime(isnan(LifeTime))=0;

sum(est(:,17))
sum(sum(est))
discharge=[];
for i=1:16 %number of durable products
    for j=1:25%number of years
        for k=1:size(LifeTime,2) %number of discharge years
        discharge(i,k,j)=LifeTime(i,k)*est(i,j);
        end
    end
    i
end
sum(sum(sum(discharge)))
sum(sum(est))
%discharge=permute(discharge, [1 3 2]); % order in dimensions: durables, discharge years, number of years
%
sum(sum(discharge(:,:,24)))
%discharge=discharge/(sum(sum(sum(discharge)))/sum(sum(est)));
discharge=squeeze(sum(discharge));
discharge=permute(discharge, [2 1]);

xlswrite(['EoLUncertainty.xlsx'],discharge,'lifetime + 55%');
%% lifetime - 25%
LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet',7,'PreserveVariableNames',true);

LifeTime.Properties.RowNames=string(table2array(LifeTime(:,1)));
LifeTime(:,1:3)=[];%read and arrange LT data
LifeTime(1,:)=[];%read and arrange LT data
LifeTime=table2array(LifeTime);
LifeTime(isnan(LifeTime))=0;

sum(est(:,17))
sum(sum(durableLT))
discharge=[];
for i=1:16 %number of durable products
    for j=1:25%number of years
        for k=1:size(LifeTime,2) %number of discharge years
        discharge(i,k,j)=LifeTime(i,k)*est(i,j);
        end
    end
    i
end
sum(sum(sum(discharge)))

%discharge=permute(discharge, [1 3 2]); % order in dimensions: durables, discharge years, number of years
%
sum(sum(discharge(:,:,24)))
%discharge=discharge/(sum(sum(sum(discharge)))/sum(sum(est)));
discharge=squeeze(sum(discharge));
discharge=permute(discharge, [2 1]);

xlswrite(['EoLUncertainty.xlsx'],discharge,'lifetime - 25%');
%% lifetime - 50%
LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet',8,'PreserveVariableNames',true);

LifeTime.Properties.RowNames=string(table2array(LifeTime(:,1)));
LifeTime(:,1:3)=[];%read and arrange LT data
LifeTime(1,:)=[];%read and arrange LT data
LifeTime=table2array(LifeTime);
LifeTime(isnan(LifeTime))=0;

sum(est(:,17))
sum(sum(durableLT))
discharge=[];
for i=1:16 %number of durable products
    for j=1:25%number of years
        for k=1:size(LifeTime,2) %number of discharge years
        discharge(i,k,j)=LifeTime(i,k)*est(i,j);
        end
    end
    i
end
sum(sum(sum(discharge)))

%discharge=permute(discharge, [1 3 2]); % order in dimensions: durables, discharge years, number of years
%
sum(sum(discharge(:,:,24)))
%discharge=discharge/(sum(sum(sum(discharge)))/sum(sum(est)));
discharge=squeeze(sum(discharge));
discharge=permute(discharge, [2 1]);

xlswrite(['EoLUncertainty.xlsx'],discharge,'lifetime - 50%');

%% s.dev. + 25%
LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet',9,'PreserveVariableNames',true);

LifeTime.Properties.RowNames=string(table2array(LifeTime(:,1)));
LifeTime(:,1:3)=[];%read and arrange LT data
LifeTime(1,:)=[];%read and arrange LT data
LifeTime=table2array(LifeTime);
LifeTime(isnan(LifeTime))=0;

sum(est(:,17))
sum(sum(durableLT))
discharge=[];
for i=1:16 %number of durable products
    for j=1:25%number of years
        for k=1:size(LifeTime,2) %number of discharge years
        discharge(i,k,j)=LifeTime(i,k)*est(i,j);
        end
    end
    i
end
sum(sum(sum(discharge)))

%discharge=permute(discharge, [1 3 2]); % order in dimensions: durables, discharge years, number of years
%
sum(sum(discharge(:,:,24)))
%discharge=discharge/(sum(sum(sum(discharge)))/sum(sum(est)));
discharge=squeeze(sum(discharge));
discharge=permute(discharge, [2 1]);

xlswrite(['EoLUncertainty.xlsx'],discharge,'sd + 25%');
%% s.dev. + 50%
LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet',10,'PreserveVariableNames',true);

LifeTime.Properties.RowNames=string(table2array(LifeTime(:,1)));
LifeTime(:,1:3)=[];%read and arrange LT data
LifeTime(1,:)=[];%read and arrange LT data
LifeTime=table2array(LifeTime);
LifeTime(isnan(LifeTime))=0;

sum(est(:,17))
sum(sum(durableLT))
discharge=[];
for i=1:16 %number of durable products
    for j=1:25%number of years
        for k=1:size(LifeTime,2) %number of discharge years
        discharge(i,k,j)=LifeTime(i,k)*est(i,j);
        end
    end
    i
end
sum(sum(sum(discharge)))

%discharge=permute(discharge, [1 3 2]); % order in dimensions: durables, discharge years, number of years
%
sum(sum(discharge(:,:,24)))
%discharge=discharge/(sum(sum(sum(discharge)))/sum(sum(est)));
discharge=squeeze(sum(discharge));
discharge=permute(discharge, [2 1]);

xlswrite(['EoLUncertainty.xlsx'],discharge,'sd + 50%');
%% s.dev. - 25%
LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet',11,'PreserveVariableNames',true);

LifeTime.Properties.RowNames=string(table2array(LifeTime(:,1)));
LifeTime(:,1:3)=[];%read and arrange LT data
LifeTime(1,:)=[];%read and arrange LT data
LifeTime=table2array(LifeTime);
LifeTime(isnan(LifeTime))=0;

sum(est(:,17))
sum(sum(durableLT))
discharge=[];
for i=1:16 %number of durable products
    for j=1:25%number of years
        for k=1:size(LifeTime,2) %number of discharge years
        discharge(i,k,j)=LifeTime(i,k)*est(i,j);
        end
    end
    i
end
sum(sum(sum(discharge)))

%discharge=permute(discharge, [1 3 2]); % order in dimensions: durables, discharge years, number of years
%
sum(sum(discharge(:,:,24)))
%discharge=discharge/(sum(sum(sum(discharge)))/sum(sum(est)));
discharge=squeeze(sum(discharge));
discharge=permute(discharge, [2 1]);

xlswrite(['EoLUncertainty.xlsx'],discharge,'sd - 25%');
%% s.dev. - 50%
LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet',12,'PreserveVariableNames',true);

LifeTime.Properties.RowNames=string(table2array(LifeTime(:,1)));
LifeTime(:,1:3)=[];%read and arrange LT data
LifeTime(1,:)=[];%read and arrange LT data
LifeTime=table2array(LifeTime);
LifeTime(isnan(LifeTime))=0;

sum(est(:,17))
sum(sum(durableLT))
discharge=[];
for i=1:16 %number of durable products
    for j=1:25%number of years
        for k=1:size(LifeTime,2) %number of discharge years
        discharge(i,k,j)=LifeTime(i,k)*est(i,j);
        end
    end
    i
end
sum(sum(sum(discharge)))

%discharge=permute(discharge, [1 3 2]); % order in dimensions: durables, discharge years, number of years
%
sum(sum(discharge(:,:,24)))
%discharge=discharge/(sum(sum(sum(discharge)))/sum(sum(est)));
discharge=squeeze(sum(discharge));
discharge=permute(discharge, [2 1]);

xlswrite(['EoLUncertainty.xlsx'],discharge,'sd - 50%');