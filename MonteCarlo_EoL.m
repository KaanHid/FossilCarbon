%% Gaussian Distribution 95% interval - FC-GAS accumulation uncertainty
range = readmatrix('EoLUncertainty.xlsx','sheet','Summary');
range=range(2,2:26);
temp=zeros(1,length(range));
m=length(range);% m是污水厂的数量
n=100000;% n是循环次数 
std_dev=0.25*range;
conf_interval = zeros(2, length(range)); % Initialize matrix for confidence intervals

for i = 1:length(range)
    samples = normrnd(range(i), std_dev(i), [1, n]);
    conf_interval(1, i) = prctile(samples, 5);  % Lower 5%
    conf_interval(2, i) = prctile(samples, 95); % Upper 95%
end
%conf_interval=conf_interval';
sum(conf_interval,2)
EF_IPCC_CH4_pro_sim=zeros(m,n);
for i=1:m
    if range(1,i)~=conf_interval(2,i) && conf_interval(1,i)~=0
    EF_IPCC_CH4_pro_sim(i,:)=random(makedist('Triangular','A',conf_interval(1,i),'B',range(1,i),'C',conf_interval(2,i)),1,n); 
    end
end
Low_Est=quantile(EF_IPCC_CH4_pro_sim,0.05,2);% EF_IPCC_CH4_pro_sim 上下边界
High_Est=quantile(EF_IPCC_CH4_pro_sim,0.95,2);

Low_Est=Low_Est';
High_Est=High_Est';

%% Ratio 5% increase - Gaussian Distribution 95% interval
range = readmatrix('1995_2019_durables.xlsx','sheet','2011_ratio_+5%');
range=range(:,9);

m=length(range);% m是污水厂的数量
n=100000;% n是循环次数 
std_dev=0.25*range;
conf_interval = zeros(2, length(range)); % Initialize matrix for confidence intervals

for i = 1:length(range)
    samples = normrnd(range(i)*1.1, std_dev(i), [1, n]);%sclaing of the ratio
    conf_interval(1, i) = prctile(samples, 5);  % Lower 5%
    conf_interval(2, i) = prctile(samples, 95); % Upper 95%
end
conf_interval=conf_interval';
%sum(conf_interval,2)
EF_IPCC_CH4_pro_sim=zeros(m,n);
for i=1:m
    if range(i,1)~=conf_interval(i,2) && conf_interval(i,1)~=0
    EF_IPCC_CH4_pro_sim(i,:)=random(makedist('Triangular','A',conf_interval(i,1),'B',range(i,1),'C',conf_interval(i,2)),1,n); 
    end
end
Low_Est=quantile(EF_IPCC_CH4_pro_sim,0.05,2);% EF_IPCC_CH4_pro_sim 上下边界
High_Est=quantile(EF_IPCC_CH4_pro_sim,0.95,2);

%% FCC 5% increase 
range = readmatrix('Uncertainty Combined.xlsx','sheet','FCC_Low_MCS');
range=range(4:end,3);

m=length(range);% m是污水厂的数量
n=100000;% n是循环次数 
std_dev=0.25*range;
conf_interval = zeros(2, length(range)); % Initialize matrix for confidence intervals

for i = 1:length(range)
    samples = normrnd(range(i)*0.9, std_dev(i), [1, n]);%sclaing of the ratio
    conf_interval(1, i) = prctile(samples, 5);  % Lower 5%
    conf_interval(2, i) = prctile(samples, 95); % Upper 95%
end
conf_interval=conf_interval';
%sum(conf_interval,2)
EF_IPCC_CH4_pro_sim=zeros(m,n);
for i=1:m
    if range(i,1)~=conf_interval(i,2) && conf_interval(i,1)~=0
    EF_IPCC_CH4_pro_sim(i,:)=random(makedist('Triangular','A',conf_interval(i,1),'B',range(i,1),'C',conf_interval(i,2)),1,n); 
    end
end
Low_Est=quantile(EF_IPCC_CH4_pro_sim,0.05,2);% EF_IPCC_CH4_pro_sim 上下边界
High_Est=quantile(EF_IPCC_CH4_pro_sim,0.95,2);
High_Est(High_Est>1)=1;

%% Use Low-Defualt-High
sum(sum(use_d.*CC_low.*durablesSUT))
sum(sum(use_d.*repmat(cc_range(:,1),48,1).*durablesSUT))
sum(sum(use_d.*CC_up.*durablesSUT))
%% FD Low-Defualt-High
sum(sum(table2array(FD).*CC_low.*durablesSUT))
sum(sum(table2array(FD).*repmat(cc_range(:,1),48,1).*durablesSUT))
sum(sum(table2array(FD).*CC_up.*durablesSUT))
%% MV_Use Low-Defualt-High
sum(sum(table2array(MVUse).*Low_Est))
sum(sum(table2array(MVUse).*WasteFC))
sum(sum(table2array(MVUse).*High_Est))
%% MV_FD Low-Default-High
sum(sum(table2array(MVFD).*Low_Est))
sum(sum(table2array(MVFD).*WasteFC))
sum(sum(table2array(MVFD).*High_Est))





