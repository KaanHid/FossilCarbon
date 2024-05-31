%% Gaussian Distribution 95% interval - FC-GAS accumulation uncertainty
range = readmatrix('1995_2019_durables.xlsx','sheet','Figure 3');
range=range(2:26,8);
temp=zeros(200,1);
m=length(range);% m是污水厂的数量
n=100000;% n是循环次数 
std_dev=0.3*range;
conf_interval = zeros(2, length(range)); % Initialize matrix for confidence intervals

for i = 1:length(range)
    samples = normrnd(range(i), std_dev(i), [1, n]);
    conf_interval(1, i) = prctile(samples, 5);  % Lower 5%
    conf_interval(2, i) = prctile(samples, 95); % Upper 95%
end
conf_interval=conf_interval';
sum(conf_interval,2)
EF_IPCC_CH4_pro_sim=zeros(m,n);
for i=1:m
    if range(i,1)~=conf_interval(i,2) && conf_interval(i,1)~=0
    EF_IPCC_CH4_pro_sim(i,:)=random(makedist('Triangular','A',conf_interval(i,1),'B',range(i,1),'C',conf_interval(i,2)),1,n); 
    end
end
Low_Est=quantile(EF_IPCC_CH4_pro_sim,0.05,2);% EF_IPCC_CH4_pro_sim 上下边界
High_Est=quantile(EF_IPCC_CH4_pro_sim,0.95,2);

%% Ratio 5% increase - Gaussian Distribution 95% interval
range = readmatrix('1995_2019_durables.xlsx','sheet','2011_ratio_+5%');
range=range(:,9);

m=length(range);% m是污水厂的数量
n=100000;% n是循环次数 
std_dev=0.25*range;
conf_interval = zeros(2, length(range)); % Initialize matrix for confidence intervals

for i = 1:length(range)
    samples = normrnd(range(i)*1.01, std_dev(i), [1, n]);%sclaing of the ratio
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
range = readmatrix('Uncertainty_GAS_FCC.xlsx','sheet','FCC_Low_MCS_1%');
range=range(4:end,3);

m=length(range);% m是污水厂的数量
n=100000;% n是循环次数 
std_dev=0.25*range;
conf_interval = zeros(2, length(range)); % Initialize matrix for confidence intervals

for i = 1:length(range)
    samples = normrnd(range(i)*1.02, std_dev(i), [1, n]);%sclaing of the ratio
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





